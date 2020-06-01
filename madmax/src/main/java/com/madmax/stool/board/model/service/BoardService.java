package com.madmax.stool.board.model.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import com.madmax.stool.board.model.vo.Board;

public interface BoardService {

	List<Board> selectBoard(int cPage,int numPerpage);
	int selectBoardCount();
	int insertBoard(Board b, File f);
	Board selectBoard(Map<String, Object> map);
	Board selectFile(int no);
	int boardDelete(int no);
	int boardUpdate(Board b);
	int noFileUpdate(Board b);
	Board selectBoardM(int no);
	

	
}
