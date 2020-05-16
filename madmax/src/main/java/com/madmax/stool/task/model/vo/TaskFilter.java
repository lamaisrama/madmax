package com.madmax.stool.task.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TaskFilter {
	private String task;
	private String status;
	private String priority;
	private String startDate;
	private String endDate;
	private String userId;
}
