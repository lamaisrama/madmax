package com.madmax.stool.project.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InsertWriting {

	private int writingNo;
	private String writingTitle;
	private String writingContent;
	private String writingId;
	private int boardNo;
	private Date writingTime;
	
}
