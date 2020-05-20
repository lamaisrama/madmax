package com.madmax.stool.approval.model.service;

import java.util.List;

import com.madmax.stool.approval.model.vo.Approval;

public interface ApprovalService2 {

	List<Approval> selectApprProgList(String userId);
	
	List<Approval> selectApprDoneList(String userId);
	
}
