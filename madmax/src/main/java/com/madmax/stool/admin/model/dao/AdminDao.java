package com.madmax.stool.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.admin.model.vo.AdminAttendManagement;

public interface AdminDao {
	
	List<AdminAttendManagement> selectAttendList(SqlSessionTemplate session);

	int updateModifyRequest(SqlSessionTemplate session,AdminAttendManagement am);
	
	int updateEmployeeManagement(SqlSessionTemplate session,AdminAttendManagement am);
}
