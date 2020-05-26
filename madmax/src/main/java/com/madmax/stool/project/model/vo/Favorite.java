package com.madmax.stool.project.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Favorite {

	private int projectNo;
	private String userId;
	private String projectTitle; 
	
}
