package com.madmax.stool.task.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Task {

	private int boardNo;
	private String taskTitle;
	private String tastState;
	private String taskproiority;//오타수정부탁 디폴트는 없음!
	private Date taskStartDate;
	private Date taskEndDate;
	private String taskContent;
	private String taskId;
	private int projectNo;
	
}
