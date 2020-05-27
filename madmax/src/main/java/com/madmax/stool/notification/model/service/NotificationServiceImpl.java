package com.madmax.stool.notification.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.madmax.stool.notification.model.dao.NotificationDao;
import com.madmax.stool.notification.model.vo.Notification;

@Service
public class NotificationServiceImpl implements NotificationService{
	@Autowired 
	NotificationDao dao;
	@Autowired
	SqlSessionTemplate session;
	
	
	@Override
	public List<Notification> selectUnreadNotification(String userId) {
		//1. Notification List 가져오기
		List<Notification> unread = dao.selectUnreadNotification(session,userId);
		//2. NotType에 따라 분기해서 가져오기
		for(Notification n : unread) {
			String type=n.getNotType();
			int boardNo = n.getBoardNo();
			switch(type) {
				case "writing" : case "writingcomment": {
					n.setWritingTitle(dao.selectWritingTitle(session, boardNo));
					break;
				}
				case "task" : case "taskcomment":  {
					n.setTaskTitle(dao.selectTaskTitle(session, boardNo));
					break;
				}
				case "schedule" : case "schedulecomment":{
					n.setScheduleTitle(dao.selectScheduleTitle(session, boardNo));
					break;
				}
//			case "schedulecomment": {
//					int scheduleNo = dao.selectScheduleNo(session, boardNo);
//					n.setScheduleTitle(dao.selectScheduleTitle(session, boardNo));
//					n.setComment(dao.selectScheduleComment(session, scheduleNo)); 
//					break;
//				}
			}
		}
		for(Notification n : unread) {
			System.out.println(n.getTaskTitle());
			System.out.println(n.getWritingTitle());
			System.out.println(n.getScheduleTitle());
			
		}
		return unread;
	}


	@Override
	public List<Notification> selectReadNotification(String userId) {
		List<Notification> read = dao.selectReadNotification(session, userId);
		//2. NotType에 따라 분기해서 가져오기
		for(Notification n : read) {
			String type=n.getNotType();
			int boardNo = n.getBoardNo();
			switch(type) {
				case "writing" : case "writingcomment": {
					n.setWritingTitle(dao.selectWritingTitle(session, boardNo));break;
				}
				case "task" : case "taskcomment":  {
					n.setTaskTitle(dao.selectTaskTitle(session, boardNo));break;
				}
				case "schedule" : case "schedulecomment":{
					n.setScheduleTitle(dao.selectScheduleTitle(session, boardNo));break;
				}
			}
		}
		return read;
	}

	
}
