package com.madmax.stool.project.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.project.model.vo.Bookmark;
import com.madmax.stool.project.model.vo.BookmarkAll;
import com.madmax.stool.project.model.vo.Notification;
import com.madmax.stool.project.model.vo.Project;
import com.madmax.stool.project.model.vo.ProjectBoard;

@Repository
public class BookmarkDaoImpl implements BookmarkDao {

	//***********여기서 부터 북마크한 글
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
	//***********여기서 부터 내가 언급된 글
	
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

	
	//***********여기서 부터 내가 쓴글


	@Override
	public List<BookmarkAll> selectBoardW(SqlSessionTemplate session, String id) {
		// TODO Auto-generated method stub
		return session.selectList("myBoard.selectBW",id);
	}

	@Override
	public List<BookmarkAll> selectBoardT(SqlSessionTemplate session, String id) {
		// TODO Auto-generated method stub
		return session.selectList("myBoard.selectBT",id);
	}

	@Override
	public List<BookmarkAll> selectBoardS(SqlSessionTemplate session, String id) {
		// TODO Auto-generated method stub
		return session.selectList("myBoard.selectBS",id);
	}

	//북마크 정렬용
	@Override
	public List<ProjectBoard> selectPbList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("bookmark.selectPb");
	}

}
