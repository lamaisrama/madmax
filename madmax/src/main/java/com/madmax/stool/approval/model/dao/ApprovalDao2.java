package com.madmax.stool.approval.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.approval.model.vo.ApprDoc;
import com.madmax.stool.approval.model.vo.Approval;

public interface ApprovalDao2 {
	
	List<Approval> selectApprProgList(SqlSessionTemplate session, int cPage, int numPerPage, String userId);

	List<Approval> selectApprDoneList(SqlSessionTemplate session, int cPage, int numPerPage, String userId);
	
	List<ApprDoc> selectApprOpinionList(SqlSessionTemplate session,Approval approval);
	
	List<ApprDoc> selectApprDoneOpinionList(SqlSessionTemplate session,Approval approval);

	int selectApprProgListCount(SqlSessionTemplate session, String userId);

	int selectApprDoneListCount(SqlSessionTemplate session, String userId);

}
