package com.madmax.stool.project.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.madmax.stool.project.model.service.SelectedProjectInsertService;
import com.madmax.stool.project.model.vo.Attachment;
import com.madmax.stool.project.model.vo.ProjectMember;

@Controller
public class SelectedProjectInsertController {
	
	@Autowired
	private SelectedProjectInsertService service;

	@RequestMapping("/selectedProject/selectedProject.do")
	public ModelAndView selectedProject(ModelAndView mv) {
		
//		List<ProjectMember> projectMember = service.selectProjectMemberList(pjNo);
		List<ProjectMember> projectMember = service.selectProjectMemberList(1);
		

		mv.addObject("projectMember", projectMember);
		mv.setViewName("selectedProject/selectedProject");
		
		return mv;
	}
	
	@RequestMapping("/selectedProject/insertSelectedProject.do")
	public ModelAndView insertSelectedProject(@RequestParam Map<String, String> map, ModelAndView mv, MultipartHttpServletRequest mtfRequest, HttpSession session) {
		//1. 파일 받아와서 저장
        List<MultipartFile> fileList = mtfRequest.getFiles("files");
        List<MultipartFile> imgFileList = mtfRequest.getFiles("imgFiles");        
        for(MultipartFile mf : fileList) {
        	System.out.println("파일명 : "+mf.getOriginalFilename());
        }
        for(MultipartFile mf : imgFileList) {
        	System.out.println("이미지파일명 : "+mf.getOriginalFilename());
        }

		//파일 저장경로 가져오기
		String pjNo = map.get("selectedProjectNo");
		String path = session.getServletContext().getRealPath("/resources/upload/selectedProject"+pjNo);
		
		/* 파일을 저장할 객체 생성! */
		List<Attachment> files=new ArrayList();
		List<Attachment> imgFiles=new ArrayList();
		
		File f = new File(path); //폴더
		if(!f.exists()) f.mkdirs(); //폴더가 없으면 만든다
		//파일 저장 로직 구현
		//⑴FileAttachment - 파일리네임 구성하기
		for(MultipartFile mf : fileList) {
			if(!mf.isEmpty()) { //파일이 있을때만 실행
				String ori = mf.getOriginalFilename();
				String ext = ori.substring(ori.lastIndexOf("."));
				//파일 리네임		
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rnd = (int)(Math.random()*1000);
				String rename = "file#"+sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
				
			//리네임 된 이름으로 파일 저장하기
				try {
					mf.transferTo(new File(path+"/"+rename)); //☆★☆ transferTo : 저장하는 메소드
				}catch(IOException e) {
					e.printStackTrace();
				}
				Attachment fa = new Attachment();
				fa.setOriginalFilename(ori);
				fa.setRenamedFilename(rename);
				files.add(fa);
			}
		}
		//⑵ImgFileAttachment - 파일리네임 구성하기
		for(MultipartFile mf : imgFileList) {
			if(!mf.isEmpty()) { //파일이 있을때만 실행
				String ori = mf.getOriginalFilename();
				String ext = ori.substring(ori.lastIndexOf("."));
				//파일 리네임		
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rnd = (int)(Math.random()*1000);
				String rename = "img#"+sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
				
			//리네임 된 이름으로 파일 저장하기
				try {
					mf.transferTo(new File(path+"/"+rename)); //☆★☆ transferTo : 저장하는 메소드
				}catch(IOException e) {
					e.printStackTrace();
				}
				Attachment ifa = new Attachment();
				ifa.setOriginalFilename(ori);
				ifa.setRenamedFilename(rename);
				imgFiles.add(ifa);
			}
		}
        
        //2. 글 타입에 따라 각자 테이블에 insert하기
        //※ 이때 파일이 있으면 타입별 파일테이블에도 같이 insert
        if(map.get("boardType").equals("writing")) {
        	//1) 글 작성
        	
        } else if(map.get("boardType").equals("task")) {
        	System.out.println("$$$$$$$task$$$$$$$$$$");
        } else if(map.get("boardType").equals("schedule")) {
        	System.out.println("$$$$$$$schedule$$$$$$$$$$");
        }
		
		
		System.out.println("주소 : "+path);
				
        // 방법 01 : entrySet()
        for (Map.Entry<String, String> entry : map.entrySet()) {
            System.out.println("[key]:" + entry.getKey() + ", [value]:" + entry.getValue());
        }
//        System.out.println(upFile[0].getOriginalFilename());
        
		mv.setViewName("selectedProject/selectedProject");
		
		return mv;
	}
	
}
