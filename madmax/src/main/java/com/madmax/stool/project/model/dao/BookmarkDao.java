package com.madmax.stool.project.model.dao;

import java.util.Collection;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.project.model.vo.Bookmark;
import com.madmax.stool.project.model.vo.BookmarkAll;

public interface BookmarkDao {

	List<Bookmark> selectBkList(SqlSessionTemplate session, String id);

	List<BookmarkAll> selectBoardWriting(SqlSessionTemplate session,String id);

	List<BookmarkAll> selectBoardTask(SqlSessionTemplate session, String id);

	List<BookmarkAll> selectBoardSchedule(SqlSessionTemplate session, String id);

	

}
