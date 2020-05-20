package com.madmax.stool.approval.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.madmax.stool.approval.model.dao.ApprovalDao2;
import com.madmax.stool.approval.model.vo.Approval;

@Service
public class ApprovalServiceImpl2 implements ApprovalService2 {

	@Autowired
	ApprovalDao2 dao;
	
	@Autowired
	SqlSessionTemplate session;

	@Override
	public List<Approval> selectApprProgList(String userId) {
		// TODO Auto-generated method stub
		return dao.selectApprProgList(session,userId);
	}
	
	
	
}
