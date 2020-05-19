package com.madmax.stool.project.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.project.model.vo.Bookmark;
import com.madmax.stool.project.model.vo.BookmarkAll;

@Repository
public class BookmarkDaoImpl implements BookmarkDao {

	@Override
	public List<Bookmark> selectBkList(SqlSessionTemplate session, String id) {
		// TODO Auto-generated method stub
		return session.selectList("bookmark.selectBkList", id);
	}

	@Override
	public List<BookmarkAll> selectBoardWriting(SqlSessionTemplate session, String id) {
		// TODO Auto-generated method stub
		return session.selectList("bookmark.selectBkW",id);
	}

	@Override
	public List<BookmarkAll> selectBoardTask(SqlSessionTemplate session, String id) {
		// TODO Auto-generated method stub
		return session.selectList("bookmark.selectBkT",id);
	}

	@Override
	public List<BookmarkAll> selectBoardSchedule(SqlSessionTemplate session,String id) {
		// TODO Auto-generated method stub
		return session.selectList("bookmark.selectBkS",id);
	}

}
