package com.madmax.stool.user.model.exception;

public class UserException extends RuntimeException{
	
	public UserException() {}
	
	public UserException(String message) {
		
		super(message);
	}
}
