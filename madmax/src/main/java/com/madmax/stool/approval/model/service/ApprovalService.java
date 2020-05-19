package com.madmax.stool.approval.model.service;

import java.util.List;

import com.madmax.stool.approval.model.vo.ApprDoc;
import com.madmax.stool.approval.model.vo.ApprDocType;
import com.madmax.stool.approval.model.vo.ApprLine;
import com.madmax.stool.approval.model.vo.Approval;
import com.madmax.stool.approval.model.vo.DeptUsers;
import com.madmax.stool.approval.model.vo.User;

public interface ApprovalService {
	
	
	List<DeptUsers> selectDeptInfo();
	List<User> selectDeptUsers(DeptUsers du);
	List<ApprDocType> selectApprDocList(int cPage, int numPerPage);
	int selectApprDocListCount();
	ApprDocType selectApprDocForm(int dNo);
	int insertApproval(Approval appr, List<ApprLine> lines);
	List<Approval> selectApprReqList(String userId);
	ApprDoc selectApprDoc(int apprNo);
	ApprDoc selectDoApproval(Approval approval);
	int updateTemporary(int apprNo);
	int deleteDoc(int apprNo);
	List<Approval> selectApprTempList(String userId);
	List<Approval> selectApprWaitList(String userId);

	
	
}
