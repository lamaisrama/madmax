package com.madmax.stool.board.model.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.madmax.stool.board.model.dao.BoardDao;
import com.madmax.stool.board.model.vo.Board;
import com.madmax.stool.common.MyException;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	Logger logger;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private BoardDao dao;
	
	
	@Override
	public List<Board> selectBoard(int cPage, int numPerpage) {
		
		return dao.selectBoard(session,cPage,numPerpage);
	}

	@Override
	public int selectBoardCount() {
		
		return dao.selectBoardCount(session);
	}

	@Override
	public int insertBoard(Board b, File f) throws MyException{
		
		int result = dao.insertBoard(session, b);

		logger.debug(""+b.getBoardNo());

		
		if(result==0) {
			throw new MyException("InsertBoardError!");
		}
		return result;
	}

	@Override
	@Transactional
	public Board selectBoard(Map<String, Object> map) throws MyException{
		
		Board b = dao.selectBoard(session,(int)map.get("no"));
		
		boolean hasRead = (boolean)map.get("hasRead");
		
		if(!hasRead && b!=null) { //아직 안읽었고board 가있을
			
			int result = dao.updateReadCount(session,(int)map.get("no"));//조회수를 올려
			
			if(result>0) {
			
				b.setBoardReadCount(dao.selectBoard(session,(int)map.get("no")).getBoardReadCount());	//boar객체의조회수값설정
				
			}else {
				throw new MyException("BoardError!");
			}
		}
		
		return b;
	}

	@Override
	public Board selectFile(int no) {
	
		return dao.selectFile(session,no);
	}

	@Override
	public int boardDelete(int no) {
		
		return dao.deleteBoard(session, no);
	}

	@Override
	public int boardUpdate(Board b) {
		
		return dao.updateBoard(session, b);
	}

	@Override
	public int noFileUpdate(Board b) {
		
		return dao.noFileUpdate(session, b);
	}

	@Override
	public Board selectBoardM(int no) {
		
		return dao.selectBoardM(session, no);
	}




}
