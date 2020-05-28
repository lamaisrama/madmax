package com.madmax.stool.notification.controller;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NotificationMsg {
	private String type;
	private String sender;
	private String receiver;
	private String msg;
	
}
