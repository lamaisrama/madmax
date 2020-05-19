package com.madmax.stool.approval.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.madmax.stool.approval.model.dao.ApprovalDao;
import com.madmax.stool.approval.model.vo.ApprDoc;
import com.madmax.stool.approval.model.vo.ApprDocType;
import com.madmax.stool.approval.model.vo.ApprLine;
import com.madmax.stool.approval.model.vo.Approval;
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

	@Override
	public int insertApproval(Approval appr, List<ApprLine> lines) {
		//1 Approval TBL에 추가
		int result = dao.insertApproval(session, appr);
		//2 ApprLine TBL에 추가
		if(result==0) {
			throw new RuntimeException("결재 문서 입력 오류");
		}
		for(ApprLine al : lines) {
			al.setApprNo(appr.getApprNo());
			result=dao.insertApprLine(session, al);
			if(result==0) {
				throw new RuntimeException("결재선 입력 오류");
			}
		}
		
		return 1;
	}

	@Override
	public List<Approval> selectApprReqList(String userId) {
		return dao.selectApprReqList(session, userId);
	}

	@Override
	public ApprDoc selectApprDoc(int apprNo) {
		//1. Approval doc 가져오기
		ApprDoc appr = dao.selectApproval(session, apprNo);
		//2. ApprLine 가져오기
		List<ApprLine> lines = dao.selectApprLine(session, apprNo);
		appr.setApprLine(lines);
		//appr.setApprHistory(history);
		return appr;
	}

	@Override
	public ApprDoc selectDoApproval(Approval approval) {
		//select apprDoc 
		ApprDoc appr = dao.selectDoApproval(session, approval);
		//select apprLine
		List<ApprLine> lines = dao.selectApprLine(session, approval.getApprNo());
		appr.setApprLine(lines);
		return appr;
	}

	@Override
	public int updateTemporary(int apprNo) {
		return dao.updateTemporary(session, apprNo);
	}

	@Override
	public int deleteDoc(int apprNo) {
		return dao.deleteDoc(session, apprNo);
	}

	@Override
	public List<Approval> selectApprTempList(String userId) {
		return dao.selectApprTempList(session, userId);
	}

	@Override
	public List<Approval> selectApprWaitList(String userId) {
		return dao.selectApprWaitList(session, userId);
	}
	
	

	
	
}
