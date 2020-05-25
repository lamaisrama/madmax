package com.madmax.stool.admin.model.service;

import java.util.List;

import com.madmax.stool.admin.model.vo.AdminAttendManagement;
import com.madmax.stool.admin.model.vo.AdminUserManage;

public interface AdminService {
	
	List<AdminAttendManagement> selectAttendList();
	
	int updateModifyRequest(AdminAttendManagement am);
	
	int updateEmployeeManagement(AdminAttendManagement am);
	
	List<AdminUserManage> selectAignupApproval();
	
	int updateUserState(String userId);
	
	List<AdminUserManage> selectAllUser(int cPage,int numPerPage);

	int selectUserCount();
	
	int updateJobCode(AdminUserManage aum);
}
