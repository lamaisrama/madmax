package com.madmax.stool.project.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Project {

	private int projectNo;
	private String projectTitle;
	private String projectColor;
	private String projectType;
	private String userId;
	private String pjMemberNo;
	private String pjMemberId;
	private String members;
	private String deptName;
}
