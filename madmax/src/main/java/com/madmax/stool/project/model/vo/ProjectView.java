package com.madmax.stool.project.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProjectView {
	private int projectNo;//프로젝트 번호
	private String projectTitle;
	private String projectColor;
	private String projectType;
	private String userId;
	private int boardNo;
	private String boardType; //W:글 T:업무 S:일정
	private String pinPost; // Y:고정글, N:고정글 x
	private int writingNo;
	private String writingTitle;
	private String writingContent;
	private String writingId;
	private Date writingTime;
	private int writingCommentNo;
	private String writingComment;
	private Date writingCommentTime;
	private String writingOriname;
	private String writingRename;
	
	private int taskNo;
	private String taskTitle;
	private String taskState; //업무 상태 : 요청,진행, 피드백, 완료, 보류
	private String taskPriority; // 업무 우선 순위 : 긴급, 높음, 보통, 낮음, 없음
	private Date taskStartDate;
	private Date taskEndDate;
	private String taskContent;
	private String taskId;
	private Date taskTime; //업무글 작성시간
	private int taskCommentNo; //업무 댓글 번호
	private String taskComment;
	private Date taskCommentTime;
	private String taskManagerName; //업무담당자이름
	private String taskOriname; //업무 오리지널 이름 파일
	private String taskRename;  //업무 리네임 파일
	
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
