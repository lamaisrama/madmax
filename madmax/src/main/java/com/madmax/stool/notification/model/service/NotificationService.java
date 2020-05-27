package com.madmax.stool.notification.model.service;

import java.util.List;

import com.madmax.stool.notification.model.vo.Notification;

public interface NotificationService {

	List<Notification> selectUnreadNotification(String userId);
	List<Notification> selectReadNotification(String userId);


}
