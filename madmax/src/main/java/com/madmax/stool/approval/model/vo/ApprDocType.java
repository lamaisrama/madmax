package com.madmax.stool.approval.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ApprDocType {
	private int apprDocTypeNo;
	private String typeTitle;
	private String typeContent;
}
