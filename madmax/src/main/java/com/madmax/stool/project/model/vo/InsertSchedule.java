package com.madmax.stool.project.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InsertSchedule {
	private int scheduleNo;
	private String scheduleTitle;
	private Date scheduleStartdate;
	private Date scheduleEnddate;
	private String schedulePlace;
	private String scheduleMemo;
	private String scheduleId;
	private int boardNo;
	
}
