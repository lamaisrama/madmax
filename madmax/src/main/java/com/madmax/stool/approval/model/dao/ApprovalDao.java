package com.madmax.stool.approval.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.approval.model.vo.DeptUsers;
import com.madmax.stool.approval.model.vo.User;

public interface ApprovalDao {

	List<DeptUsers> selectDeptInfo(SqlSessionTemplate session);
	List<User> selectDeptUsers(SqlSessionTemplate session, DeptUsers du);
}
