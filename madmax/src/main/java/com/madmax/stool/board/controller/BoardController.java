package com.madmax.stool.board.controller;

import static com.madmax.stool.common.RenameFactory.getRenamedFileName;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.madmax.stool.board.model.service.BoardService;
import com.madmax.stool.board.model.vo.Board;
import com.madmax.stool.common.PagingFactory;

@Controller
public class BoardController {

	@Autowired
	private Logger logger;
	
	@Autowired
	private BoardService service;
	
	
//	@RequestMapping("/board/boardList")
//	public String boardList() {
//		return "board/boardList";
//	}
	
	@RequestMapping("/board/boardList.do")
	public ModelAndView boardList(ModelAndView mv, @RequestParam(required = false, defaultValue="1") int cPage, 
									@RequestParam(required = false, defaultValue="8") int numPerpage) {
		
		List<Board> list = service.selectBoard(cPage, numPerpage);
		int totalData = service.selectBoardCount();
		
		logger.debug("게시물 조회결과 : "+list);
		
		mv.addObject("list", list);
		mv.addObject("total", totalData);
		mv.addObject("pageBar", PagingFactory.getPage(totalData, cPage, numPerpage, "/stool/board/boardList.do"));
		mv.setViewName("board/boardList");
		
		return mv;
	}
	
	@RequestMapping("/board/boardWrite")
	public String boardWrite() {
		return "board/boardWrite";
	}
	
	@RequestMapping("/board/boardWriteEnd.do")
	public ModelAndView insertBoard(ModelAndView mv, Board b, MultipartFile upFile, HttpSession session) {
		
		logger.debug("게시글 : "+b);
		logger.debug("파일명 : "+upFile.getOriginalFilename());
		logger.debug("파일크기 : "+upFile.getSize());
		
		// 파일저장경로
		String path = session.getServletContext().getRealPath("/resources/upload/board");
		// 파일 저장 객체 생성
		File f = new File(path);
		// 폴더 생성
		if(!f.exists()) f.mkdirs();
		
		if(!upFile.isEmpty()) {
			// 파일명 생성
			String ori = upFile.getOriginalFilename();
			String ext = ori.substring(ori.lastIndexOf("."));
			// 파일 리네임
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rnd = (int)(Math.random()*1000);
			String rename = sdf.format(System.currentTimeMillis()) + "_" + rnd + ext;
			// 리네임으로 저장
			try{
				upFile.transferTo(new File(path + "/" + rename)); // 실제 파일 저장 메소드
			}catch(IOException e) {
				e.printStackTrace();
			}
			b.setBoardOriginalFilename(ori);
			b.setBoardRenamedFilename(rename);
			
		}
		int result = 0;
		try {
			result = service.insertBoard(b, f);
		}catch(RuntimeException e) {
			File delF = new File(path+"/"+b.getBoardRenamedFilename());
			if(delF.exists()) delF.delete();
		}
		mv.setViewName("redirect:/board/boardList.do");
		return mv;
	}
	
	@RequestMapping("/board/boardView.do")
	public ModelAndView boardView(ModelAndView mv, int no, HttpServletRequest req, HttpServletResponse res) {

		mv.addObject("board",service.selectBoard(no));
		
		mv.addObject("file",service.selectFile(no));
		
		mv.setViewName("board/boardView");
		
		return mv;
	}
	
	@RequestMapping("/board/fileDownload")
	public void fileDownload(String ori,String rename, HttpSession session,
			@RequestHeader(value="user-agent") String header,
			ServletOutputStream out, HttpServletResponse res) {
		
		//파일경로
		String path=session.getServletContext().getRealPath("/resources/upload/board");
		
		BufferedInputStream bis=null;
		
		File f=new File(path+"/"+rename);
		
		//파일과 연결된 스트림, 보낼 대상의 스트림
		try {
			FileInputStream fis=new FileInputStream(f);
			bis=new BufferedInputStream(fis);
			//분기처리
			boolean isMSIE=header.indexOf("MSIE")!=-1||
					header.indexOf("Trident")!=-1;
			String oriName="";
			if(isMSIE) {
				oriName=URLEncoder.encode(ori,"UTF-8");
				oriName=oriName.replaceAll("\\+", "%20");
			}else {
				oriName=new String(ori.getBytes("UTF-8"),"ISO-8859-1");
			}
			//응답설정세팅
			res.setContentType("application/otect-stream;charset=UTF-8");
			res.addHeader("Content-Disposition","board;filename=\""+oriName+"\"");
			
			int read=-1;
			while((read=bis.read())!=-1) {
				out.write(read);
			}	
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			try {
				bis.close();
				out.close();
			}catch(IOException e){
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping("/board/boardDelete.do")
	public ModelAndView boardDelete(@RequestParam("no") int no, ModelAndView mv, Model m) {
		
		int result = service.boardDelete(no);
//		result = 0;
//		logger.debug("보드삭제 : "+result);

//		System.out.println("BoardDeleteNo : " + no);
		
		mv.setViewName("redirect:/board/boardList.do");
		
		if(result==0) {
		      m.addAttribute("msg", "삭제 실패!");
		      m.addAttribute("loc", "/board/boardView.do?no="+no);
		      
		   }else {
		      m.addAttribute("msg", "삭제 성공!");
		      m.addAttribute("loc", "/board/boardList.do");
		   }
		   mv.setViewName("common/msg");
		   return mv;
	}
	
	
	@RequestMapping("/board/boardModify")
	public ModelAndView boardUpdate(int no) {
		
		ModelAndView mv = new ModelAndView();
		Board b = service.selectBoard(no);
		mv.addObject("board", b);
		mv.setViewName("board/boardUpdate");
		
		return mv;
	}
	@RequestMapping("/board/boardModify.do")
	public ModelAndView boardUpdate(Board b, HttpServletRequest req, ModelAndView mv, MultipartFile upFile, HttpSession session) {
		
		// 파일저장경로
		String path = session.getServletContext().getRealPath("/resources/upload/board");
		// 파일 저장 객체 생성
		File f = new File(path);
		// 폴더 생성
		if(!f.exists()) f.mkdirs();
		
		if(!upFile.isEmpty()) {
			// 파일명 생성
			String ori = upFile.getOriginalFilename();
			String ext = ori.substring(ori.lastIndexOf("."));
			// 파일 리네임
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rnd = (int)(Math.random()*1000);
			String rename = sdf.format(System.currentTimeMillis()) + "_" + rnd + ext;
			// 리네임으로 저장
			try{
				upFile.transferTo(new File(path + "/" + rename)); // 실제 파일 저장 메소드
			}catch(IOException e) {
				e.printStackTrace();
			}
			b.setBoardOriginalFilename(ori);
			b.setBoardRenamedFilename(rename);
		}
		int result = 0;
		try {
			result = service.boardUpdate(b);
		}catch(RuntimeException e) {
			File delF = new File(path+"/"+b.getBoardRenamedFilename());
			if(delF.exists()) delF.delete();
		}
		if(result>0) {
			mv.addObject("no", b.getBoardNo()).addObject("msg", "공지사항 수정 성공!");
		}else {
			mv.addObject("msg", "수정실패!");
		}
		mv.setViewName("redirect:/board/boardList.do");
		return mv;
		
//		int result = service.boardUpdate(b);
//		if(result>0) {
//			mv.addObject("no", b.getBoardNo()).addObject("msg", "공지사항 수정 성공!");
//		}else {
//			mv.addObject("msg", "수정실패!");
//		}
//		mv.setViewName("redirect:/board/boardList.do");
//		
//		System.out.println("BoardUpdateComplete : " + b);
//		
//		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
