package com.madmax.stool.approval.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Approval {
	private int apprNo;
	private String apprTitle;
	private String apprContent;
	private String apprText;
	private Date updateDate;
	private Date writeDate;
	private String userId;
	private int apprDocTypeNo;
	private int finalApprStep;
	private int currApprStep;
	private int apprStatus;
	private String typeTitle;
}
