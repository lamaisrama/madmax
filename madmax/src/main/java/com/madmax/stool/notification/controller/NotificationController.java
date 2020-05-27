package com.madmax.stool.notification.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.madmax.stool.notification.model.service.NotificationService;
import com.madmax.stool.notification.model.vo.Notification;

@Controller
public class NotificationController {
	@Autowired
	NotificationService service; 

	@RequestMapping("/noti/notification.do")
	public String selectNotification(String userId, Model m) {
		List<Notification> unread= service.selectUnreadNotification(userId);
		List<Notification> read = service.selectReadNotification(userId);
		m.addAttribute("unread", unread);
		m.addAttribute("read", read);
		return "common/notification";
	}
	
	@RequestMapping("/noti/readAllNoti")
	public String readAllNoti(String userId, Model m) {
		System.out.println(userId);
		int result=0;
		try {			
			service.updateAllNotiRead(userId);
			result=1;
		}catch(RuntimeException e) {
			result=0;
		}
		String msg="";
		if(result>0) msg="모두 읽음으로 처리되었습니다."; 
		else msg="모두 읽음 처리 에러";
		m.addAttribute("msg", msg);
		return "jsonView";
		
	}
	
	@RequestMapping("/noti/findNoti")
	public String findNoti(@RequestParam Map<String, String> map, Model m) {
		List<Notification> find= service.findNotification(map);
		m.addAttribute("find", find);
		return "common/noti-find";
	}
	
	
}
