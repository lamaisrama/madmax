package com.madmax.stool.project.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.project.model.vo.Bookmark;
import com.madmax.stool.project.model.vo.BookmarkAll;
import com.madmax.stool.project.model.vo.Notification;

@Repository
public class BookmarkDaoImpl implements BookmarkDao {

	@Override
	public List<Bookmark> selectBkList(SqlSessionTemplate session, String id) {
		// TODO Auto-generated method stub
		return session.selectList("bookmark.selectBkList", id);
	}

	@Override
	public List<BookmarkAll> selectBoardWriting(SqlSessionTemplate session,Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectList("bookmark.selectBkW",map);
	}

	@Override
	public List<BookmarkAll> selectBoardTask(SqlSessionTemplate session, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectList("bookmark.selectBkT",map);
	}

	@Override
	public List<BookmarkAll> selectBoardSchedule(SqlSessionTemplate session,Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectList("bookmark.selectBkS",map);
	}

	@Override
	public List<Notification> selectNotiList(SqlSessionTemplate session, String id) {
		// TODO Auto-generated method stub
		return session.selectList("noti.selectNotiList",id);
	}

	@Override
	public List<BookmarkAll> selectNotiWriting(SqlSessionTemplate session, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectList("noti.selectNotiW",map);
	}

	@Override
	public List<BookmarkAll> selectNotiTask(SqlSessionTemplate session,Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectList("noti.selectNotiT",map);
	}

	@Override
	public List<BookmarkAll> selectNotiSchedule(SqlSessionTemplate session,Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectList("noti.selectNotiS",map);
	}

}
