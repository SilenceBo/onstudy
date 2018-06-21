package com.xawl.study.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xawl.study.model.Student;
import com.xawl.study.model.StudentVo;
import com.xawl.study.utils.Result;

public interface StudentService {
   //登陆
	Result login(HttpServletRequest request,Student student);
	
	//注册
	Result regist(Student student);
		
/*查询*/
	//查询-全部 
	List<Student> findAll();
	
	//主键
	Student selectByPrimaryKey(String id);
	
	//查询-通过账号查询 (登录)---一条记录
	List<Student> selectByAccount(String account);
	
	//查询-通过姓名
	List<Student> selectBySname(String sname);
	
	//查询总记录数
	//int countsALL(int classId);
	
/*添加*/
	//添加-学生信息
	int insert(Student student);	
	//Student insert(Student student);
	
/*删除*/	
	//删除-单条
	int deleteByPrimaryKey(String id);
	
	//删除-多条
	int deleteByIds(String ids, HttpServletRequest request);
	
/*修改*/
	//修改-通过主键
	//int updateByPrimaryKey(Student student);
	
	//修改-通过主键修改已存学生 
	int updateByPrimaryKeySelective(Student student);

	Integer findByAccount(String account);

	Result updateByAccount(Student student, HttpServletRequest request);

	int updateCode(String code);

	Result findPass(String account, String email);

	Result updatePass(String account, String pwd);

	List<StudentVo> selectByClassId(Integer classId);
	
	Result updatePassByAccount(String account, String pwd);

	Result addStudent(Student student);

	Result updateStudent(Student student);

	Result updateResetPwd(Student student);

	Student selectById(Integer sid);
}
