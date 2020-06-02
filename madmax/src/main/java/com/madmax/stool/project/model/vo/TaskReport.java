package com.madmax.stool.project.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TaskReport {
	
	private String taskState;
	private int projectNo;
	private int cnt;

}
