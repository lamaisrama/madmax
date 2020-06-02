package com.madmax.stool.admin.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.madmax.stool.admin.model.dao.AdminDao;
import com.madmax.stool.admin.model.vo.AdminAttendManagement;
import com.madmax.stool.admin.model.vo.AdminUserManage;
import com.madmax.stool.admin.model.vo.DeptReport;

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

	@Override
	public List<AdminUserManage> selectSignupApproval() {
		// TODO Auto-generated method stub
		return dao.selectSignupApproval(session);
	}

	@Override
	public int updateUserState(String userId) {
		// TODO Auto-generated method stub
		return dao.updateUserState(session,userId);
	}

	@Override
	public List<AdminUserManage> selectAllUser(int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectAllUser(session,cPage,numPerPage);
	}

	@Override
	public int selectUserCount() {
		// TODO Auto-generated method stub
		return dao.selectUserCount(session);
	}

	@Override
	public int updateJobCode(AdminUserManage aum) {
		// TODO Auto-generated method stub
		return dao.updateJobCode(session,aum);
	}

	@Override
	public List<DeptReport> selectUserReport() {
		// TODO Auto-generated method stub
		return dao.selectUserReport(session);
	}
	
	
	
}
