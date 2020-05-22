package com.madmax.stool.approval.model.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DeptUsers {
	private String deptCode;
	private String deptName;
	private List<User> users;
	
}
