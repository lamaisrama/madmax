package com.madmax.stool.project.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SelectedProjectWriteController {

	@RequestMapping("/selectedProject/selectedProject.do")
	public String selectedProject() {
		//나중에 pjNo넣어서 수정
		return "selectedProject/selectedProject";
	}
	
	@RequestMapping("/selectedProject/insertSelectedProject.do")
	public ModelAndView insertSelectedProject(@RequestParam Map<String, String> map, ModelAndView mv, MultipartHttpServletRequest mtfRequest, HttpSession session) {
		//파일 받기
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
