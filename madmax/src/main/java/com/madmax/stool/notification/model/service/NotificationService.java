package com.madmax.stool.notification.model.service;

import java.util.List;
import java.util.Map;

import com.madmax.stool.notification.model.vo.Notification;

public interface NotificationService {

	List<Notification> selectUnreadNotification(String userId);
	List<Notification> selectReadNotification(String userId);
	void updateAllNotiRead(String userId);
	List<Notification> findNotification(Map<String, String> map);
	int selectUnreadNotificationCount(String sender);

}
