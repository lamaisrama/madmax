package com.madmax.stool.project.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InsertProjectBoard {
	private int boardNo;
	private int projectNo;
	private String boardType;
	private String pinPost;
}
