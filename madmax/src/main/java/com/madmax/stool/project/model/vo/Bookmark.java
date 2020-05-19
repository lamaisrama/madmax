package com.madmax.stool.project.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Bookmark {
	//bookmark 테이블이랑 projectboard 테이블을 조인
	private String userId;
	private int boardNo;
	private int projectNo;
	private String boardType;
	private String pinpost;
	
}
