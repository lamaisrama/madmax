package com.madmax.stool.project.model.service;

import java.util.List;

import com.madmax.stool.project.model.vo.BookmarkAll;

public interface BookmarkService {

	List<BookmarkAll> selectBkList(String id);

}
