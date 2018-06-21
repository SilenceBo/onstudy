package com.xawl.study.dao;

import com.xawl.study.model.Admin;

public interface AdminMapper {

	Admin findAdmin(Admin admin);

	Admin findAdminByUname(String uname);

	int updateAdminPass(Admin admin);

}
