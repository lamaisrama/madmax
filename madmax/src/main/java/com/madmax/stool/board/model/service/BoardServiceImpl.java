package com.madmax.stool.board.model.service;

import java.io.File;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public Board selectBoard(int no) {
		
		return dao.selectBoard(session, no);
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




}
