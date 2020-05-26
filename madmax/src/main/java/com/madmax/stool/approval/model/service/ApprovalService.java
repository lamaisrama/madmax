package com.madmax.stool.approval.model.service;

import java.util.List;

import com.madmax.stool.approval.model.vo.ApprAttachment;
import com.madmax.stool.approval.model.vo.ApprDoc;
import com.madmax.stool.approval.model.vo.ApprDocType;
import com.madmax.stool.approval.model.vo.ApprLine;
import com.madmax.stool.approval.model.vo.AppredDoc;
import com.madmax.stool.approval.model.vo.Approval;
import com.madmax.stool.approval.model.vo.DeptUsers;
import com.madmax.stool.approval.model.vo.User;

public interface ApprovalService {
	
	
	List<DeptUsers> selectDeptInfo();
	List<User> selectDeptUsers(DeptUsers du);
	ApprDocType selectApprDocForm(int dNo);
	ApprDoc selectApprDoc(int apprNo);
	ApprDoc selectDoApproval(Approval approval);
	
	List<ApprDocType> selectApprDocList(int cPage, int numPerPage);
	int selectApprDocListCount();
	List<Approval> selectApprReqList(int cPage, int numPerPage, String userId);
	int selectApprReqListCount(String userId);
	List<Approval> selectApprTempList(int cPage, int numPerPage, String userId);
	int selectApprTempListCount(String userId);
	List<Approval> selectApprWaitList(int cPage, int numPerPage, String userId);
	int selectApprWaitListCount(String userId);
	List<Approval> selectMyDocList(int cPage, int numPerPage, String userId);
	int selectMyDocListCount(String userId);
	List<Approval> selectDeptDocList(int cPage, int numPerPage, String deptCode);
	int selectDeptDocListCount(String deptCode);
	List<ApprDoc> selectAttachAppredDoc(String deptCode);
	List<Approval> selectRefferedDocList(int cPage, int numPerPage, String userId);
	int selectRefferedDocListCount(String userId);
	
	int insertApproval(Approval appr, List<ApprLine> lines, List<AppredDoc> appred, 
						List<ApprAttachment> files) throws RuntimeException;
	int updateTemporary(int apprNo);
	int deleteDoc(int apprNo);
	int updateAppr(ApprLine line);
	int updateUserSign(String userId);
	int updateTempApproval(Approval appr, List<ApprLine> apprLines, List<AppredDoc> appred, 
							List<ApprAttachment> files,List<ApprAttachment> delFiles) throws RuntimeException;

	
}	