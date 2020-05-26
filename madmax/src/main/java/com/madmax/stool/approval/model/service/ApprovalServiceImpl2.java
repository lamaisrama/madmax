package com.madmax.stool.approval.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.madmax.stool.approval.model.dao.ApprovalDao;
import com.madmax.stool.approval.model.dao.ApprovalDao2;
import com.madmax.stool.approval.model.vo.ApprDoc;
import com.madmax.stool.approval.model.vo.Approval;

@Service
public class ApprovalServiceImpl2 implements ApprovalService2 {

	@Autowired
	ApprovalDao dao;
	
	@Autowired
	ApprovalDao2 dao2;
	
	@Autowired
	SqlSessionTemplate session;

	@Override
	public List<Approval> selectApprProgList(int cPage, int numPerPage, String userId) {
		// TODO Auto-generated method stub
		return dao2.selectApprProgList(session,cPage, numPerPage, userId);
	}

	@Override
	public List<Approval> selectApprDoneList(int cPage, int numPerPage, String userId) {
		// TODO Auto-generated method stub
		return dao2.selectApprDoneList(session,cPage, numPerPage, userId);
	}

	@Override
	public List<ApprDoc> selectApprOpinionList(Approval approval) {
		// TODO Auto-generated method stub
		return dao2.selectApprOpinionList(session,approval);
	}

	@Override
	public List<ApprDoc> selectApprDoneOpinionList(Approval approval) {
		// TODO Auto-generated method stub
		return dao2.selectApprDoneOpinionList(session,approval);
	}

	@Override
	public int selectApprProgListCount(String userId) {
		// TODO Auto-generated method stub
		return dao2.selectApprProgListCount(session, userId);
	}

	@Override
	public int selectApprDoneListCount(String userId) {
		// TODO Auto-generated method stub
		return dao2.selectApprDoneListCount(session, userId);
	}
	
	


	
	
	
}
