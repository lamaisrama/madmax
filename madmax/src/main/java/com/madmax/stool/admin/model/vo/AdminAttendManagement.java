package com.madmax.stool.admin.model.vo;

import java.util.Date;

import com.madmax.stool.attendance.model.vo.Worktime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminAttendManagement {

	private int requestNo;
	private String requestReason;
	private String requestCategory;
	private Date requestDate;
	private String requestResult;
	private String userId;
	private String userName;
	private String employeeState;
	private int managementNo;
	private int workStateNo;
}
