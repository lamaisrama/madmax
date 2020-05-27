package com.madmax.stool.notification.model.dao;

import java.util.List;

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


	
}
