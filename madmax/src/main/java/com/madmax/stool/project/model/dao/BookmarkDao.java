package com.madmax.stool.project.model.dao;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.project.model.vo.Bookmark;
import com.madmax.stool.project.model.vo.BookmarkAll;
import com.madmax.stool.project.model.vo.Notification;
import com.madmax.stool.project.model.vo.Project;
import com.madmax.stool.project.model.vo.ProjectBoard;

public interface BookmarkDao {

	List<Bookmark> selectBkList(SqlSessionTemplate session, String id);

	List<BookmarkAll> selectBoardWriting(SqlSessionTemplate session,Map<String, Object> map);

	List<BookmarkAll> selectBoardTask(SqlSessionTemplate session, Map<String, Object> map);

	List<BookmarkAll> selectBoardSchedule(SqlSessionTemplate session, Map<String, Object> map);

	List<Notification> selectNotiList(SqlSessionTemplate session, String id);

	List<BookmarkAll> selectNotiWriting(SqlSessionTemplate session, Map<String, Object> map);

	List<BookmarkAll> selectNotiTask(SqlSessionTemplate session,Map<String, Object> map);

	List<BookmarkAll>  selectNotiSchedule(SqlSessionTemplate session,Map<String, Object> map);

	

	List<BookmarkAll> selectBoardW(SqlSessionTemplate session, String id);

	List<BookmarkAll> selectBoardT(SqlSessionTemplate session, String id);

	List<BookmarkAll> selectBoardS(SqlSessionTemplate session, String id);

	List<ProjectBoard> selectPbList(SqlSessionTemplate session);

	

}
