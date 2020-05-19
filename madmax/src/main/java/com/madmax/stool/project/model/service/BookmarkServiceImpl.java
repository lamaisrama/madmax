package com.madmax.stool.project.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.madmax.stool.project.model.dao.BookmarkDao;
import com.madmax.stool.project.model.vo.Bookmark;
import com.madmax.stool.project.model.vo.BookmarkAll;

@Service
public class BookmarkServiceImpl implements BookmarkService {

	@Autowired
	private BookmarkDao dao;

	private SqlSessionTemplate session;
	
	
	@Override
	public List<BookmarkAll> selectBkList(String id) {
		// TODO Auto-generated method stub
		List<Bookmark> bk=dao.selectBkList(session,id);
		List<BookmarkAll> list=new ArrayList<BookmarkAll>();//전체 리스트
		List<BookmarkAll> bkList=new ArrayList<BookmarkAll>();//for문안에서 사용할거
		for(Bookmark b:bk) {
			//글일때
			if(b.getBoardType().equals("W")) {
				bkList=dao.selectBoardWriting(session,id);
				if(list.size()>0) {
					list.addAll(bkList);
				}
				//list 로 넘기면?
				}else if(b.getBoardType().equals("T")) {
					bkList=dao.selectBoardTask(session,id);
					if(list.size()>0) {
						list.addAll(bkList);
					}
				
				}else if(b.getBoardType().equals("S")) {
					bkList=dao.selectBoardSchedule(session,id);
					if(list.size()>0) {
						list.addAll(bkList);
					}
				}
		}
		
		return list;
		
		
	}

}
