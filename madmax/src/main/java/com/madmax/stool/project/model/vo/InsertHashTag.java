package com.madmax.stool.project.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InsertHashTag {
	
	private int hashtagNo;
	private String hashtagText;
	private int boardNo;
	
}
