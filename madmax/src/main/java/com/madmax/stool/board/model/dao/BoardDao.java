package com.madmax.stool.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.board.model.vo.Board;

public interface BoardDao {

	List<Board> selectBoard(SqlSessionTemplate session, int cPage, int numPerPage);
	int selectBoardCount(SqlSessionTemplate session);
	int insertBoard(SqlSessionTemplate session, Board b);
	Board selectBoard(SqlSessionTemplate session, int no);
	Board selectFile(SqlSessionTemplate session, int no);
	int deleteBoard(SqlSessionTemplate session, int no);
	int updateBoard(SqlSessionTemplate session, Board b);
	int noFileUpdate(SqlSessionTemplate session, Board b);
	
}
