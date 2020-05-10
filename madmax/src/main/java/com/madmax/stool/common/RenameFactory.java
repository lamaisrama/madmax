package com.madmax.stool.common;

import java.text.SimpleDateFormat;

public class RenameFactory {
	
	public static String getRenamedFileName(String original) {
		String rename="";
		
		String ext = original.substring(original.lastIndexOf("."));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		int rdn = (int)Math.random()*1000;
		rename=sdf.format(System.currentTimeMillis())+"_"+rdn+ext;
		
		return rename;
	}
}
