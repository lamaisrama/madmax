package com.madmax.stool.project.model.service;

import java.util.List;

import com.madmax.stool.project.model.vo.BookmarkAll;
import com.madmax.stool.project.model.vo.ProjectBoard;

public interface BookmarkService {

	List<BookmarkAll> selectBkList(String id);

	List<BookmarkAll> selectNotiList(String id);

	List<BookmarkAll> selectMyBoardList(String id);

	List<ProjectBoard> selectPbList();

}
