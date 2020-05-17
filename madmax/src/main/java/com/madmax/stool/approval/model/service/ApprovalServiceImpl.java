package com.madmax.stool.approval.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.madmax.stool.approval.model.dao.ApprovalDao;
import com.madmax.stool.approval.model.vo.ApprDocType;
import com.madmax.stool.approval.model.vo.DeptUsers;
import com.madmax.stool.approval.model.vo.User;

@Service
public class ApprovalServiceImpl implements ApprovalService{
	@Autowired
	ApprovalDao dao;
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<DeptUsers> selectDeptInfo() {
		return dao.selectDeptInfo(session);
	}

	@Override
	public List<User> selectDeptUsers(DeptUsers du) {
		return dao.selectDeptUsers(session, du);
		
	}

	@Override
	public List<ApprDocType> selectApprDocList(int cPage, int numPerPage) {
		return dao.selectApprDocList(session, cPage, numPerPage);
	}

	@Override
	public int selectApprDocListCount() {
		return dao.selectApprDocListCount(session);
	}

	@Override
	public ApprDocType selectApprDocForm(int dNo) {
		// TODO Auto-generated method stub
		return dao.selectApprDocForm(session, dNo);
	}
	
	
	

	
	
}
