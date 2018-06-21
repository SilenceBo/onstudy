package com.xawl.study.service;

import com.xawl.study.model.Admin;
import com.xawl.study.model.StatisticsReource;
import com.xawl.study.model.StatisticsWork;
import com.xawl.study.model.Statisticsvideo;

public interface AdminService {

	Admin findAdmin(Admin admin);

	Admin findAdminByUname(String uname);

	int updateAdminPass(Admin admin);

	StatisticsReource statisticsReource();

	Statisticsvideo statisticsvideo();

	StatisticsWork statisticsWork();

}
