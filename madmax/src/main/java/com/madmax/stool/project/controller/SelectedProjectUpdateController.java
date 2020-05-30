package com.madmax.stool.project.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.madmax.stool.project.model.service.SelectedProjectUpdateService;
import com.madmax.stool.project.model.vo.Attachment;
import com.madmax.stool.project.model.vo.InsertHashTag;
import com.madmax.stool.project.model.vo.InsertNotification;
import com.madmax.stool.project.model.vo.InsertProjectBoard;
import com.madmax.stool.project.model.vo.InsertWriting;

@Controller
public class SelectedProjectUpdateController {

	@Autowired
	private Logger logger;

	@Autowired
	private SelectedProjectUpdateService service;

	@RequestMapping("/selectedProject/deleteFavorite.do")
	@ResponseBody
	public int deleteFavorite(@RequestParam Map<String, String> map) {
		// 값 받기
		int flag = Integer.parseInt(map.get("flag"));
		int pjNo = Integer.parseInt(map.get("pjNo"));
		String loginId = map.get("loginId");

		Map<String, Object> pjInfo = new HashMap();
		pjInfo.put("pjNo", pjNo);
		pjInfo.put("loginId", loginId);

		int result = 0;
		if (flag > 0) {
			result = service.deleteFavorite(pjInfo);
		}

		return result;
	}

	@RequestMapping("/selectedProject/insertFavorite.do")
	@ResponseBody
	public int insertFavorite(@RequestParam Map<String, String> map) {
		// 값 받기
		int flag = Integer.parseInt(map.get("flag"));
		int pjNo = Integer.parseInt(map.get("pjNo"));
		String loginId = map.get("loginId");

		Map<String, Object> pjInfo = new HashMap();
		pjInfo.put("pjNo", pjNo);
		pjInfo.put("loginId", loginId);

		int result = 0;
		if (flag == 0) {
			result = service.insertFavorite(pjInfo);
		}

		return result;
	}

	@RequestMapping("/selectedProject/updateProjectColor.do")
	@ResponseBody
	public int updateProjectColor(@RequestParam Map<String, String> map) {
		// 값 받기
		int pjNo = Integer.parseInt(map.get("pjNo"));
		String color = map.get("color");

		Map<String, Object> pjInfo = new HashMap();
		pjInfo.put("pjNo", pjNo);
		pjInfo.put("color", color);

		int result = 0;
		result = service.updateProjectColor(pjInfo);

		return result;
	}

	@RequestMapping("/selectedProject/deleteProjectMember.do")
	@ResponseBody
	public int deleteProjectMember(@RequestParam Map<String, String> map) {
		// 값 받기
		int pjNo = Integer.parseInt(map.get("pjNo"));
		String loginId = map.get("loginId");

		Map<String, Object> pjInfo = new HashMap();
		pjInfo.put("pjNo", pjNo);
		pjInfo.put("loginId", loginId);

		int result = service.deleteProjectMember(pjInfo);

		return result;
	}

	@RequestMapping("/selectedProject/updateProjectManager.do")
	@ResponseBody
	public int updateProjectManager(@RequestParam Map<String, String> map) {
		// 값 받기
		int pjNo = Integer.parseInt(map.get("pjNo"));
		String loginId = map.get("loginId");
		String newManagerId = map.get("newManagerId");

		Map<String, Object> pjInfo = new HashMap();
		pjInfo.put("pjNo", pjNo);
		pjInfo.put("loginId", loginId);
		pjInfo.put("newManagerId", newManagerId);

		int result = 0;
		try {
			result = service.updateProjectManager(pjInfo);
		} catch (RuntimeException e) {
			e.printStackTrace();
		}

		return result;
	}

	@RequestMapping("/selectedProject/updateSelectedProject.do")
	@ResponseBody
	public int updateSelectedProject(@RequestParam Map<String, String> map) {
		// 값 받기
		int pjNo = Integer.parseInt(map.get("pjNo"));
		String title = map.get("projectTitle");
		String projectState = map.get("projectState") == null ? "P" : "E";

		Map<String, Object> upMap = new HashMap();
		upMap.put("title", title);
		upMap.put("projectState", projectState);
		upMap.put("pjNo", pjNo);

		int result = 0;
		try {
			result = service.updateSelectedProject(upMap);
		} catch (RuntimeException e) {
			e.printStackTrace();
		}

		return result;
	}

	@RequestMapping("/selectedProject/insertBookmark.do")
	@ResponseBody
	public int insertBookmark(@RequestParam Map<String, String> map) {
		// 값 받기
		int bNo = Integer.parseInt(map.get("bNo"));
		String loginId = map.get("loginId");

		Map<String, Object> bInfo = new HashMap();
		bInfo.put("bNo", bNo);
		bInfo.put("loginId", loginId);

		int result = 0;
		try {
			result = service.insertBookmark(bInfo);
		} catch (RuntimeException e) {
			e.printStackTrace();
		}

		return result;
	}

	@RequestMapping("/selectedProject/deleteBookmark.do")
	@ResponseBody
	public int deleteBookmark(@RequestParam Map<String, String> map) {
		// 값 받기
		int bNo = Integer.parseInt(map.get("bNo"));
		String loginId = map.get("loginId");

		Map<String, Object> bInfo = new HashMap();
		bInfo.put("bNo", bNo);
		bInfo.put("loginId", loginId);

		int result = 0;
		try {
			result = service.deleteBookmark(bInfo);
		} catch (RuntimeException e) {
			e.printStackTrace();
		}

		return result;
	}

	@RequestMapping("/selectedProject/updatePinPost.do")
	@ResponseBody
	public int updatePinPost(@RequestParam Map<String, String> map) {
		// 값 받기
		String check = map.get("check");
		int pjNo = Integer.parseInt(map.get("pjNo"));
		int bNo = Integer.parseInt(map.get("bNo"));

		Map<String, Object> pjInfo = new HashMap();
		pjInfo.put("check", check);
		pjInfo.put("pjNo", pjNo);
		pjInfo.put("bNo", bNo);

		int result = 0;
		try {
			result = service.updatePinPost(pjInfo);
		} catch (RuntimeException e) {
			e.printStackTrace();
		}

		return result;
	}

	@RequestMapping("/selectedProject/insertComment.do")
	@ResponseBody
	public int insertComment(@RequestParam Map<String, String> map) {
		// 값 받기
		String postType = map.get("postType");
		String receiveId = map.get("receiveId");
		String senderId = map.get("senderId");
		String comment = map.get("comment");
		int boardNo = Integer.parseInt(map.get("boardNo"));
		int postNo = Integer.parseInt(map.get("postNo"));
		String commentType = "";
		if (postType.equals("W")) {
			commentType = "writingcomment";
		} else if (postType.equals("T")) {
			commentType = "tastcomment";
		} else if (postType.equals("S")) {
			commentType = "schedulecomment";
		}

		Map<String, Object> cMap = new HashMap();
		cMap.put("postType", postType);
		cMap.put("receiveId", receiveId);
		cMap.put("senderId", senderId);
		cMap.put("comment", comment);
		cMap.put("boardNo", boardNo);
		cMap.put("postNo", postNo);
		cMap.put("commentType", commentType);

		int result = 0;
		try {
			result = service.insertComment(cMap);
		} catch (RuntimeException e) {
			e.printStackTrace();
		}

		return result;
	}

	@RequestMapping("/selectedProject/updateComment.do")
	@ResponseBody
	public int updateComment(@RequestParam Map<String, String> map) {
		// 값 받기
		String postType = map.get("postType");
		String comment = map.get("comment");
		int commentNo = Integer.parseInt(map.get("commentNo"));

		Map<String, Object> cMap = new HashMap();
		cMap.put("postType", postType);
		cMap.put("comment", comment);
		cMap.put("commentNo", commentNo);

		int result = 0;
		try {
			result = service.updateComment(cMap);
		} catch (RuntimeException e) {
			e.printStackTrace();
		}

		return result;
	}

	@RequestMapping("/selectedProject/deleteComment.do")
	@ResponseBody
	public int deleteComment(@RequestParam Map<String, String> map) {
		// 값 받기
		String type = map.get("type");
		int cNo = Integer.parseInt(map.get("cNo"));

		Map<String, Object> cMap = new HashMap();
		cMap.put("type", type);
		cMap.put("cNo", cNo);

		int result = 0;
		try {
			result = service.deleteComment(cMap);
		} catch (RuntimeException e) {
			e.printStackTrace();
		}

		return result;
	}

	// 파일다운로드
	@RequestMapping("/selectedProject/fileDownload.do")
	public void fileDownload(int pjNo, String ori, String rename, HttpSession session,
			@RequestHeader(value = "user-agent") String header, ServletOutputStream out, HttpServletResponse res) {

		// 파일경로
		String path = session.getServletContext().getRealPath("/resources/upload/selectedProject" + pjNo);
		BufferedInputStream bis = null;
		File f = new File(path + "/" + rename);

		// 파일과 연결된 스트림, 보낼 대상의 스트림
		try {
			bis = new BufferedInputStream(new FileInputStream(f));
			// 분기처리

			boolean isMSIE = header.indexOf("MSIE") != -1 || header.indexOf("Trident") != -1;
			String oriName = "";
			if (isMSIE) {
				oriName = URLEncoder.encode(ori, "UTF-8");
				oriName = oriName.replaceAll("\\+", "%20");
			} else {
				oriName = new String(ori.getBytes("UTF-8"), "ISO-8859-1");
			}
			// 응답설정세팅
			res.setContentType("application/otect-stream;charset=UTF-8");
			res.addHeader("Content-Disposition", "attachment;filename=\"" + oriName + "\"");

			int read = -1;
			while ((read = bis.read()) != -1) {
				out.write(read);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				bis.close();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping("/selectedProject/updateProjectBoardStatus.do")
	@ResponseBody
	public int updateProjectBoardStatus(@RequestParam Map<String, String> map) {
		// 값 받기
		int pjNo = Integer.parseInt(map.get("pjNo"));
		int bNo = Integer.parseInt(map.get("bNo"));

		Map<String, Object> pbMap = new HashMap();
		pbMap.put("pjNo", pjNo);
		pbMap.put("bNo", bNo);

		int result = 0;
		try {
			result = service.updateProjectBoardStatus(pbMap);
		} catch (RuntimeException e) {
			e.printStackTrace();
		}

		return result;
	}

	@RequestMapping("/selectedProject/updateSelectedProjectPost")
	@ResponseBody
	public int updateSelectedProjectPost(@RequestParam Map<String, String> map, MultipartHttpServletRequest mtfRequest,
			HttpSession session) {

		// entrySet()
        for (Map.Entry<String, String> entry : map.entrySet()) {
            System.out.println("[key]:" + entry.getKey() + ", [value]:" + entry.getValue());
        }

        //JSP에서 받아온 기본값들
  		int bNo = Integer.parseInt(map.get("projectBoardNo")); //게시글 번호
  		int pjNo = Integer.parseInt(map.get("selectedProjectNo")); //프로젝트 번호
  		String boardType = map.get("boardType"); //글 타입
  		int postNo = Integer.parseInt(map.get("postNo")); //글 번호    ex) WRITINGNO
  		String writer = map.get("writer"); //작성자

  		//위 값을 map으로 담기
		Map<String, Object> pInfo = new HashMap();
		pInfo.put("bNo", bNo);
		pInfo.put("pjNo", pjNo);
		pInfo.put("boardType", boardType);
		pInfo.put("postNo", postNo);
		pInfo.put("writer", writer);
      		
  		//1. 새로운 파일을 넣은 경우) 파일 받아와서 저장
        List<MultipartFile> newFileList = mtfRequest.getFiles("newFiles");
        List<MultipartFile> newImgFileList = mtfRequest.getFiles("newImgFiles");        

        //새로운 파일이 있는 경우 전에 있던 파일을 삭제해야함
        //전 파일 목록을 가져온다
        List<Attachment> oriFiles = service.selectOrifiles(pInfo);
        boolean deleteFlag = false;
 
		//파일 저장경로 가져오기
		String path = session.getServletContext().getRealPath("/resources/upload/selectedProject"+pjNo);
		
		/* 파일을 저장할 객체 생성! */
		List<Attachment> newFiles=new ArrayList<Attachment>();
		
		File f = new File(path); //폴더
		if(!f.exists()) f.mkdirs(); //폴더가 없으면 만든다
		//파일 저장 로직 구현
		//⑴FileAttachment - 파일리네임 구성하기
		for(MultipartFile mf : newFileList) {
			if(!mf.isEmpty()) { //파일이 있을때만 실행
				String ori = mf.getOriginalFilename();
				String ext = ori.substring(ori.lastIndexOf("."));
				//파일 리네임		
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rnd = (int)(Math.random()*1000);
				String rename = "file_"+sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
				
			//리네임 된 이름으로 파일 저장하기
				try {
					mf.transferTo(new File(path+"/"+rename)); //☆★☆ transferTo : 저장하는 메소드
				}catch(IOException e) {
					e.printStackTrace();
				}
				Attachment fa = new Attachment();
				fa.setOriginalFilename(ori);
				fa.setRenamedFilename(rename);
				newFiles.add(fa);
			}
			
			if(!oriFiles.isEmpty()) {
				for(Attachment a : oriFiles) {
					try {
						File delFile = new File(path +"/"+ a.getRenamedFilename());
						deleteFlag = delFile.delete();
					}catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
			
		}
		//⑵ImgFileAttachment - 파일리네임 구성하기
		for(MultipartFile mf : newImgFileList) {
			if(!mf.isEmpty()) { //파일이 있을때만 실행
				String ori = mf.getOriginalFilename();
				String ext = ori.substring(ori.lastIndexOf("."));
				//파일 리네임		
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rnd = (int)(Math.random()*1000);
				String rename = "img_"+sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
				
			//리네임 된 이름으로 파일 저장하기
				try {
					mf.transferTo(new File(path+"/"+rename)); //☆★☆ transferTo : 저장하는 메소드
				}catch(IOException e) {
					e.printStackTrace();
				}
				Attachment ifa = new Attachment();
				ifa.setOriginalFilename(ori);
				ifa.setRenamedFilename(rename);
				newFiles.add(ifa);
			
			}
			
			
			if( !oriFiles.isEmpty() && deleteFlag==false ) {
				for(Attachment a : oriFiles) {
					try {
						File delFile = new File(path +"/"+ a.getRenamedFilename());
						deleteFlag = delFile.delete();
					}catch (Exception e) {
						e.printStackTrace();
					}
				}
			}			
		}        

		
		
		
		//2. 해시태그and언급 있을 경우 처리 후 저장
		//2-1) 해시태그
		//지워질 태그
		String deleteTagListStr = map.get("deleteTagListStr");		
		List<InsertHashTag> deleteTagList = new ArrayList<InsertHashTag>();
		if(!deleteTagListStr.trim().equals("") && deleteTagListStr != null) {
			String[] tagArr = deleteTagListStr.split(",");
			for(String t : tagArr) {
				InsertHashTag hashTag = new InsertHashTag();
				hashTag.setBoardNo(bNo);
				hashTag.setHashtagNo(Integer.parseInt(t));
				deleteTagList.add(hashTag);
			}
		}
		
		//수정으로 추가되는 태그
		String newTagListStr = map.get("newTagListStr");		
		List<InsertHashTag> newTagList = new ArrayList<InsertHashTag>();
		if(!newTagListStr.trim().equals("") && newTagListStr != null) {
			String[] tagArr = newTagListStr.split(",");
			for(String t : tagArr) {
				InsertHashTag hashTag = new InsertHashTag();
				hashTag.setHashtagText(t);
				hashTag.setBoardNo(bNo);
				newTagList.add(hashTag);
			}
		}
		
		
		//2-2) 언급
		//지울 언급 DELETE
		String notType = "";
		if (boardType.equals("W")) notType = "writing";
		if (boardType.equals("T")) notType = "task";
		if (boardType.equals("S")) notType = "schedule";
		
		String deleteNotListStr = map.get("deleteMentionListStr");		
		List<InsertNotification> deleteNotList = new ArrayList<InsertNotification>();
		if(!deleteNotListStr.trim().equals("") && deleteNotListStr != null) {
			String[]  notArr = deleteNotListStr.split(",");
			for(String n : notArr) {	
				InsertNotification notification = new InsertNotification();
				notification.setReceiveId(n);
				notification.setNotType(notType);
				notification.setBoardNo(bNo);
				notification.setSenderId(writer);
				deleteNotList.add(notification);
			}
		}		
		//수정으로 추가될 언급 INSERT
		String newNotListStr = map.get("newMentionListStr");		
		List<InsertNotification> newNotList = new ArrayList<InsertNotification>();
		if(!newNotListStr.trim().equals("") && newNotListStr != null) {
			String[]  notArr = newNotListStr.split(",");
			for(String n : notArr) {	
				InsertNotification notification = new InsertNotification();
				notification.setReceiveId(n);
				notification.setSenderId(writer);
				notification.setNotType(notType);
				notification.setBoardNo(bNo);
				newNotList.add(notification);
			}
		}		
      		
		

        //3. 글 타입에 따라 각자 테이블에 UPDATE / DELETE / INSERT
        //※ 이때 파일이 있으면 타입별 파일테이블에도 같이 insert
		int result=0;
		InsertProjectBoard pb = new InsertProjectBoard();
		pb.setProjectNo(pjNo);
		
        if(boardType.equals("W")) {
        	/* 1) 글 */
        	pb.setBoardType("W");
        	InsertWriting writing = new InsertWriting();
        	writing.setWritingTitle(map.get("writingTitle"));
        	writing.setWritingContent(map.get("writingContent"));
        	writing.setWritingNo(postNo);
        	
    		try {
            	result = service.updateWriting(writing, pb, deleteNotList, newNotList, deleteTagList, newTagList, oriFiles, newFiles, pInfo);
    		}catch(RuntimeException e){
    			e.printStackTrace();
    			for(Attachment a : newFiles) {
    				File delF=new File(path+"/"+a.getRenamedFilename());
    				if(delF.exists()) {
    					delF.delete();
    				}
    			}
    		}
        	
        } 		
		
		return result;
	}

}
