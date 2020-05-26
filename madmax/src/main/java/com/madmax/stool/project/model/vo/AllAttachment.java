package com.madmax.stool.project.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AllAttachment {
	
	private int writingno;
	private int fileno;
	private String writingoriname;
	private String writingrename;
	private String boardtype;
	private String username;
	private Date writingtime;


}
