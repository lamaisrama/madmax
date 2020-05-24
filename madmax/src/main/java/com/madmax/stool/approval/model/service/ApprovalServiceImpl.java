package com.madmax.stool.approval.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.madmax.stool.approval.model.dao.ApprovalDao;
import com.madmax.stool.approval.model.vo.ApprAttachment;
import com.madmax.stool.approval.model.vo.ApprDoc;
import com.madmax.stool.approval.model.vo.ApprDocType;
import com.madmax.stool.approval.model.vo.ApprLine;
import com.madmax.stool.approval.model.vo.AppredDoc;
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
	public int updateUserSign(String userId) {
		return dao.updateUserSign(session, userId);
	}

	@Override
	@Transactional
	public int insertApproval(Approval appr, List<ApprLine> lines, List<AppredDoc> appred, 
								List<ApprAttachment> files) throws RuntimeException{
		//1 Approval TBL에 추가
		int result = dao.insertApproval(session, appr);			
		if(result==0) {
			throw new RuntimeException("결재 문서 입력 오류");
		}
		//2 ApprLine TBL에 추가
		for(ApprLine al : lines) {
			al.setApprNo(appr.getApprNo());
			result=dao.insertApprLine(session, al);
			if(result==0) {
				throw new RuntimeException("결재선 입력 오류");
			}
		}
		// AppredDoc 추가
		if(!appred.isEmpty()) {
			for(AppredDoc ad : appred) {
				ad.setApprNo(appr.getApprNo());
				result=dao.insertAppredDoc(session, ad);
				if(result==0) {
					throw new RuntimeException("결재선 입력 오류");
				}
			}
		}
		
		//업로드파일 추가
		if(!files.isEmpty()) {
			for(ApprAttachment at : files) {
				at.setApprNo(appr.getApprNo());
				result=dao.insertApprAttachment(session, at);
				if(result==0) {
					throw new RuntimeException("결재선 입력 오류");
				}
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
		//3. 수신인 이름 가져오기
		appr.setReceiverName(dao.selectReceiverName(session, appr.getReceiver()));
		//4. 기결재문서 가져오기
		appr.setAppredDoc(dao.selectAppredDoc(session, apprNo));
		//5. 첨부파일 가져오기
		appr.setApprAttachment(dao.selectApprAttachment(session, apprNo));
		return appr;
	}

	@Override
	public ApprDoc selectDoApproval(Approval approval) {
		//select apprDoc 
		ApprDoc appr = dao.selectDoApproval(session, approval);
		//select apprLine
		List<ApprLine> lines = dao.selectApprLine(session, approval.getApprNo());
		appr.setApprLine(lines);
		//3. 수신인 이름 가져오기
		appr.setReceiverName(dao.selectReceiverName(session, appr.getReceiver()));
		//4. 기결재문서 가져오기
		appr.setAppredDoc(dao.selectAppredDoc(session, approval.getApprNo()));
		//5. 첨부파일 가져오기
		appr.setApprAttachment(dao.selectApprAttachment(session, approval.getApprNo()));
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

	@Override
	public int updateAppr(ApprLine line) {
		//1. apprLine 업데이트
		int result=dao.updateAppr(session, line);
		//2. approval 업데이트
		if(result>0) {
			if(line.getApprResult()==2) {
				result=dao.updateApprStatusEnd(session,line);
			}else {
				int apprNo=line.getApprNo();
				ApprDoc appr = dao.selectApproval(session, apprNo);				
				if(appr.getCurrApprStep()+1==appr.getFinalApprStep()) {
					result=dao.updateApprStatusEnd(session,line);
				}else {
					result=dao.updateApprStatusIng(session,line);
				}
			}
		}else {
			return 0;
		}
		
		return result;
	}

	@Override
	public List<ApprDoc> selectAttachAppredDoc(String deptCode) {
		return dao.selectAttachAppredDoc(session, deptCode);
	}
	
	

	
	
}
