package com.madmax.stool.approval.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class ApprSearch {
	
	private String draftName;
	private String startDate;
	private String endDate;
	private String userId;
	private int apprStatus;

}
