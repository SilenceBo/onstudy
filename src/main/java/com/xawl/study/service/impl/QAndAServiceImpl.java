package com.xawl.study.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xawl.study.dao.CourseMapper;
import com.xawl.study.dao.QAndAMapper;
import com.xawl.study.model.Course;
import com.xawl.study.model.QAndA;
import com.xawl.study.model.QAndAExample;
import com.xawl.study.model.Student;
import com.xawl.study.model.Teacher;
import com.xawl.study.service.QAndAService;
import com.xawl.study.utils.Result;

@Service
public class QAndAServiceImpl implements QAndAService {
	@Autowired
	QAndAMapper qAndAMapper;
	@Autowired
	CourseMapper courseMapper;

	public Result selectAll(Integer page, Integer cid) {
		PageHelper.startPage(page, 10);
		QAndAExample example = new QAndAExample();
		example.createCriteria().andFqidIsNull().andTypeEqualTo(0)
				.andCidEqualTo(cid);
		List<QAndA> list = qAndAMapper.selectByExample(example);
		for (QAndA q : list) {
			q.setCount(qAndAMapper.selectCountByQid(q.getQid()));
		}
		PageInfo pageInfo = new PageInfo(list);
		Result result = new Result(list);
		result.setData2(pageInfo);
		return result;
	}

	public Result addQuestionsToTeacher(QAndA qAndA) {
		try {
			QAndAExample example = new QAndAExample();
			qAndA.setType(1);
			qAndA.setTypea(0);
			qAndAMapper.insertSelective(qAndA);
			return Result.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "操作失败");
		}

	}

	public Result add(QAndA qAndA) {
		try {
			qAndAMapper.insertSelective(qAndA);
			return Result.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return new Result(201, "发布失败", null);
		}

	}

	public List<QAndA> findAll(Integer cid) {
		QAndAExample example = new QAndAExample();
		example.createCriteria().andFqidIsNull().andTypeEqualTo(0)
				.andCidEqualTo(cid);
		List<QAndA> list = qAndAMapper.selectByExample(example);
		return list;
	}

	public Result findAllAnswerByfqid(Integer qid) {
		Result result = new Result();

		QAndAExample example = new QAndAExample();
		example.createCriteria().andQidEqualTo(qid);
		List<QAndA> list2 = qAndAMapper.selectByExample(example);
		example.clear();
		example.createCriteria().andFqidIsNotNull().andFqidEqualTo(qid);
		List<QAndA> list = qAndAMapper.selectByExample(example);
		result.setData(list);
		result.setData2(list2);
		result.setStatus(200);
		result.setMsg("ok");
		return result;
	}

	public Result findByQid(Integer qid) {
		QAndAExample example = new QAndAExample();
		example.createCriteria().andQidEqualTo(qid);
		List<QAndA> list = qAndAMapper.selectByExample(example);
		return new Result(list);
	}

	public Result addReply(Integer beAnsweredQid, QAndA qanda, String text,
			HttpServletRequest request, HttpServletResponse response) {
		Student stu = (Student) request.getSession().getAttribute(
				"user_student");
		Teacher teacher = (Teacher) request.getSession().getAttribute(
				"user_teacher");
		Result result = new Result();
		//System.out.println(qanda);
		try {
			if (stu != null) {
				if (qanda.getTypea() == 0) {
					qanda.setTsid(qanda.getOsid());
					qanda.setTsname(qanda.getOsname());
					qanda.setOsid(Integer.parseInt(stu.getId()));
					qanda.setOsname(stu.getSname());
					qanda.setText(text);
					qanda.setQid(null);
					qanda.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
							.format(new Date()));
					qAndAMapper.insertSelective(qanda);
				} else if (qanda.getTypea() == 1) {
					qanda.setTsid(qanda.getOsid());
					qanda.setTsname(qanda.getOsname());
					qanda.setOsid(Integer.parseInt(stu.getId()));
					qanda.setOsname(stu.getSname());
					qanda.setTid(null);
					qanda.setTname(null);
					qanda.setText(text);
					qanda.setQid(null);
					qanda.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
							.format(new Date()));
					qanda.setTypea(0);
					qAndAMapper.insertSelective(qanda);
				} else if (qanda.getTypea() == 2) {
					qanda.setOsid(qanda.getOsid());
					qanda.setOsname(qanda.getOsname());
					qanda.setText(text);
					qanda.setQid(null);
					qanda.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
							.format(new Date()));
					qanda.setTypea(1);
					qAndAMapper.insertSelective(qanda);
				}
			} else {
				qanda.setOsid(qanda.getOsid());
				qanda.setOsname(qanda.getOsname());
				qanda.setTsid(null);
				qanda.setTsname(null);
				qanda.setTid(teacher.getTid());
				qanda.setTname(teacher.getUsername());
				qanda.setText(text);
				qanda.setQid(null);
				qanda.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
						.format(new Date()));
				qanda.setTypea(2);
				qAndAMapper.insertSelective(qanda);
			}
			return Result.ok();
		} catch (Exception e) {
			e.printStackTrace();
			result.setStatus(201);
			result.setMsg("回复失败");
			return result;
		}
	}

	public Result findByTid(Integer tid, Integer page) {
		try {
			PageHelper.startPage(page, 5);
			QAndAExample example = new QAndAExample();
			example.createCriteria().andTidEqualTo(tid).andTypeEqualTo(1)
					.andFqidIsNull();
			List<QAndA> list = qAndAMapper.selectByExample(example);
			for (QAndA qAndA : list) {
				Course course = courseMapper.selectByPrimaryKey(qAndA.getCid());
				qAndA.setCname(course.getCname());
			}
			PageInfo pageMsg=new PageInfo(list);
			
			return new Result(pageMsg);
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "查询失败");
		}
	}

	public Result deleteByqid(Integer qid) {
		try {
			QAndAExample example = new QAndAExample();
			example.createCriteria().andQidEqualTo(qid);
			qAndAMapper.deleteByExample(example);
			example.clear();
			example.createCriteria().andFqidEqualTo(qid);
			qAndAMapper.deleteByExample(example);
			return Result.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "查询失败");
		}
	}

	public Result findBySid(Integer sid) {
		try {
			QAndAExample example = new QAndAExample();
			example.createCriteria().andOsidEqualTo(sid).andTypeEqualTo(1)
					.andFqidIsNull();
			List<QAndA> list = qAndAMapper.selectByExample(example);
			return new Result(list);
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "查询失败");
		}
	}

	public Result addTeacherReply(QAndA qanda) {
		try {
			qAndAMapper.insertSelective(qanda);
			return Result.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "查询失败");
		}
	}

	public Result addStudentReply(QAndA qanda) {
		try {
			qAndAMapper.insertSelective(qanda);
			return Result.ok(qanda.getFqid());
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "查询失败");
		}
	}

	public Result deleteByListQid(List<Integer> list) {
		try {
			QAndAExample example = new QAndAExample();
			example.createCriteria().andQidIn(list);
			qAndAMapper.deleteByExample(example);
			return Result.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "刪除失敗");
		}
	}

	public Result addTeacherReply(Integer fqid, Integer qid, String text,
			HttpServletRequest request, Integer typea) {
		try {
			Teacher teacher = (Teacher) request.getSession().getAttribute(
					"user_teacher");
			QAndAExample example = new QAndAExample();
			example.createCriteria().andQidEqualTo(qid);
			List<QAndA> list = qAndAMapper.selectByExample(example);
			QAndA qAndA = list.get(0);
			if (typea == 1) {
				qAndA.setOsid(qAndA.getTsid());
				qAndA.setOsname(qAndA.getTsname());
			}
			qAndA.setFqid(fqid);
			qAndA.setText(text);
			qAndA.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(new Date()));
			qAndA.setTid(teacher.getTid());
			qAndA.setTname(teacher.getUsername());
			qAndA.setTypea(2);
			qAndA.setQid(null);
			//System.out.println("qandA=" + qAndA);
			qAndAMapper.insertSelective(qAndA);
			return Result.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "回复失败");
		}
	}

	public Result addReply(Integer fqid, Integer qid, String text,
			HttpServletRequest request, Integer typea) {
		if (typea == null) {
			typea = 0;
		}
		try {
			Teacher teacher = (Teacher) request.getSession().getAttribute(
					"user_teacher");
			Student student = (Student) request.getSession().getAttribute(
					"user_student");
			QAndAExample example = new QAndAExample();
			example.createCriteria().andQidEqualTo(qid);
			List<QAndA> list = qAndAMapper.selectByExample(example);
			QAndA qAndA = list.get(0);
			if (teacher != null) {
				if (typea == 1) {
					qAndA.setOsid(qAndA.getTsid());
					qAndA.setOsname(qAndA.getTsname());
				}
				qAndA.setFqid(fqid);
				qAndA.setText(text);
				qAndA.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
						.format(new Date()));
				qAndA.setTid(teacher.getTid());
				qAndA.setTname(teacher.getUsername());
				qAndA.setTypea(2);
				qAndA.setQid(null);
				//System.out.println("qandA=" + qAndA);
				if(qAndA.getTsid()==null&&qAndA.getTid()==null){
					return Result.build(405,"请点击回复 或者点击你想回复人的名字");
				}
				qAndAMapper.insertSelective(qAndA);
			} else if (student != null) {
				if (typea == 0) {
					qAndA.setTsid(qAndA.getOsid());
					qAndA.setTsname(qAndA.getOsname());
					qAndA.setTypea(0);
				} else if (typea == 1) {
					qAndA.setTypea(0);
				} else if (typea == 2) {
					qAndA.setTsid(null);
					qAndA.setTsname(null);
					qAndA.setTypea(1);
				}
				qAndA.setOsid(Integer.parseInt(student.getId()));
				qAndA.setOsname(student.getSname());
				qAndA.setFqid(fqid);
				qAndA.setText(text);
				qAndA.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
						.format(new Date()));
				qAndA.setQid(null);
				//System.out.println("qandA=" + qAndA);
				if(qAndA.getTsid()==null&&qAndA.getTid()==null){
					return Result.build(405,"请点击回复 或者点击你想回复人的名字");
				}
				qAndAMapper.insertSelective(qAndA);
			}

			return Result.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "回复失败");
		}
	}

}
