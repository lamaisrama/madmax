package com.madmax.stool.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.admin.model.vo.AdminAttendManagement;
import com.madmax.stool.admin.model.vo.AdminUserManage;

public interface AdminDao {
	
	List<AdminAttendManagement> selectAttendList(SqlSessionTemplate session);

	int updateModifyRequest(SqlSessionTemplate session,AdminAttendManagement am);
	
	int updateEmployeeManagement(SqlSessionTemplate session,AdminAttendManagement am);
	
	List<AdminUserManage> selectSignupApproval(SqlSessionTemplate session);
	
	int updateUserState(SqlSessionTemplate session,String userId);
	
	List<AdminUserManage> selectAllUser(SqlSessionTemplate session,int cPage,int numPerPage);
	
	int selectUserCount(SqlSessionTemplate session);
	
	int updateJobCode(SqlSessionTemplate session,AdminUserManage aum);
	
}
