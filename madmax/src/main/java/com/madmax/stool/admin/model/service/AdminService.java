package com.madmax.stool.admin.model.service;

import java.util.List;

import com.madmax.stool.admin.model.vo.AdminAttendManagement;
import com.madmax.stool.admin.model.vo.AdminUserManage;
import com.madmax.stool.admin.model.vo.DeptReport;

public interface AdminService {
	
	List<AdminAttendManagement> selectAttendList();
	
	int updateModifyRequest(AdminAttendManagement am);
	
	int updateEmployeeManagement(AdminAttendManagement am);
	
	List<AdminUserManage> selectSignupApproval();
	
	int updateUserState(String userId);
	
	List<AdminUserManage> selectAllUser(int cPage,int numPerPage);

	int selectUserCount();
	
	int updateJobCode(AdminUserManage aum);
	
	List<DeptReport> selectUserReport();
}
