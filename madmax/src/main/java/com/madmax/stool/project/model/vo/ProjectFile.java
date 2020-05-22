package com.madmax.stool.project.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProjectFile {
	private int pjFileNo;
	private String pjFileOriname;
	private String pjFileRenamedname;
	private int projectNo;
}
