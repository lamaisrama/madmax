package com.madmax.stool.approval.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.approval.model.vo.ApprDocType;
import com.madmax.stool.approval.model.vo.ApprLine;
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
}
