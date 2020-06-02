package com.madmax.stool.admin.model.vo;

import com.madmax.stool.project.model.vo.TaskReport;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DeptReport {
	
	private String deptName;
	private int cnt;

}
