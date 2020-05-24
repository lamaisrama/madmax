package com.madmax.stool.admin.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminUserManage {
	
	private String userName;
	private String userId;
	private Date hireDate;
	private String phone;
	private String deptCode;
	private String deptName;
	private String jobCode;
	private String jobName;
	
}
