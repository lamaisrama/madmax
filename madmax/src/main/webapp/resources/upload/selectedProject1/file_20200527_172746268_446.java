package com.kh.spring.board.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.spring.board.model.dao.BoardDao;
import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.board.model.vo.Board;
import com.kh.spring.common.MyException;
@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	Logger logger;
	@Autowired
	private BoardDao dao;
	@Autowired
	private SqlSessionTemplate session;	
	
	@Override
	public List<Board> selectBoard(int cPage, int numPerpage) {
		return dao.selectBoard(session,cPage,numPerpage);
	}

	@Override
	public int selectBoardCount() {
		// TODO Auto-generated method stub
		return dao.selectBoardCount(session);
	}

	@Override
	//@Transactional//트랜젝션처리!
	public int insertBoard(Board b, List<Attachment> files) throws MyException {
		//board입력 -> insert문 실행
		//attachment 테이블에 insert문 실행
		int result=dao.insertBoard(session,b);
		logger.debug(""+b.getBoardNo());
		//입력값이 없을 경우 처리하기
		if(result==0) {
			throw new MyException("board삽입에러!");
		}
		
		if(!files.isEmpty()) {
			for(Attachment a : files) {
				a.setBoardNo(b.getBoardNo());
				result=dao.insertAttachment(session,a);
				if(result==0) {
					throw new MyException("attachment삽입에러!");
				}
			}
		}		
		
		return result;
	}

	@Override
	public Board selectBoard(int no) {
		// TODO Auto-generated method stub
		return dao.selectBoard(session, no);
	}

	@Override
	public List<Attachment> selectFiles(int no) {
		// TODO Auto-generated method stub
		return dao.selectFiles(session,no);
	}
	
	
	
}
