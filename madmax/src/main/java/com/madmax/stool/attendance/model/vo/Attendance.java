package com.madmax.stool.attendance.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Attendance {
	
	private String userId;
	private int managementNo;
	private int workStateNo;
	private String employeeState;
	// 사유는 고민....
	private String reason;

}
