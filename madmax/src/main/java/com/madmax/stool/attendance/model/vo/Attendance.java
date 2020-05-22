package com.madmax.stool.attendance.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Attendance {
	
	private int requestNo;
	private String requestReason;
	private String requestCategory;
	private Date requestDate;
	private String requestResult;
	private String userId;
	private Date comeTime;
	private Date goTime;
	private String timeState;
	private int managementNo;

}
