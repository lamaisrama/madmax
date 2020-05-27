package com.madmax.stool.notification.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Notification {
	private int notNo;
	private String receiveId;
	private String senderId;
	private String notType;
	private Date notTime;
	private Date notReadTime;
	private int boardNo;
	//sender 정보 
	private String userName; 
	private String profile;
	//Notification 발생한 프로젝트
	private int projectNo;
	private String projectTitle;
	//작성 글 제목
	private String writingTitle;
	//작성 일정 제목
	private String taskTitle;
	//작성 스케쥴 제목
	private String scheduleTitle;
	//코멘트 내용
	private String comment;
	
}
