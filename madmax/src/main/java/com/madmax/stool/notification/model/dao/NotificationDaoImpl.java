package com.madmax.stool.notification.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.madmax.stool.notification.model.vo.Notification;

@Repository
public class NotificationDaoImpl implements NotificationDao {
	@Autowired
	Logger logger;
	
	@Override
	public List<Notification> selectUnreadNotification(SqlSessionTemplate session, String userId) {
		return session.selectList("notification.selectUnreadNotification", userId);
	}

	@Override
	public List<Notification> selectReadNotification(SqlSessionTemplate session, String userId) {
		return session.selectList("notification.selectReadNotification", userId);
	}

	@Override
	public String selectWritingTitle(SqlSessionTemplate session, int boardNo) {
		return session.selectOne("notification.selectWritingTitle", boardNo);
	}

	@Override
	public String selectTaskTitle(SqlSessionTemplate session, int boardNo) {
		return session.selectOne("notification.selectTaskTitle", boardNo);
	}

	@Override
	public String selectScheduleTitle(SqlSessionTemplate session, int boardNo) {
		return session.selectOne("notification.selectScheduleTitle", boardNo);
	}

	@Override
	public int selectUnreadNotificationCount(SqlSessionTemplate session, String userId) {
		return session.selectOne("notification.selectUnreadNotificationCount", userId);
	}

	@Override
	public int updateAllNotiRead(SqlSessionTemplate session, String userId) {
		return session.update("notification.updateAllNotiRead", userId);
	}

	@Override
	public List<Notification> findNotification(SqlSessionTemplate session, Map<String, String> map) {
		return session.selectList("notification.findNotification", map);
	}
	
	
	
	
	
}
