package com.madmax.stool.attendance.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AttdSearch {

	private String startDate;
	private String endDate;
	private String userId;
}
