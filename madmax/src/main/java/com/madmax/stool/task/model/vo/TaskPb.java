package com.madmax.stool.task.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TaskPb {

	private int boardNo;
	private int taskNo;
	private String taskTitle;
	private String taskState;
	private String taskProiority;//오타수정부탁 디폴트는 없음!
	private Date taskStartDate;
	private Date taskEndDate;
	private String taskContent;
	private String taskId;
	private int projectNo;
	private String boardType;
	private int pinpost;
	
}
