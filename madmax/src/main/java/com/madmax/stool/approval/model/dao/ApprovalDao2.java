package com.madmax.stool.approval.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.approval.model.vo.Approval;

public interface ApprovalDao2 {
	
	List<Approval> selectApprProgList(SqlSessionTemplate session,String userId);

}
