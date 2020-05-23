package com.madmax.stool.approval.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.approval.model.vo.ApprAttachment;
import com.madmax.stool.approval.model.vo.ApprDoc;
import com.madmax.stool.approval.model.vo.ApprDocType;
import com.madmax.stool.approval.model.vo.ApprLine;
import com.madmax.stool.approval.model.vo.AppredDoc;
import com.madmax.stool.approval.model.vo.Approval;
import com.madmax.stool.approval.model.vo.DeptUsers;
import com.madmax.stool.approval.model.vo.User;

public interface ApprovalDao {

	List<DeptUsers> selectDeptInfo(SqlSessionTemplate session);
	List<User> selectDeptUsers(SqlSessionTemplate session, DeptUsers du);
	List<ApprDocType> selectApprDocList(SqlSessionTemplate session, int cPage, int numPerPage);
	int selectApprDocListCount(SqlSessionTemplate session);
	ApprDocType selectApprDocForm(SqlSessionTemplate session, int dNo);
	
	int insertApproval(SqlSessionTemplate session, Approval appr);
	int insertApprLine(SqlSessionTemplate session, ApprLine apprLine);
	int insertAppredDoc(SqlSessionTemplate session, AppredDoc ad);
	int insertApprAttachment(SqlSessionTemplate session, ApprAttachment at);
	
	List<Approval> selectApprReqList(SqlSessionTemplate session, String userId);
	ApprDoc selectApproval(SqlSessionTemplate session, int apprNo);
	ApprDoc selectDoApproval(SqlSessionTemplate session, Approval approval);

	List<ApprLine> selectApprLine(SqlSessionTemplate session, int apprNo);
	int updateTemporary(SqlSessionTemplate session, int apprNo);
	int deleteDoc(SqlSessionTemplate session, int apprNo);
	List<Approval> selectApprTempList(SqlSessionTemplate session, String userId);
	List<Approval> selectApprWaitList(SqlSessionTemplate session, String userId);
	String selectReceiverName(SqlSessionTemplate session, String userId);
	
	int updateAppr(SqlSessionTemplate session, ApprLine line);
	int updateApprStatusEnd(SqlSessionTemplate session, ApprLine line);
	int updateApprStatusIng(SqlSessionTemplate session, ApprLine line);
	List<ApprDoc> selectAttachAppredDoc(SqlSessionTemplate session, String deptCode);
	List<AppredDoc> selectAppredDoc(SqlSessionTemplate session, int apprNo);
	List<ApprAttachment> selectApprAttachment(SqlSessionTemplate session, int apprNo);


}