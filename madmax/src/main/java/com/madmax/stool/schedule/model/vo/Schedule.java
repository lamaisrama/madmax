package com.madmax.stool.schedule.model.vo;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Schedule {
	
	private int scheduleNo;
	private String scheduleTitle;
	private Date scheduleStartdate;
	private Date scheduleEnddate;
	private String schedulePlace;
	private String scheduleMemo;
	private String scheduleId;
	private int boardNo;
	
}

	
	

