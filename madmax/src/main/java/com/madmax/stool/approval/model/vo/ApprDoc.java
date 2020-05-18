package com.madmax.stool.approval.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data

@AllArgsConstructor
@NoArgsConstructor
public class ApprDoc {
	private int apprNo;
	private String apprTitle;
	private String apprContent;
	private String apprText;
	private Date updateDate;
	private Date writeDate;
	private String userId;
	private String userName;
	private String jobCode;
	private String jobName;
	private String deptCode;
	private String deptName;
	private int apprDocTypeNo;
	private int finalApprStep;
	private int currApprStep;
	private int apprStatus;
	private String typeTitle;
	private List<ApprLine> apprLine;
}
