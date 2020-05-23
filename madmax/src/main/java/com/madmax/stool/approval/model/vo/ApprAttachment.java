package com.madmax.stool.approval.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ApprAttachment {
	private int docFileNo;
	private String docOriFileName;
	private String docRenamedFile;
	private int apprNo;
}
