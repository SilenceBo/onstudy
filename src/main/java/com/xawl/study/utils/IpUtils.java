package com.xawl.study.utils;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import com.xawl.study.dao.IpMapper;
import com.xawl.study.model.Ip;
import com.xawl.study.model.IpExample;

public class IpUtils {
	public void record(HttpServletRequest request, IpMapper ipMapper) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		IpExample example = new IpExample();
		example.createCriteria().andIpEqualTo(ip);
		List<Ip> selectByExample = ipMapper.selectByExample(example);
		if (selectByExample != null && selectByExample.size() > 0) {
			Ip ips = selectByExample.get(0);
			ips.setNum(ips.getNum() + 1);
			ips.setLastdate(new Date());
			ipMapper.updateByPrimaryKey(ips);
		} else {
			Ip newIp = new Ip();
			newIp.setIp(ip);
			newIp.setLastdate(new Date());
			ipMapper.insertSelective(newIp);
		}
	}
}
