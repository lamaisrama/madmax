package com.madmax.stool.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.board.model.vo.Board;

public interface BoardDao {

	List<Board> selectBoard(SqlSessionTemplate session, int cPage, int numPerPage);
	int selectBoardCount(SqlSessionTemplate session);
	int insertBoard(SqlSessionTemplate session, Board b);
	Board selectBoard(SqlSessionTemplate session, Map<String, Object> map);
	Board selectFile(SqlSessionTemplate session, int no);
	int deleteBoard(SqlSessionTemplate session, int no);
	int updateBoard(SqlSessionTemplate session, Board b);
	int noFileUpdate(SqlSessionTemplate session, Board b);
	Board selectBoard(SqlSessionTemplate session,int no);
	int updateReadCount(SqlSessionTemplate session,int no);
	Board selectBoardM(SqlSessionTemplate session, int no);
	
}
