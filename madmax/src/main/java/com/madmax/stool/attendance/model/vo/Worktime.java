package com.madmax.stool.attendance.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Worktime {

	
	private int managementNo;
	private Date comeTime;
	private Date goTime;
	private String timeState;
	private String userId;
	private Date checkDate;
	private Date today;
	
}
