package com.madmax.stool.approval.model.service;

import java.util.List;

import com.madmax.stool.approval.model.vo.DeptUsers;
import com.madmax.stool.approval.model.vo.User;

public interface ApprovalService {
	
	
	List<DeptUsers> selectDeptInfo();
	List<User> selectDeptUsers(DeptUsers du);
}
