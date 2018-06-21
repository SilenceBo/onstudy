package com.xawl.study.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xawl.study.dao.ClassNameMapper;
import com.xawl.study.model.ClassName;
import com.xawl.study.service.ClassNameService;

@Service
public class ClassNameServiceImpl implements ClassNameService {
	@Autowired
	ClassNameMapper classNameMapper;

	public List<ClassName> findAll() {
		List<ClassName> classNameList = classNameMapper.findAll();
		return classNameList;
	}

	public ClassName selectByclassId(Integer classId) {
		// TODO Auto-generated method stub
		return classNameMapper.selectByclassId(classId);
	}
	/*public int updateByPrimaryKey(ClassName classname) {
		// TODO Auto-generated method stub
		return classNameMapper.updateByPrimaryKey(classname) ;
	}*/

	/*public int insertClassName(ClassName classname) {
		// TODO Auto-generated method stub
		return classNameMapper.insertClassName(classname);
	}*/
	public boolean deleteClassNameByclassId(Integer classId) {
		// TODO Auto-generated method stub
		try{
			classNameMapper.deleteClassNameByclassId(classId);
			return true;
		}catch(Exception e){
			return false;
		}
	}

	public int insertSelective(ClassName classname) {
		// TODO Auto-generated method stub
		int insertSelective=classNameMapper.insertSelective(classname);
		return insertSelective;
	}

	public int updateByPrimaryKeySelective(ClassName classname) {
		// TODO Auto-generated method stub
		return classNameMapper.updateByPrimaryKeySelective(classname);
	}

	public int countsALL(int classId) {
		// TODO Auto-generated method stub
		int counts=classNameMapper.countsALL(classId);
    	return counts;
	}

	public List<ClassName> selectByName(String classname) {
		List<ClassName> list=classNameMapper.selectByName(classname);
		
		return list;
	}

	
	

	

}
