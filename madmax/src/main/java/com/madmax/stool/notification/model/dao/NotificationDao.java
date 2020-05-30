package com.madmax.stool.notification.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.notification.model.vo.Notification;

public interface NotificationDao {

	List<Notification> selectUnreadNotification(SqlSessionTemplate session, String userId);
	List<Notification> selectReadNotification(SqlSessionTemplate session, String userId);
	String selectWritingTitle(SqlSessionTemplate session,int boardNo);
	String selectTaskTitle(SqlSessionTemplate session,int boardNo);
	String selectScheduleTitle(SqlSessionTemplate session,int boardNo);
//	int seletWritingNo(SqlSessionTemplate session,int boardNo);
//	String selectWritingComment(SqlSessionTemplate session,int writingNo);
//	int selectTaskNo(SqlSessionTemplate session,int boardNo);
//	String selectTaskComment(SqlSessionTemplate session,int taskNo);
//	int selectScheduleNo(SqlSessionTemplate session,int boardNo);
//	String selectScheduleComment(SqlSessionTemplate session,int scheduleNo);
	int selectUnreadNotificationCount(SqlSessionTemplate session, String userId);
	int updateAllNotiRead(SqlSessionTemplate session, String userId);
	List<Notification> findNotification(SqlSessionTemplate session, Map<String, String> map);
	int updateUnreadNotification(SqlSessionTemplate session, int notNo);


	
}
