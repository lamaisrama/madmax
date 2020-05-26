package com.madmax.stool.approval.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.approval.model.vo.ApprDoc;
import com.madmax.stool.approval.model.vo.ApprSearch;
import com.madmax.stool.approval.model.vo.Approval;

@Repository
public class ApprovalDaoImpl2 implements ApprovalDao2 {

	@Override
	public List<Approval> selectApprProgList(SqlSessionTemplate session, int cPage, int numPerPage, String userId) {
		// TODO Auto-generated method stub
		return session.selectList("approval2.selectApprProgList",userId, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public List<Approval> selectApprDoneList(SqlSessionTemplate session, int cPage, int numPerPage, String userId) {
		// TODO Auto-generated method stub
		return session.selectList("approval2.selectApprDoneList",userId, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public List<ApprDoc> selectApprOpinionList(SqlSessionTemplate session, Approval approval) {
		// TODO Auto-generated method stub
		return session.selectList("approval2.selectApprOpinionList",approval);
	}

	@Override
	public List<ApprDoc> selectApprDoneOpinionList(SqlSessionTemplate session, Approval approval) {
		// TODO Auto-generated method stub
		return session.selectList("approval2.selectApprDoneOpinionList",approval);
	}

	@Override
	public int selectApprProgListCount(SqlSessionTemplate session, String userId) {
		return session.selectOne("approval2.selectApprProgListCount", userId);
	}

	@Override
	public int selectApprDoneListCount(SqlSessionTemplate session, String userId) {
		return session.selectOne("approval2.selectApprDoneListCount", userId);
	}

	@Override
	public List<Approval> selectSearchApprReqBox(SqlSessionTemplate session, ApprSearch search) {
		// TODO Auto-generated method stub
		return session.selectList("approval2.selectSearchApprReqBox",search);
	}
	
	@Override
	public List<Approval> selectSearchApprTempBox(SqlSessionTemplate session, ApprSearch search) {
		// TODO Auto-generated method stub
		return session.selectList("approval2.selectSearchApprTempBox",search);
	}
	@Override
	public List<Approval> selectSearchApprWaitBox(SqlSessionTemplate session, ApprSearch search) {
		// TODO Auto-generated method stub
		return session.selectList("approval2.selectSearchApprWaitBox",search);
	}
	
	@Override
	public List<Approval> selectSearchApprProgBox(SqlSessionTemplate session, ApprSearch search) {
		// TODO Auto-generated method stub
		return session.selectList("approval2.selectSearchApprProgBox",search);
	}
	
	@Override
	public List<Approval> selectSearchApprDoneBox(SqlSessionTemplate session, ApprSearch search) {
		// TODO Auto-generated method stub
		return session.selectList("approval2.selectSearchApprDoneBox",search);
	}
	
	
	
	@Override
	public List<Approval> selectSearchMyDocBox(SqlSessionTemplate session, ApprSearch search) {
		// TODO Auto-generated method stub
		return session.selectList("approval2.selectSearchMyDocBox",search);
	}
	
	
}
