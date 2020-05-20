package com.madmax.stool.project.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InsertTask {
	private int taskNo;
	private String taskTitle;
	private String taskState;
	private String taskProiority;
	private Date taskStartdate;
	private Date taskEnddate;
	private String taskContent;
	private String taskId;
	private int boardNo;	
}
