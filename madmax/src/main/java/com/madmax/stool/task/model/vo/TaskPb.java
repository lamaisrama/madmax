package com.madmax.stool.task.model.vo;



import java.sql.Date;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

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
	
	//@JsonFormat(shape=Shape.STRING,pattern="yyyy-mm-dd hh:mm:ss", timezone="GMT+9")
	private String taskStartDate;
	//@JsonFormat(shape=Shape.STRING,pattern="yyyy-mm-dd hh:mm:ss", timezone="GMT+9")
	private String taskEndDate;
	
	private String taskContent;
	private String taskId;
	private int projectNo;
	private String boardType;
	private String pinpost;
	private String userName;
	private String profile;
	private String taskTime;
	
}
