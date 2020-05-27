package com.madmax.stool.project.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.madmax.stool.project.model.service.SelectedProjectUpdateService;


@Controller
public class SelectedProjectUpdateController {

	@Autowired
	private Logger logger;
	
	@Autowired
	private SelectedProjectUpdateService service;
	
	@RequestMapping("/selectedProject/deleteFavorite.do")
	@ResponseBody
	public int deleteFavorite(@RequestParam Map<String, String> map) {		
		//값 받기
		int flag = Integer.parseInt(map.get("flag"));
		int pjNo = Integer.parseInt(map.get("pjNo"));
		String loginId = map.get("loginId");
		
		Map<String, Object> pjInfo = new HashMap();
		pjInfo.put("pjNo",pjNo);
		pjInfo.put("loginId",loginId);
		
		int result = 0;
		if(flag > 0) {
			result = service.deleteFavorite(pjInfo);
		}
		
		return result;
	}
	
	@RequestMapping("/selectedProject/insertFavorite.do")
	@ResponseBody
	public int insertFavorite(@RequestParam Map<String, String> map) {		
		//값 받기
		int flag = Integer.parseInt(map.get("flag"));
		int pjNo = Integer.parseInt(map.get("pjNo"));
		String loginId = map.get("loginId");
		
		Map<String, Object> pjInfo = new HashMap();
		pjInfo.put("pjNo",pjNo);
		pjInfo.put("loginId",loginId);
		
		int result = 0;
		if(flag == 0) {
			result = service.insertFavorite(pjInfo);
		}
		
		return result;
	}
	
	@RequestMapping("/selectedProject/updateProjectColor.do")
	@ResponseBody
	public int updateProjectColor(@RequestParam Map<String, String> map) {		
		//값 받기
		int pjNo = Integer.parseInt(map.get("pjNo"));
		String color = map.get("color");
		
		Map<String, Object> pjInfo = new HashMap();
		pjInfo.put("pjNo",pjNo);
		pjInfo.put("color",color);
		
		int result = 0;
		result = service.updateProjectColor(pjInfo);
		
		return result;
	}
	
	@RequestMapping("/selectedProject/deleteProjectMember.do")
	@ResponseBody
	public int deleteProjectMember(@RequestParam Map<String, String> map) {
		//값 받기
		int pjNo = Integer.parseInt(map.get("pjNo"));
		String loginId = map.get("loginId");
		
		Map<String, Object> pjInfo = new HashMap();
		pjInfo.put("pjNo",pjNo);
		pjInfo.put("loginId",loginId);
		
		int result = service.deleteProjectMember(pjInfo);

		return result;
	}
	
	@RequestMapping("/selectedProject/updateProjectManager.do")
	@ResponseBody
	public int updateProjectManager(@RequestParam Map<String, String> map) {
		//값 받기
		int pjNo = Integer.parseInt(map.get("pjNo"));
		String loginId = map.get("loginId");
		String newManagerId = map.get("newManagerId");
		
		Map<String, Object> pjInfo = new HashMap();
		pjInfo.put("pjNo",pjNo);
		pjInfo.put("loginId",loginId);
		pjInfo.put("newManagerId",newManagerId);
		
		int result = 0;
		try {
			result = service.updateProjectManager(pjInfo);
		}catch(RuntimeException e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping("/selectedProject/updateSelectedProject.do")
	@ResponseBody
	public int updateSelectedProject(@RequestParam Map<String, String> map) {
		//값 받기
		int pjNo = Integer.parseInt(map.get("pjNo"));
		String title = map.get("projectTitle");
		String projectState = map.get("projectState")==null?"P":"E";
		
		Map<String, Object> upMap = new HashMap();
		upMap.put("title",title);
		upMap.put("projectState",projectState);
		upMap.put("pjNo",pjNo);
		
		int result = 0;
		try {
			result = service.updateSelectedProject(upMap);
		}catch(RuntimeException e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping("/selectedProject/insertBookmark.do")
	@ResponseBody
	public int insertBookmark(@RequestParam Map<String, String> map) {
		//값 받기
		int bNo = Integer.parseInt(map.get("bNo"));
		String loginId = map.get("loginId");
		
		Map<String, Object> bInfo = new HashMap();
		bInfo.put("bNo",bNo);
		bInfo.put("loginId",loginId);
		
		int result = 0;
		try {
			result = service.insertBookmark(bInfo);
		}catch(RuntimeException e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping("/selectedProject/deleteBookmark.do")
	@ResponseBody
	public int deleteBookmark(@RequestParam Map<String, String> map) {
		//값 받기
		int bNo = Integer.parseInt(map.get("bNo"));
		String loginId = map.get("loginId");
		
		Map<String, Object> bInfo = new HashMap();
		bInfo.put("bNo",bNo);
		bInfo.put("loginId",loginId);
		
		int result = 0;
		try {
			result = service.deleteBookmark(bInfo);
		}catch(RuntimeException e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping("/selectedProject/updatePinPost.do")
	@ResponseBody
	public int updatePinPost(@RequestParam Map<String, String> map) {
		//값 받기
		String check = map.get("check");
		int pjNo = Integer.parseInt(map.get("pjNo"));
		int bNo = Integer.parseInt(map.get("bNo"));
		
		Map<String, Object> pjInfo = new HashMap();
		pjInfo.put("check",check);
		pjInfo.put("pjNo",pjNo);
		pjInfo.put("bNo",bNo);
		
		int result = 0;
		try {
			result = service.updatePinPost(pjInfo);
		}catch(RuntimeException e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping("/selectedProject/insertComment.do")
	@ResponseBody
	public int insertComment(@RequestParam Map<String, String> map) {
		//값 받기
		String postType = map.get("postType");
		String receiveId = map.get("receiveId");
		String senderId = map.get("senderId");
		String comment = map.get("comment");
		int boardNo = Integer.parseInt(map.get("boardNo"));
		int postNo = Integer.parseInt(map.get("postNo"));
		String commentType = "";
		if(postType.equals("W")) {
			commentType = "writingcomment";
		}else if(postType.equals("T")) {
			commentType = "tastcomment";
		}else if(postType.equals("S")) {
			commentType = "schedulecomment";
		}
		
		Map<String, Object> cMap = new HashMap();
		cMap.put("postType",postType);
		cMap.put("receiveId",receiveId);
		cMap.put("senderId",senderId);
		cMap.put("comment",comment);
		cMap.put("boardNo",boardNo);
		cMap.put("postNo",postNo);
		cMap.put("commentType",commentType);
		
		int result = 0;
		try {
			result = service.insertComment(cMap);
		}catch(RuntimeException e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping("/selectedProject/updateComment.do")
	@ResponseBody
	public int updateComment(@RequestParam Map<String, String> map) {
		//값 받기
		String postType = map.get("postType");
		String comment = map.get("comment");
		int commentNo = Integer.parseInt(map.get("commentNo"));
		
		Map<String, Object> cMap = new HashMap();
		cMap.put("postType",postType);
		cMap.put("comment",comment);
		cMap.put("commentNo",commentNo);
		
		int result = 0;
		try {
			result = service.updateComment(cMap);
		}catch(RuntimeException e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping("/selectedProject/deleteComment.do")
	@ResponseBody
	public int deleteComment(@RequestParam Map<String, String> map) {
		//값 받기
		String type = map.get("type");
		int cNo = Integer.parseInt(map.get("cNo"));
		
		Map<String, Object> cMap = new HashMap();
		cMap.put("type",type);
		cMap.put("cNo",cNo);
		
		int result = 0;
		try {
			result = service.deleteComment(cMap);
		}catch(RuntimeException e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	//파일다운로드
	@RequestMapping("/selectedProject/fileDownload.do")
	public void fileDownload(int pjNo, String ori, String rename, HttpSession session, 
			@RequestHeader(value="user-agent") String header, ServletOutputStream out,
			HttpServletResponse res) {

		//파일경로
		String path = session.getServletContext().getRealPath("/resources/upload/selectedProject"+pjNo);
		BufferedInputStream bis = null;
		File f = new File(path+"/"+rename);
		
		//파일과 연결된 스트림, 보낼 대상의 스트림
		try {
			bis=new BufferedInputStream(new FileInputStream(f));
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
			res.addHeader("Content-Disposition","attachment;filename=\""+oriName+"\"");
			
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
	
	
	
	
	
}
