package com.madmax.stool.calendar.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Calendar {
 //캘린더에 들어갈 내용들 받아오기
	
	private String scheduleTitle;
	private Date scheduleStartDate;
	private Date scheduleEndDate;
	
}
