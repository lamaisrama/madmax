package com.madmax.stool.approval.model.service;

import java.util.List;

import com.madmax.stool.approval.model.vo.ApprDoc;
import com.madmax.stool.approval.model.vo.ApprSearch;
import com.madmax.stool.approval.model.vo.Approval;

public interface ApprovalService2 {

	List<Approval> selectApprProgList(int cPage, int numPerPage, String userId);
	
	List<Approval> selectApprDoneList(int cPage, int numPerPage, String userId);
	
	List<ApprDoc> selectApprOpinionList(Approval approval);
	
	List<ApprDoc> selectApprDoneOpinionList(Approval approval);

	int selectApprProgListCount(String userId);

	int selectApprDoneListCount(String userId);
	
	List<Approval> selectSearchApprReqBox(ApprSearch search);
	List<Approval> selectSearchApprTempBox(ApprSearch search);
	List<Approval> selectSearchApprWaitBox(ApprSearch search);
	
	List<Approval> selectSearchApprProgBox(ApprSearch search);
	
	
	List<Approval> selectSearchApprDoneBox(ApprSearch search);
	
	List<Approval> selectSearchMyDocBox(ApprSearch search);
	List<Approval> selectSearchDeptDocBox(ApprSearch search);
	List<Approval> searchRefferedDocBox(ApprSearch search);
}
