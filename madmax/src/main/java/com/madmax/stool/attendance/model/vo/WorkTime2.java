package com.madmax.stool.attendance.model.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class WorkTime2 {
	
	private int managementNo;
	private Date comeTime;
	private Date goTime;
	private String timeState;
	private String userId;
	private Date checkDate;
	private Date today;
	
}
