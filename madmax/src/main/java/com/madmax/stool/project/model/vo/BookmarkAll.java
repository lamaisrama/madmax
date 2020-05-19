package com.madmax.stool.project.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookmarkAll {
	private String userId;
	private int boardNo;
	private int projectNo;
	private String boardType;
	private String pinpost;
	//task관련
	private int taskNo;
	private String taskTitle;
	private String taskState;
	private String taskProiority;
	private String taskStartDate;
	private String taskEndDate;
	private String taskContent;
	private String taskId;
	private String taskTime;
	//writing 관련
	private int writingNo;
	private String writingTitle;
	private String writingContent;
	private String writingId;
	private String writingTime;
	//schedule 관련
	private int scheduleNo;
	private String scheduleTitle;
	private String scheduleStartDate;
	private String scheduleEndDate;
	private String schedulePlace;
	private String scheduleMemo;
	private String scheduleId;
	private String scheduleTime;
}
