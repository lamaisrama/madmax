package com.madmax.stool.project.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Schedule {
	private int projectNo;//프로젝트 번호
	private String projectTitle;
	private String projectColor;
	private String projectType;
	private String userId;
	private int boardNo;
	private String boardType; //W:글 T:업무 S:일정
	private String pinPost; // Y:고정글, N:고정글 x
	private int scheduleNo;
	private String scheduleTitle;
	private Date scheduleStartDate;
	private Date scheduleEndDate;
	private String schedulePlace;
	private String scheduleMemo;
	private String scheduleId;
	private Date scheduleTime; //일정글 작성시간
	private int scheduleCommentNo; //일정 댓글 번호 
	private String scheduleComment; //일정 댓글 내용
	private String scheduleCommentTime; //일정 댓글 시간
	private String scheduleManagerName;//일정 참여자 이름
}
