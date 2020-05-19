package com.madmax.stool.project.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.madmax.stool.project.model.vo.InsertHashTag;
import com.madmax.stool.project.model.vo.InsertNotification;
import com.madmax.stool.project.model.vo.InsertProjectBoard;
import com.madmax.stool.project.model.vo.InsertTask;
import com.madmax.stool.project.model.vo.InsertTaskManager;
import com.madmax.stool.project.model.vo.InsertWriting;
import com.madmax.stool.project.model.vo.ProjectMember;

@Controller
public class SelectedProjectInsertController {
	
	@Autowired
	private SelectedProjectInsertService service;

	@RequestMapping("/selectedProject/selectedProject.do")
	public ModelAndView selectedProject(ModelAndView mv, int pjNo) {
		
		List<ProjectMember> projectMember = service.selectProjectMemberList(pjNo);		

		mv.addObject("pjNo", pjNo);
		mv.addObject("projectMember", projectMember);
		mv.setViewName("selectedProject/selectedProject");
		
		return mv;
	}
	
	@RequestMapping("/selectedProject/insertSelectedProject.do")
	public ModelAndView insertSelectedProject(ModelAndView mv, @RequestParam Map<String, String> map, MultipartHttpServletRequest mtfRequest, HttpSession session) {

		
        // 방법 01 : entrySet()
        for (Map.Entry<String, String> entry : map.entrySet()) {
            System.out.println("[key]:" + entry.getKey() + ", [value]:" + entry.getValue());
        }
        //위쪽은 시도 후 지울거임
		
		//JSP에서 받아온 기본값들
		String writer = map.get("writer"); //작성자
		String boardType = map.get("boardType"); //글 타입
		int pjNo = Integer.parseInt(map.get("selectedProjectNo")); //선택된 프로젝트 번호
		String tag = map.get("tagListStr"); //태그
		String not = map.get("mentionListStr"); //언급
		
		//1. 파일 받아와서 저장
        List<MultipartFile> upFileList = mtfRequest.getFiles("files");
        List<MultipartFile> upImgFileList = mtfRequest.getFiles("imgFiles");        
        for(MultipartFile mf : upFileList) {
        	System.out.println("파일명 : "+mf.getOriginalFilename());
        }
        for(MultipartFile mf : upImgFileList) {
        	System.out.println("이미지파일명 : "+mf.getOriginalFilename());
        }

		//파일 저장경로 가져오기
		String path = session.getServletContext().getRealPath("/resources/upload/selectedProject"+pjNo);
		System.out.println("주소 : "+path); // << 지울거임
		
		/* 파일을 저장할 객체 생성! */
		List<Attachment> files=new ArrayList<Attachment>();
		
		File f = new File(path); //폴더
		if(!f.exists()) f.mkdirs(); //폴더가 없으면 만든다
		//파일 저장 로직 구현
		//⑴FileAttachment - 파일리네임 구성하기
		for(MultipartFile mf : upFileList) {
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
		for(MultipartFile mf : upImgFileList) {
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
				files.add(ifa);
			}
		}

		
		//2. 해시태그and언급 있을 경우 처리 후 저장
		//2-1) 해시태그
		List<InsertHashTag> hashTagList = new ArrayList<InsertHashTag>();
		if(!(tag.trim().equals("") || tag == null)) {
			String[] tagArr = tag.split(",");
			for(String t : tagArr) {
				InsertHashTag hashTag = new InsertHashTag();
				hashTag.setHashtagText(t);
				hashTagList.add(hashTag);
			}
		}
		//2-2) 언급
		List<InsertNotification> notList = new ArrayList<InsertNotification>();
		List<ProjectMember> projectMember = service.selectProjectMemberList(pjNo);	
		if(!(not.trim().equals("") || not == null)) {
			String[]  notArr = not.split(",");
			for(String n : notArr) {	
				for(ProjectMember m : projectMember) {
					if(n.equals(m.getUserName())) n = m.getUserId();
				}
				InsertNotification notification = new InsertNotification();
				notification.setReceiveId(n);
				notification.setSenderId(writer);
				notification.setNotType("writing");
				notList.add(notification);
			}
		}

        //3. 글 타입에 따라 각자 테이블에 insert하기
        //※ 이때 파일이 있으면 타입별 파일테이블에도 같이 insert
		int result=0;
		InsertProjectBoard pb = new InsertProjectBoard();
		pb.setProjectNo(pjNo);
		
        if(boardType.equals("writing")) {
        	pb.setBoardType("W");
        	InsertWriting writing = new InsertWriting();
        	writing.setWritingTitle(map.get("writingTitle"));
        	writing.setWritingContent(map.get("writingContent"));
        	writing.setWritingId(writer);
        	
        	result = service.insertWriting(writing, pb, hashTagList, notList, files);
        	
        } else if(boardType.equals("task")) {
        	/* 2) 업무  */
        	pb.setBoardType("T");
        	InsertTask task = new InsertTask();
        	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        	
        	task.setTaskTitle(map.get("taskTitle"));
        	task.setTaskState(map.get("taskState"));
        	task.setTaskProiority(map.get("taskProiority"));
        	Date startDate = null;
        	Date endDate = null;
			try {
				startDate = dateFormat.parse(map.get("taskStartdate"));
				endDate = dateFormat.parse(map.get("taskEnddate"));
			} catch (ParseException e) {
				e.printStackTrace();
			}        	
        	task.setTaskStartdate(new java.sql.Date(startDate.getTime()));
        	task.setTaskEnddate(new java.sql.Date(endDate.getTime()));
        	task.setTaskContent(map.get("taskContent"));
        	task.setTaskId(writer);
        	
        	String tmNames = map.get("taskManagerName");
    		List<InsertTaskManager> tmList = new ArrayList<InsertTaskManager>();
    		if(!(tmNames.trim().equals("") || tmNames == null)) {
    			String[] tmNameArr = tmNames.split(",");
    			for(String tm : tmNameArr) {
    				InsertTaskManager itm = new InsertTaskManager();
    				itm.setTaskManagerName(tm);
    				tmList.add(itm);
    			}
    		}
        	
        	result = service.insertTask(task, pb, hashTagList, notList, tmList, files);
        	
        } else if(map.get("boardType").equals("schedule")) {
        	System.out.println("$$$$$$$schedule$$$$$$$$$$");
        }
		

//        mv.addObject("pjNo", pjNo);
//		mv.addObject("projectMember", projectMember);
//		mv.setViewName("selectedProject/selectedProject");
		
		return selectedProject(mv, pjNo);
	}
	
}
