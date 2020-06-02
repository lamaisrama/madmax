package com.madmax.stool.project.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProjectMember {
	private int pjMemberNo;
	private int projectNo;
	private String userId;
	private String userName;
	private String profile;
	private String deptCode;
	private String jobCode;
	private String deptName;
	private String jobName;
	private String phone;
	private String email;
}
