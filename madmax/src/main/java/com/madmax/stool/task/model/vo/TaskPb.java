package com.madmax.stool.task.model.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

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

	private String taskStartDate;
	
	private String taskEndDate;
	private String taskContent;
	private String taskId;
	private int projectNo;
	private String boardType;
	private int pinpost;
	private String userName;
	private String profile;
	
}
