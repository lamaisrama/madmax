package com.madmax.stool.approval.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.approval.model.vo.DeptUsers;
import com.madmax.stool.approval.model.vo.User;

@Repository
public class ApprovalDaoImpl implements ApprovalDao{

	@Override
	public List<DeptUsers> selectDeptInfo(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("approval.selectDeptInfo");
	}

	@Override
	public List<User> selectDeptUsers(SqlSessionTemplate session, DeptUsers du) {
		return session.selectList("approval.selectDeptUsers", du);
	}
	
	

	

	
}
