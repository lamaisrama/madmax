package com.madmax.stool.notification.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.madmax.stool.notification.model.service.NotificationService;
import com.madmax.stool.notification.model.vo.Notification;

@Controller
public class NotificationController {
	@Autowired
	NotificationService service; 

	@RequestMapping("/noti/notification.do")
	public String selectNotification(String userId, Model m) {
		System.out.println("userId : "+userId);
		List<Notification> unread= service.selectUnreadNotification(userId);
		List<Notification> read = service.selectReadNotification(userId);
		m.addAttribute("unread", unread);
		m.addAttribute("read", read);
		return "common/notification";
	}
	
	
	
}
