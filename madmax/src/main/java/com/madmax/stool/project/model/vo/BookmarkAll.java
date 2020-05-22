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
	//각각의 이름
	private String taskName;//업무글 작성자 이름
	private String tmName;//업무담당자 이름
	private String bmName;//북마크한사람(로그인 유저이름)
	private String wName;//글 작성자 이름
	private String sName;//일정 작성자 이름
	private String notiName; 
	
}
