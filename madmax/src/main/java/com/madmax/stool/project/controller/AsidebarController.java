package com.madmax.stool.project.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.madmax.stool.project.model.service.AsidebarService;
import com.madmax.stool.project.model.vo.AllAttachment;



public class AsidebarController {
	
	@Autowired
	private Logger logger;
	
	@Autowired
	private AsidebarService service;
	
	
	//오른쪽 사이드바 프로젝트 전체 멤버 리스트 + 프로젝트 참여 인원수 보여주기
	@RequestMapping
	public ModelAndView MemberCount(ModelAndView mv,int pjNo) {
		
		//프로젝트 참여자 수 
		int memberCount=service.selectMemberCount(pjNo);
		
		mv.addObject("memberCount",memberCount);
		mv.setViewName("selectedProject/asidebar");
		System.out.println("멤버수:"+memberCount);
		return mv; 
	
	}

	//한 프로젝트에서 업로드된 모든 파일 불러오기
	
//	@RequestMapping
//	public ModelAndView selectFileList(int pjNo,ModelAndView mv) {
//		
//		List<AllAttachment> attachments=service.selectAllProjectFiles(pjNo);
//
//		mv.addObject("attchments",attachments);
//		
//		mv.setViewName("selectedProject/asidebar");
//		logger.debug(""+attachments);
//		return mv;
//	}
	
	//파일함에서 파일 다운로드
//	@RequestMapping("/selectedProject/fileDownload.do")
//	public void fileDownload(int pjNo,String ori,String rename,
//			HttpSession session,
//			@RequestHeader(value="user-agent") String header,
//			ServletOutputStream out, HttpServletResponse res) {
//		
//		//파일경로
//		String path=session.getServletContext().getRealPath("/resources/upload/selectedProject1");
//		BufferedInputStream bis=null;
//		File f=new File(path+"/"+rename);
//		//파일과 연결된 스트림, 보낼 대상의 스트림 : servletoutputstream out
//		//클라이언트 브라우저에 따른 분기처리 originalFilename 보낼 때
//		try {
//			FileInputStream fis=new FileInputStream(f);
//			bis=new BufferedInputStream(new FileInputStream(f));
//			//분기처리
//			
//			boolean isMSIE=header.indexOf("MSIE")!=-1||
//					header.indexOf("Trigent")!=-1;
//			String oriName="";
//			if(isMSIE) {
//				oriName=URLEncoder.encode(ori,"UTF-8");
//				oriName=oriName.replace("\\+", "%20");
//			}else {
//				oriName=new String(ori.getBytes("UTF-8"),"ISO-8859-1");
//				
//			}
//			//응답 설정 세팅 (response 필요)
//			res.setContentType("application/otect-stream;charset=UTF-8");
//			res.addHeader("Content-Disposition","attachment;filename=\""+oriName+"\"");
//			int read=-1;
//			while((read=bis.read())!=-1) {
//				out.write(read);
//			}
//		
//		}catch(IOException e) {
//			e.printStackTrace();
//		}finally {
//			try {
//				bis.close();
//			}catch(IOException e){
//				e.printStackTrace();
//			}
//		}
//	}

	
}
