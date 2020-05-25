package com.madmax.stool.project.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.madmax.stool.project.model.dao.BookmarkDao;
import com.madmax.stool.project.model.vo.Bookmark;
import com.madmax.stool.project.model.vo.BookmarkAll;
import com.madmax.stool.project.model.vo.Notification;
import com.madmax.stool.project.model.vo.Project;
import com.madmax.stool.project.model.vo.ProjectBoard;

@Service
public class BookmarkServiceImpl implements BookmarkService {

	@Autowired
	private BookmarkDao dao;
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private Logger logger;
	
	@Override
	public List<BookmarkAll> selectBkList(String id) {
		// TODO Auto-generated method stub
		List<Bookmark> bk=dao.selectBkList(session,id);
		logger.debug("북마크 갯수:"+bk.size());
		List<BookmarkAll> list=new ArrayList<BookmarkAll>();//전체 리스트
		List<BookmarkAll> bkList=new ArrayList<BookmarkAll>();//for문안에서 사용할거
		
		Map<String,Object> map=new HashMap();
		for(Bookmark b:bk) {
			//글일때
			if(b.getBoardType().equals("W")) {
				map.put("userId", id);
				map.put("boardNo", b.getBoardNo());
				
				bkList=dao.selectBoardWriting(session,map);
				logger.debug("글 갯수:"+bkList.size());
				if(bkList.size()>0) {
					list.addAll(bkList);
					
				}
				//list 로 넘기면?
				}else if(b.getBoardType().equals("T")) {
					map.put("userId", id);
					map.put("boardNo", b.getBoardNo());
					bkList=dao.selectBoardTask(session,map);
					logger.debug("업무갯수:"+bkList.size());
					if(bkList.size()>0) {
						list.addAll(bkList);
						
					}
				
				}else if(b.getBoardType().equals("S")) {
					map.put("userId", id);
					map.put("boardNo", b.getBoardNo());
					bkList=dao.selectBoardSchedule(session,map);
					logger.debug("일정갯수:"+bkList.size());
					if(bkList.size()>0) {
						list.addAll(bkList);
						
					}
				}
		}
		logger.debug("총 갯수 serviceimpl:"+list.size());
		return list;
		
		
	}

	@Override
	public List<BookmarkAll> selectNotiList(String id) {
		// TODO Auto-generated method stub
		List<BookmarkAll> list=new ArrayList<BookmarkAll>();//전체 리스트
		List<BookmarkAll> notiList=new ArrayList<BookmarkAll>();//for문안에서 사용할거
		Map<String,Object> map=new HashMap<String,Object>();
		//우선 
		List<Notification> noList=dao.selectNotiList(session,id);
		for(Notification n:noList) {
				if(n.getNotType().equals("writing")) {
					map.put("userId", id);
					map.put("boardNo", n.getBoardNo());
					notiList=dao.selectNotiWriting(session,map);
					if(notiList.size()>0) {
						list.addAll(notiList);
					}
				}else if(n.getNotType().equals("task")){
					map.put("userId", id);
					map.put("boardNo", n.getBoardNo());
					notiList=dao.selectNotiTask(session,map);
					
					if(notiList.size()>0) {
						list.addAll(notiList);
					}
				}else if(n.getNotType().equals("schedule")) {
					map.put("userId", id);
					map.put("boardNo", n.getBoardNo());
					notiList=dao.selectNotiSchedule(session,map);
					if(notiList.size()>0) {
						list.addAll(notiList);
					}
				}
			
		
			}
		
		
		return list;
	}

	@Override
	public List<BookmarkAll> selectMyBoardList(String id) {
		// TODO Auto-generated method stub
		List<BookmarkAll> list=new ArrayList<BookmarkAll>();//전체 리스트
		List<BookmarkAll> boardW=dao.selectBoardW(session,id);
		List<BookmarkAll> boardT=dao.selectBoardT(session,id);
		List<BookmarkAll> boardS=dao.selectBoardS(session,id);
		
		list.addAll(boardW);
		list.addAll(boardT);
		list.addAll(boardS);
			
		
		
		return list;
	}

	@Override
	public List<ProjectBoard> selectPbList() {
		// TODO Auto-generated method stub
		return dao.selectPbList(session);
	}

}
