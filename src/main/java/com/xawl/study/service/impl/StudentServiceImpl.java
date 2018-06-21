package com.xawl.study.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xawl.study.dao.QAndAMapper;
import com.xawl.study.dao.ResourceClickLogsMapper;
import com.xawl.study.dao.StudentMapper;
import com.xawl.study.dao.StudentWorkMapper;
import com.xawl.study.model.Student;
import com.xawl.study.model.StudentVo;
import com.xawl.study.service.CourseLogsService;
import com.xawl.study.service.StudentService;
import com.xawl.study.utils.JedisClientPool;
import com.xawl.study.utils.JsonUtils;
import com.xawl.study.utils.Result;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	StudentMapper studentMapper;
	@Autowired
	QAndAMapper qAndAMapper;
	@Autowired
	StudentWorkMapper studentWorkMapper;
	@Autowired
	CourseLogsService courseLogsService;
	@Autowired
	ResourceClickLogsMapper resourceClickLogsMapper;
	@Autowired
	JedisClientPool jedisClientPool;

	// 登录
	public Result login(HttpServletRequest request, Student student) {
		Result result = new Result();
		List<Student> list = studentMapper.selectByAccountLogin(student
				.getAccount());
		if (list == null || list.size() <= 0) {
			result.setStatus(201);
			result.setMsg("账号不存在:请检查后重新登陆");
			return result;
		}
		if (!list.get(0).getPwd().equals(student.getPwd())) {
			result.setStatus(201);
			result.setMsg("密码错误:请重新登陆");
			return result;
		}
		if (list.get(0).getState() != 1) {
			result.setStatus(202);
			result.setMsg("您的账户没有激活，请前往邮箱激活");
			return result;
		}
		result.setMsg("ok");
		result.setStatus(200);
		result.setData(list.get(0));
		return result;
	}

	// 注册
	public Result regist(Student student) {
		Result result = checkStudentNews(student);
		if (result.getStatus() == 200) {
			studentMapper.insertSelective(student);
		}
		// jedisClientPool.hdel("findAllStudent","student");
		return result;
	}

	// 查询-全部
	public List<Student> findAll() {
		/*
		 * try { // 查询缓存 String hget = jedisClientPool.hget("findAllStudent",
		 * "student"); // 1有缓存 直接响应结果 if (StringUtils.isNotBlank(hget)) {
		 * List<Student> list = JsonUtils.jsonToList(hget, Student.class);
		 * return list; } } catch (Exception e) { e.printStackTrace(); }
		 */
		List<Student> studentList = studentMapper.findAll();
		/*
		 * try { // 2没缓存 查询 添加到缓存 jedisClientPool.hset("findAllStudent",
		 * "student", JsonUtils.objectToJson(studentList)); } catch (Exception
		 * e) { e.printStackTrace(); }
		 */

		return studentList;
	}

	// 主键
	public Student selectByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return studentMapper.selectByPrimaryKey(id);
	}

	// 学号
	public List<Student> selectByAccount(String account) {
		List<Student> studentList = studentMapper.selectByAccount(account);
		return studentList;
	}

	// 姓名
	public List<Student> selectBySname(String sname) {
		List<Student> studentList = studentMapper.selectByAccount(sname);
		return studentList;
	}

	// 删除-通过主键删除
	public int deleteByPrimaryKey(String id) {
		int deleteByPrimaryKey = studentMapper.deleteByPrimaryKey(id);
		jedisClientPool.hdel("findAllStudent", "student");
		return deleteByPrimaryKey;
	}

	// 删除多条
	public int deleteByIds(String ids, HttpServletRequest request) {
		// 存放在数组中2,3,45,34
		String[] checkedNums = ids.split(",");
		// 创建集合对象
		Student student = new Student();
		// 得到请求
		String path1 = request.getSession().getServletContext()
				.getRealPath("/");
		// 数组的循环：根据得到的id删除学生
		for (int i = 0; i < checkedNums.length; i++) {
			// System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^" +
			// checkedNums[i]);
			// 设置id
			student.setId(checkedNums[i]);
			// 根据id查找学生信息
			student = studentMapper.selectByPrimaryKey(student.getId());
			if (student == null) {
				return 0;
			}
		}
		jedisClientPool.hdel("findAllStudent", "student");
		return studentMapper.deleteByIds(checkedNums);
	}

	// 添加-学生信息
	// public int insert(Student student) {
	// return studentMapper.insert(student);
	// }
	public int insert(Student student) {
		jedisClientPool.hdel("findAllStudent", "student");
		return studentMapper.insert(student);
	}

	// 修改-通过主键修改部分信息
	public int updateByPrimaryKeySelective(Student student) {
		jedisClientPool.hdel("findAllStudent", "student");
		return studentMapper.updateByPrimaryKeySelective(student);
	}

	// 校验
	public Result checkStudentNews(Student student) {
		Result result = new Result();
		Map<String, String> map = new HashMap<String, String>();
		// Student student1=studentMapper.insert(student);
		// 校验学号-10位，不以0开头
		if (!student.getAccount().matches("[1-9][0-9]{9}")) {
			result.setStatus(201);
			map.put("account", "学号长度为10且不以0开头！");
		}
		// 密码-6-12位单词字符
		if (!student.getPwd().matches("[a-zA-Z1-9][a-zA-Z0-9]{5,11}")) {
			result.setStatus(201);
			map.put("pwd", "密码长度为6-12且不以0开头！");
		}
		// 邮箱 11111@qq.com
		if (!student.getE_mail().matches("[a-zA-Z1-9]\\w+@\\w{2,6}\\.\\w{2,3}")) {
			result.setStatus(201);
			map.put("email", "邮箱格式错误");
		}

		if (map.size() <= 0) {
			result.setMsg("ok");
			result.setStatus(200);
			return result;
		} else {
			result.setData(map);
			return result;
		}
	}

	/*
	 * public int insertSelective(Student record) { int
	 * insertSelective=studentMapper.insertSelective(record); return
	 * insertSelective; }
	 */

	public Integer findByAccount(String account) {
		Integer i = studentMapper.findByAccount(account);
		return i;
	}

	public Result updateByAccount(Student student, HttpServletRequest request) {
		try {
			Student student2 = (Student) request.getSession().getAttribute(
					"user_student");
			// System.out.println("student2="+student2);
			// System.out.println("student="+student);
			// System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
			if (!student2.getAccount().equals(student.getAccount())) {
				Integer number = this.findByAccount(student.getAccount());
				if (number != 0) {
					return Result.build(405, "用户名已经存在");
				}
			}
			qAndAMapper.updateOsnameBySid(student);
			qAndAMapper.updateTsnameBySid(student);
			studentWorkMapper.updatesnameBySid(student);
			courseLogsService.updateSnameBysid(student);
			resourceClickLogsMapper.updateSnameBysid(student);
			studentMapper.updateByPrimaryKeySelective(student);
			jedisClientPool.hdel("findAllStudent", "student");
			return Result.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "更新失败");
		}
	}

	// 修改-通过主键
	/*
	 * public int updateByPrimaryKey(Student student) { return
	 * studentMapper.updateByPrimaryKey(student); }
	 */

	public int updateCode(String code) {
		// TODO Auto-generated method stub
		Student student = studentMapper.selectByCode(code);
		if (student == null) {
			return 0;
		}
		if (student.getState() == 1) {
			return 2;
		}
		studentMapper.updateCodeByPrimaryKey(student.getId());
		return 1;
	}

	public Result findPass(String account, String email) {
		Student stu = new Student();
		stu.setAccount(account);
		stu.setE_mail(email);
		Student student = studentMapper.findPass(stu);
		if (student == null) {
			return Result.build(500, "用户名或邮箱错误");
		} else {
			return Result.ok();
		}
	}

	public Result updatePass(String id, String pwd) {
		Student stu = new Student();
		stu.setId(id);
		stu.setPwd(pwd);
		Integer status = studentMapper.updatePass(stu);
		if (status == 0) {
			return Result.build(500, "修改失败");
		} else {
			return Result.ok();
		}
	}

	public Result updatePassByAccount(String account, String pwd) {
		Student stu = new Student();
		stu.setAccount(account);
		stu.setPwd(pwd);
		Integer status = studentMapper.updatePassByAccount(stu);
		if (status == 0) {
			return Result.build(500, "修改失败");
		} else {
			return Result.ok();
		}
	}

	public List<StudentVo> selectByClassId(Integer classId) {
		List<StudentVo> list = studentMapper.selectByClassId(classId);
		return list;
	}

	public Result addStudent(Student student) {
		try {
			Integer number = findByAccount(student.getAccount());
			if (number != 0) {
				return Result.build(405, "学号已经存在");
			}
			student.setDate(new SimpleDateFormat("yyyy-MM-dd")
					.format(new Date()));
			studentMapper.insertSelective(student);
			jedisClientPool.hdel("findAllStudent", "student");
			return Result.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "添加失败");
		}
	}

	public Result updateStudent(Student student) {
		try {
			Integer number = findByAccount(student.getAccount());
			if (number != 0) {
				return Result.build(405, "学号已经存在");
			}
			studentMapper.updateByPrimaryKeySelective(student);
			jedisClientPool.hdel("findAllStudent", "student");
			return Result.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "修改失败");
		}
	}

	public Result updateResetPwd(Student student) {
		try {
			studentMapper.updatePassByAccount(student);
			return Result.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "添加失败");
		}
	}

	@Override
	public Student selectById(Integer sid) {
		return studentMapper.selectById(sid);
	}
}
