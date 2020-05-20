package com.madmax.stool.admin.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.madmax.stool.admin.model.dao.AdminDao;
import com.madmax.stool.admin.model.vo.AdminAttendManagement;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<AdminAttendManagement> selectAttendList() {
		// TODO Auto-generated method stub
		return dao.selectAttendList(session);
	}

	@Override
	public int updateModifyRequest(AdminAttendManagement am) {
		// TODO Auto-generated method stub
		return dao.updateModifyRequest(session,am);
	}

	@Override
	public int updateEmployeeManagement(AdminAttendManagement am) {
		// TODO Auto-generated method stub
		return dao.updateEmployeeManagement(session,am);
	}
	
	
	
}
