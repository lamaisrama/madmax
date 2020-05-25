package com.madmax.stool.approval.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.approval.model.vo.ApprAttachment;
import com.madmax.stool.approval.model.vo.ApprDoc;
import com.madmax.stool.approval.model.vo.ApprDocType;
import com.madmax.stool.approval.model.vo.ApprLine;
import com.madmax.stool.approval.model.vo.AppredDoc;
import com.madmax.stool.approval.model.vo.Approval;
import com.madmax.stool.approval.model.vo.DeptUsers;
import com.madmax.stool.approval.model.vo.User;

@Repository
public class ApprovalDaoImpl implements ApprovalDao{

	@Override
	public List<DeptUsers> selectDeptInfo(SqlSessionTemplate session) {
		return session.selectList("approval.selectDeptInfo");
	}

	@Override
	public List<User> selectDeptUsers(SqlSessionTemplate session, DeptUsers du) {
		return session.selectList("approval.selectDeptUsers", du);
	}

	@Override
	public List<ApprDocType> selectApprDocList(SqlSessionTemplate session, int cPage, int numPerPage) {
		return session.selectList("approval.selectApprDocList", null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectApprDocListCount(SqlSessionTemplate session) {
		return session.selectOne("approval.selectApprDocListCount");
	}


	@Override
	public ApprDocType selectApprDocForm(SqlSessionTemplate session, int dNo) {
		return session.selectOne("approval.selectApprDocForm", dNo);
	}
	
	
	@Override
	public int insertApproval(SqlSessionTemplate session, Approval appr) {
		return session.insert("approval.insertApproval", appr);
	}

	@Override
	public int insertApprLine(SqlSessionTemplate session, ApprLine apprLine) {
		return session.insert("approval.insertApprLine", apprLine);
	}

	@Override
	public int insertAppredDoc(SqlSessionTemplate session, AppredDoc ad) {
		return session.insert("approval.insertAppredDoc", ad);
	}

	@Override
	public int insertApprAttachment(SqlSessionTemplate session, ApprAttachment at) {
		return session.insert("approval.insertApprAttachment", at);
	}

	@Override
	public List<Approval> selectApprReqList(SqlSessionTemplate session, String userId) {
		return session.selectList("approval.selectApprReqList", userId);
	}

	@Override
	public ApprDoc selectApproval(SqlSessionTemplate session, int apprNo) {
		return session.selectOne("approval.selectApproval", apprNo);
	}

	
	@Override
	public ApprDoc selectDoApproval(SqlSessionTemplate session, Approval approval) {
		return session.selectOne("approval.selectDoApproval", approval);
	}

	@Override
	public List<ApprLine> selectApprLine(SqlSessionTemplate session, int apprNo) {
		return session.selectList("approval.selectApprLine", apprNo);
	}
	
	@Override
	public List<AppredDoc> selectAppredDoc(SqlSessionTemplate session, int apprNo) {
		return session.selectList("approval.selectAppredDoc", apprNo);
	}

	@Override
	public List<ApprAttachment> selectApprAttachment(SqlSessionTemplate session, int apprNo) {
		return session.selectList("approval.selectApprAttachment", apprNo);
	}

	@Override
	public String selectReceiverName(SqlSessionTemplate session, String userId) {
		return session.selectOne("approval.selectReceiverName", userId);
		
	}

	@Override
	public int updateTemporary(SqlSessionTemplate session, int apprNo) {
		return session.update("approval.updateTemporary", apprNo);
	}

	@Override
	public int deleteDoc(SqlSessionTemplate session, int apprNo) {
		return session.delete("approval.deleteDoc", apprNo);
	}

	@Override
	public List<Approval> selectApprTempList(SqlSessionTemplate session, String userId) {
		return session.selectList("approval.selectApprTempList", userId);
	}

	@Override
	public List<Approval> selectApprWaitList(SqlSessionTemplate session, String userId) {
		return session.selectList("approval.selectApprWaitList", userId);
	}

	@Override
	public int updateAppr(SqlSessionTemplate session, ApprLine line) {
		// TODO Auto-generated method stub
		return session.update("approval.updateAppr", line);
	}

	@Override
	public int updateApprStatusEnd(SqlSessionTemplate session, ApprLine line) {
		// TODO Auto-generated method stub
		return session.update("approval.updateApprovalStatusEnd", line);
	}

	@Override
	public int updateApprStatusIng(SqlSessionTemplate session, ApprLine line) {
		// TODO Auto-generated method stub
		return session.update("approval.updateApprovalStatusIng", line);
	}

	@Override
	public List<ApprDoc> selectAttachAppredDoc(SqlSessionTemplate session, String deptCode) {
		return session.selectList("approval.selectAttachAppredDoc", deptCode);
	}

	@Override
	public int updateUserSign(SqlSessionTemplate session, String userId) {
		return session.update("approval.updateUserSign", userId);
	}

	@Override
	public int updateApproval(SqlSessionTemplate session, Approval appr) {
		return session.update("approval.updateApproval", appr);
	}

	@Override
	public void deleteApprLine(SqlSessionTemplate session, int apprNo) {
		session.delete("approval.deleteApprLine", apprNo);
	}

	@Override
	public void deleteAppredDoc(SqlSessionTemplate session, int apprNo) {
		session.delete("approval.deleteAppredDoc", apprNo);
	}

	@Override
	public int deleteApprAttachment(SqlSessionTemplate session, int docFileNo) {
		return session.delete("approval.deleteApprAttachment", docFileNo);
	}	
	
	
	

	
}
