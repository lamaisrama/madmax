package com.madmax.stool.project.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Notification {//언급테이블 vo
	
	private int notNo;
	private String receiveId;
	private String senderId;
	private String notType;
	private String notReadTime;
	private String boardNo;
	
	

}
