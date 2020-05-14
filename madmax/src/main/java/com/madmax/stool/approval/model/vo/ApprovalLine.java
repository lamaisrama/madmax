package com.madmax.stool.approval.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ApprovalLine {
	private int apprStep;
	private String apprType;
	private String userInfo;
		
}
