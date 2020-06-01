package com.madmax.stool.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.board.model.vo.Board;

@Repository
public class BoardDaoimpl implements BoardDao {

	@Override
	public List<Board> selectBoard(SqlSessionTemplate session, int cPage, int numPerPage) {
		return session.selectList("board.selectBoard",null,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public int selectBoardCount(SqlSessionTemplate session) {
		
		return session.selectOne("board.selectBoardCount");
	}

	@Override
	public int insertBoard(SqlSessionTemplate session, Board b) {
	
		return session.insert("board.insertBoard", b);
	}
	
	@Override
	public Board selectBoard(SqlSessionTemplate session, Map<String, Object> map) {
		
		return session.selectOne("board.selectView", map);
	}

	@Override
	public Board selectFile(SqlSessionTemplate session, int no) {
		
		return session.selectOne("board.selectFile",no);
	}

	@Override
	public int deleteBoard(SqlSessionTemplate session, int no) {
		
		return session.delete("board.deleteBoard", no);
	}

	@Override
	public int updateBoard(SqlSessionTemplate session, Board b) {
		
		return session.update("board.updateBoard", b);
	}

	@Override
	public int noFileUpdate(SqlSessionTemplate session, Board b) {
		
		return session.update("board.noFileUpdate", b);
	}

	@Override
	public Board selectBoard(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.selectOne("board.selectReadBoard", no);
	}

	@Override
	public int updateReadCount(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.update("board.updateReadCount", no);
	}

	@Override
	public Board selectBoardM(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.selectOne("board.selectView", no);
	}
	
	
	
}
