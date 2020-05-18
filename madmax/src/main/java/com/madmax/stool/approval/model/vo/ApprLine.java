package com.madmax.stool.approval.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ApprLine {

	private int apprNo;
	private String apprType;
	private int apprStep;
	private String apprUser;
		
}