package com.madmax.stool.project.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InsertNotification {
	
	private int notNo;
	private String receiveId;
	private String senderId;
	private String notType;
	private Date notTime;
	private Date notReadTime;
	private int boardNo;
	
}
