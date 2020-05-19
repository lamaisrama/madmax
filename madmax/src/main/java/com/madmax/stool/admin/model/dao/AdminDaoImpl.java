package com.madmax.stool.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.admin.model.vo.AdminAttendManagement;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Override
	public List<AdminAttendManagement> selectAttendList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.selectAttendList");
	}

	@Override
	public int updateModifyRequest(SqlSessionTemplate session, AdminAttendManagement am) {
		// TODO Auto-generated method stub
		return session.update("admin.updateModifyRequest",am);
	}

	@Override
	public int updateEmployeeManagement(SqlSessionTemplate session, AdminAttendManagement am) {
		// TODO Auto-generated method stub
		return session.update("admin.updateEmployeeManagement",am);
	}

	
	
}
