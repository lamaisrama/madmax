package com.madmax.stool.project.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Writing {
//	프로젝트 전체글 컬럼 다 넣고
//	글 종류에 따라서 3개 나눠지는걸 vo 따로 만듬
	
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
	
	
	

}
