package com.xawl.study.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xawl.study.dao.ResourceLogsMapper;
import com.xawl.study.dao.ResourceMapper;
import com.xawl.study.model.CourseCustomer;
import com.xawl.study.model.Resource;
import com.xawl.study.model.ResourceLogs;
import com.xawl.study.model.Student;
import com.xawl.study.service.ResourceService;
import com.xawl.study.utils.ResourceLogsUtils;
import com.xawl.study.utils.ResourceUtils;
import com.xawl.study.utils.Result;
import com.xawl.study.utils.StudyResult;

@Service
public class ResourceServiceImpl implements ResourceService {
	@Autowired
	ResourceMapper resourceMapper;
	@Autowired
	ResourceLogsMapper resourceLogsMapper;

	public List<Resource> findAll(Integer cid) {
		List<Resource> list = resourceMapper.selectAll(cid);
		return list;
	}

	public boolean deleteByRid(Integer rid, HttpServletRequest request) {
		try {
			Resource resource = findByRid(rid);
			ResourceUtils.deleteResource(resource.getSrc(), request);
			ResourceUtils.deleteResource(resource.getAnswerSrc(), request);
			resourceLogsMapper.deleteByCidAndRid(resource);
			resourceMapper.deleteByPrimaryKey(rid);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public void insertResource(Resource resource) {
		try {
			Integer ordery = resourceMapper.selectMaxOrderyByCid(resource
					.getCid());
			if (ordery == null || ordery == 0) {
				resource.setOrdery(1);

			} else {
				resource.setOrdery(ordery + 1);
			}
			resourceMapper.insertResource(resource);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void insertResource2(Resource resource) {
		try {
			resource.setOrdery(null);
			resourceMapper.insertResource(resource);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Resource findByRid(Integer rid) {
		return resourceMapper.selectByPrimaryKey(rid);
	}

	public Result updateResource(Resource resource) {
		try {
			Resource res = resourceMapper.selectByPrimaryKey(resource.getRid());
			if (res.getResourceType() != resource.getResourceType()
					&& resource.getResourceType() == 1) {
				Integer ordery = resourceMapper.selectMaxOrderyByCid(resource
						.getCid());
				if (ordery == null) {
					resource.setOrdery(1);
				}else{
					resource.setOrdery(ordery + 1);
				}
			}
			//System.out.println(resource);
			List<Resource> list = resourceMapper.selectByCidAndOredry(resource);
			if (list != null && list.size() > 0) {
				if (list.size() != 1) {
					return Result.build(405, "资源序号不能重复");
				} else {
					/*System.out.println("list.get(0).getRid()="
							+ list.get(0).getRid() + "resource.getRid()="
							+ resource.getRid());*/
					if (!list.get(0).getRid().equals(resource.getRid())) {
						return Result.build(405, "资源序号不能重复");
					}
				}
			}
			if (resource.getResourceType() != 1) {
				resource.setOrdery(null);
			}
			resourceMapper.updateByPrimaryKeySelective(resource);
			resourceLogsMapper.updateOredery(resource);
			if (resource.getResourceType() != 1) {
				resourceMapper.updateOrdery(resource);
			}
			return new Result(200,"修改成功",null);
		} catch (Exception e) {
			e.printStackTrace();
			return Result.build(405, "修改失败");
		}
	}

	public String selectResourceNameBYRid(Integer rid) {
		return resourceMapper.selectResourceNameBYRid(rid);
	}

	public CourseCustomer selectCourseByCid(Integer cid) {
		return resourceMapper.selectCourseByCid(cid);
	}

	public int selectCountVedioByCid(Integer cid) {
		return resourceMapper.selectCountVedioByCid(cid);
	}

	public StudyResult play(ResourceLogs resourceLogs,
			HttpServletRequest requset) {
		StudyResult studyResult = null;
		Resource res = resourceMapper.selectByPrimaryKey(resourceLogs.getRid());
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, String> maps = new HashMap<String, String>();
		Student student = (Student) requset.getSession().getAttribute(
				"user_student");
		map.put("answerNum", res.getAnswerString().toCharArray().length);
		map.put("Src", res.getSrc());
		map.put("cid", res.getCid());
		map.put("ordery", res.getOrdery());
		map.put("answerSrc", res.getAnswerSrc());
		/*System.out.println(new ResourceLogsUtils().isPlay(resourceLogs,
				resourceMapper, resourceLogsMapper, student));*/
		if (new ResourceLogsUtils().isPlay(resourceLogs, resourceMapper,
				resourceLogsMapper, student)) {
			maps.put("rid", res.getRid().toString());
			maps.put("sid", student.getId());
			maps.put("ordery", res.getOrdery().toString());
			ResourceLogs resourceLogss = resourceLogsMapper
					.selectResByRidAndOrdery(maps);
			if (resourceLogss == null) {
				resourceLogsMapper.insertResourceLogs(resourceLogs);
			}
			studyResult = new StudyResult("ok", 200, map);
		} else {
			studyResult = new StudyResult("请看完之前的课节,并且通过相应测试", 201, null);
		}
		requset.setAttribute("cid", res.getCid());
		requset.setAttribute("ordery", res.getOrdery());
		return studyResult;
	}

	public StudyResult updateAnswer(String[] answers, Integer ordery,
			Integer cid, Integer sid) {
		Integer grade = 0;
		Map<String, String> map = new HashMap<String, String>();
		map.put("cid", cid.toString());
		map.put("sid", sid.toString());
		map.put("ordery", ordery.toString());
		ResourceLogs resourceLogss = resourceLogsMapper
				.selectResByCidAndSidAndOrdery(map);
		if (resourceLogss == null) {
			return null;
		}
		Resource resource = resourceMapper.selectByPrimaryKey(resourceLogss
				.getRid());
		char[] Yanswer = resource.getAnswerString().toCharArray();
		for (int i = 0; i < answers.length; i++) {
			String Y = Yanswer[i] + "";
			if (answers[i].equalsIgnoreCase(Y)) {
				grade += 10;
			}
		}
		map.clear();
		map.put("grade", grade.toString());
		map.put("rlid", resourceLogss.getRlid().toString());
		resourceLogsMapper.updateGrade(map);
		StudyResult studyResult = new StudyResult("您的答对了" + grade/10+"道题", 200, null);
		return studyResult;
	}

	public List<Resource> findByRTypeNo1(Integer cid) {

		return resourceMapper.findByRTypeNo1(cid);
	}

	public StudyResult bofang(ResourceLogs resourceLogs,
			HttpServletRequest request) {
		StudyResult studyResult = null;
		Resource res = resourceMapper.selectByPrimaryKey(resourceLogs.getRid());
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, String> maps = new HashMap<String, String>();
		map.put("answerNum", res.getAnswerString().toCharArray().length);
		map.put("Src", res.getSrc());
		map.put("cid", res.getCid());
		map.put("ordery", res.getOrdery());
		map.put("answerSrc", res.getAnswerSrc());
		studyResult = new StudyResult("ok", 200, map);
		request.setAttribute("cid", res.getCid());
		request.setAttribute("ordery", res.getOrdery());
		return studyResult;
	}

	public Result findByCidAndType(Integer cid) {
		List<Resource> list = resourceMapper.findByCidAndType(cid);
		if (list != null && list.size() > 0) {
			return Result.ok(true);
		}
		return Result.ok(false);
	}

	public boolean deleteByRids(String rids, HttpServletRequest request) {
		try {
			String[] arr = rids.split(",");
			for (String rid : arr) {
				deleteByRid(Integer.parseInt(rid), request);
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
}
