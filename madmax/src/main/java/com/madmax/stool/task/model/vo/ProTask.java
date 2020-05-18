package com.madmax.stool.task.model.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProTask {

	private int projectNo;
	private String projectTitle;
	private String projectColor;
	private String projectType;
	private String userId;
	private String pjMemberNo;
	private String pjMemberId;
	private List<TaskPb> tasks;
}
