package com.madmax.stool.admin.model.service;

import java.util.List;

import com.madmax.stool.admin.model.vo.AdminAttendManagement;

public interface AdminService {
	
	List<AdminAttendManagement> selectAttendList();
	
	int updateModifyRequest(AdminAttendManagement am);
	
	int updateEmployeeManagement(AdminAttendManagement am);

}
