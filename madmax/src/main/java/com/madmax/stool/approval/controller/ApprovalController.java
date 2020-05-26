package com.madmax.stool.approval.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.madmax.stool.approval.model.service.ApprovalService;
import com.madmax.stool.approval.model.vo.ApprAttachment;
import com.madmax.stool.approval.model.vo.ApprDoc;
import com.madmax.stool.approval.model.vo.ApprDocType;
import com.madmax.stool.approval.model.vo.ApprLine;
import com.madmax.stool.approval.model.vo.AppredDoc;
import com.madmax.stool.approval.model.vo.Approval;
import com.madmax.stool.approval.model.vo.DeptUsers;
import com.madmax.stool.approval.model.vo.User;
import com.madmax.stool.common.PagingFactory;
import com.madmax.stool.common.RenameFactory;

@Controller
public class ApprovalController {
	@Autowired
	ApprovalService service;

	@RequestMapping("/appr/approval.do")
	public ModelAndView approvalList(ModelAndView mv, @RequestParam(required = false, defaultValue = "1") int cPage,
			@RequestParam(required = false, defaultValue = "10") int numPerPage) {
		List<ApprDocType> list = service.selectApprDocList(cPage, numPerPage);
		int totalData = service.selectApprDocListCount();
		mv.addObject("list", list);
		mv.addObject("pageBar", PagingFactory.getPage(totalData, cPage, numPerPage, "/stool/appr/approval.do"));
		mv.setViewName("approval/apprList");
		return mv;
	}

	@RequestMapping("/appr/draftForm.do")
	public ModelAndView selectDraftForm(ModelAndView mv, @RequestParam(required = false, defaultValue = "1") int dNo) {
		mv.addObject("type", service.selectApprDocForm(dNo));
		mv.addObject("apprDocTypeNo", dNo);
		mv.setViewName("/approval/apprDocWrite");
		return mv;
	}
	
	@RequestMapping("/appr/uploadSign")
	public String uploadSign(MultipartFile sign, String userId, HttpSession session, Model m, SessionStatus status) {
		String path = session.getServletContext().getRealPath("/resources/upload/sign");
		File f = new File(path);
		if(!f.exists()) f.mkdirs();
		String rename = userId+".png";
		int result = service.updateUserSign(userId);
		String msg="";
		String loc="/";
		if(result>0) {
			try {
				sign.transferTo(new File(path+"/"+rename));
				msg="서명이 정상적으로 저장되었습니다. 재로그인 후 사용해주세요";
				if(!status.isComplete()) status.setComplete();
				
			}catch(IOException e) {
				e.printStackTrace();
				msg="서명 저장 실패. 관리자에게 문의하세요";
			}			
		}else {
			msg="서명 저장 실패. 관리자에게 문의하세요";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		return "common/msg";
	}

	@RequestMapping("/appr/draftFormEnd")
	public String selectDraftFormEnd(HttpServletRequest req, HttpSession session, String[] apprLine, Approval appr, 
								int[] appredNo, MultipartFile[] upFile, Model m) {
		// 결재문서 정보 treat
		String userId = ((com.madmax.stool.user.model.vo.User)req.getSession().getAttribute("loginUser")).getUserId();
		appr.setUserId(userId);
		appr.setFinalApprStep(apprLine.length);
		if (appr.getApprContent() != null) {
			appr.getApprContent().replace("\'", "\''").replace("\"", "\\\"");
		} else { //ApprContent 없을 때
			appr.setApprContent("");
		}
		if (appr.getApprText() != null) {
			appr.getApprText().replace("\'", "\''").replace("\"", "\\\"");
		} else { //ApprText 없을 때
			appr.setApprText("");
		}
		System.out.println("1");
		System.out.println(appr);
		System.out.println(apprLine);
		System.out.println(appredNo);
		System.out.println(upFile);
		// 결재선 정보 입력
		List<ApprLine> apprLines=new ArrayList();
		for(int i=0;i<apprLine.length;i++){  
			String[] lineInfo=apprLine[i].split("/"); 
			ApprLine a = new ApprLine();
			a.setApprStep(i+1);
			a.setApprUser(lineInfo[0]);
			a.setApprType(lineInfo[1]);
			apprLines.add(a); 
		}
		//receiver 유무 확인
		if(appr.getReceiver()==null) appr.setReceiver("");

		//기결재
		List<AppredDoc> appred = new ArrayList(); 
		if(appredNo!=null) {			
			for(int i : appredNo) {
				AppredDoc a = new AppredDoc(0, i, "");
				appred.add(a);
			}
		}
		
		//파일업로드
		String path = session.getServletContext().getRealPath("/resources/upload/approval");
		File f=new File(path);
		if(!f.exists()) f.mkdirs();
		List<ApprAttachment> files=new ArrayList();
		for(MultipartFile mf : upFile) {
			if(!mf.isEmpty()) {
				String ori = mf.getOriginalFilename();
				String rename = RenameFactory.getRenamedFileName(ori);
				try {
					mf.transferTo(new File(path+"/"+rename));
				}catch(IOException e) {
					e.printStackTrace();
				}
				ApprAttachment a = new ApprAttachment();
				a.setDocOriFileName(ori);
				a.setDocRenamedFile(rename);
				files.add(a);
			}
		}
		
		//insert 메소드 실행
		int result=0;
		try{
			result =service.insertApproval(appr, apprLines, appred, files);
		}catch(RuntimeException e) {
			e.printStackTrace(); 
		}
		String msg = "", loc ="";
		if(result>0) {
			msg ="결재문서 작성 완료";
			loc = "";
		}else{
			msg = "결재 문서 작성 실패";
			loc = "";
		}
		m.addAttribute("loc", loc);
		m.addAttribute("msg", msg);
		m.addAttribute("script", "window.close();");
		return "common/msg";
	}
	
	@RequestMapping("/appr/line.do")
	public ModelAndView approvalLine(ModelAndView mv) {

		List<DeptUsers> deptUsers = service.selectDeptInfo();

		for (DeptUsers du : deptUsers) {
			List<User> users = service.selectDeptUsers(du);
			du.setUsers(users);
		}

		mv.addObject("list", deptUsers);
		mv.setViewName("approval/apprLine");
		return mv;
	}
	
	@RequestMapping("/appr/saveAsTemp")
	public String saveAsTemp(HttpServletRequest req, Approval appr, 
			int[] appredNo, MultipartFile[] upFile, Model m) {
		
		return "";
	}
	
	@RequestMapping("/appr/reuseTemp")
	public String reuseTemp(int apprNo, Model m) {
		ApprDoc appr= service.selectApprDoc(apprNo);
		if(appr.getApprText()!=null){
			appr.setApprText(appr.getApprText().replace("\r\n", "<br>"));
		}
		m.addAttribute("appr", appr);
		return "approval/re-apprDocWrite";
	}

	@RequestMapping("/appr/apprReqBox.do")
	//public String appovalRequestBox(@SessionAttribute("loginUser") User user) {
	public String approvalRequestBox(HttpServletRequest req, Model m) {
		String userId = ((com.madmax.stool.user.model.vo.User)req.getSession().getAttribute("loginUser")).getUserId();
		List<Approval> list = service.selectApprReqList(userId);
		m.addAttribute("list", list);
		return "approval/apprReqBox";
	}
	
	@RequestMapping("/appr/apprTempBox.do")
	public String approvalTempBox(HttpServletRequest req, Model m) {
		String userId = ((com.madmax.stool.user.model.vo.User)req.getSession().getAttribute("loginUser")).getUserId();
		List<Approval> list = service.selectApprTempList(userId);
		m.addAttribute("list", list);
		return "approval/apprTempBox";
	}

	@RequestMapping("/appr/apprWaitBox.do")
	public String approvalWaitBox(HttpServletRequest req, Model m) {
		String userId = ((com.madmax.stool.user.model.vo.User)req.getSession().getAttribute("loginUser")).getUserId();
		List<Approval> list  = service.selectApprWaitList(userId);
		m.addAttribute("list", list);
		return "approval/apprWaitBox";
	}

	/*
	 * @RequestMapping("/appr/apprProgBox.do") public String approvalProgBox() {
	 * return "approval/apprProgBox"; }
	 */

	/*
	 * @RequestMapping("/appr/apprDoneBox.do") public String approvalDoneBox() {
	 * return "approval/apprDoneBox"; }
	 */

	@RequestMapping("/appr/myDocBox")
	public String myDocBox() {
		return "/approval/myDocBox";
	}

	@RequestMapping("/appr/deptDocBox")
	public String deptDocBox() {
		return "approval/deptDocBox";
	}

	
	@RequestMapping("/appr/openApprDoc")
	public String openApproval(Model m, int apprNo) {
		ApprDoc appr= service.selectApprDoc(apprNo);
		m.addAttribute("appr", appr);
		return "approval/openApprDoc";
	}

	@RequestMapping("/appr/openApprDoDoc")
	public String openDoApproval(HttpServletRequest req, Model m, int apprNo) {
		String userId = ((com.madmax.stool.user.model.vo.User)req.getSession().getAttribute("loginUser")).getUserId();
		Approval approval = new Approval();
		approval.setUserId(userId);
		approval.setApprNo(apprNo);
		ApprDoc appr= service.selectDoApproval(approval);
		m.addAttribute("appr", appr);
		System.out.println(appr);	
		return "approval/openDoApprDoc";
	}
	
	@RequestMapping("/appr/updateTemporary")
	@ResponseBody
	public boolean updateTemporary(int apprNo) {
		if(service.updateTemporary(apprNo)>0) return true;
		else return false;
		
	}
	
	@RequestMapping("/appr/attachAppredDoc.do")
	public String attachAppredDoc(String deptCode, Model m) {
		List<ApprDoc> list = service.selectAttachAppredDoc(deptCode);
		m.addAttribute("list", list);
		return "approval/appredDocList";
		
	}
	
	@RequestMapping("/appr/deleteDoc")
	@ResponseBody
	public boolean deleteDoc(int apprNo) {
		if(service.deleteDoc(apprNo)>0) return true;
		else return false;
	}
	
	@RequestMapping("/appr/executeApproval")
	@ResponseBody 
	public boolean updateAppr(@RequestParam Map<String, String> map) {
		ApprLine line = new ApprLine();
		line.setApprNo(Integer.parseInt(map.get("apprNo")));
		line.setApprStep(Integer.parseInt(map.get("apprStep")));
		line.setApprUser(map.get("apprUser"));
		line.setApprType(map.get("apprType"));
		line.setApprResult(Integer.parseInt(map.get("apprResult")));
		line.setApprMessage(map.get("apprMessage"));
		
		//1 .apprLine, approval 업데이트
		int result = service.updateAppr(line);
		if(result>0) return true;
		else return false;
	}

	@RequestMapping("/appr/fileDownload")
	public void fileDownload(String ori, String rename, ServletOutputStream out,
				HttpSession session, @RequestHeader(value="user-agent") String header,
				HttpServletResponse res) {
	
		//파일 경로
		String path = session.getServletContext().getRealPath("/resources/upload/approval");
		//보조스트림
		BufferedInputStream bis = null;
		File f = new File(path+"/"+rename);
		try {
			bis = new BufferedInputStream(new FileInputStream(f));
			boolean MSIE = header.indexOf("MSIE")!=-1||header.indexOf("Trident")!=-1;
			String oriName="";
			if(MSIE) {
				oriName=URLEncoder.encode(ori, "UTF-8");
				oriName=oriName.replaceAll("\\+","%20");
				
			}else {
				oriName=new String(ori.getBytes("UTF-8"), "ISO-8859-1");	
			}
			res.setContentType("application/otect-stream;charset=UTF-8");
			res.addHeader("Content-Disposition", "attachment;filename=\""+oriName+"\"");
			
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
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	@RequestMapping("appr/reDraftFormEnd")
	public String reDraftFormEnd(HttpServletRequest req, HttpSession session, String[] apprLine, Approval appr, 
			int[] appredNo, MultipartFile[] upFile, String[] delFile, Model m) {
		// 결재문서 정보 treat
		appr.setFinalApprStep(apprLine.length);
		if (appr.getApprContent() != null) {
			appr.getApprContent().replace("\'", "\''").replace("\"", "\\\"");
		} else { //ApprContent 없을 때
			appr.setApprContent("");
		}
		if (appr.getApprText() != null) {
			appr.getApprText().replace("\'", "\''").replace("\"", "\\\"");
		} else { //ApprText 없을 때
			appr.setApprText("");
		}
		// 결재선 정보 입력
		List<ApprLine> apprLines=new ArrayList();
		for(int i=0;i<apprLine.length;i++){  
			String[] lineInfo=apprLine[i].split("/"); 
			ApprLine a = new ApprLine();
			a.setApprStep(i+1);
			a.setApprUser(lineInfo[0]);
			a.setApprType(lineInfo[1]);
			apprLines.add(a); 
		}
		//receiver 유무 확인
		if(appr.getReceiver()==null) appr.setReceiver("");
		//기결재
		List<AppredDoc> appred = new ArrayList(); 
		if(appredNo!=null) {			
			for(int i : appredNo) {
				AppredDoc a = new AppredDoc(0, i, "");
				appred.add(a);
			}
		}
		//파일업로드
		//1)새로 올라온 파일 있는지 확인
		String path = session.getServletContext().getRealPath("/resources/upload/approval");
		File f=new File(path);
		if(!f.exists()) f.mkdirs();
		List<ApprAttachment> files=new ArrayList();
		for(MultipartFile mf : upFile) {
			
			if(!mf.isEmpty()) {
				String ori = mf.getOriginalFilename();
				System.out.println(ori);
				String rename = RenameFactory.getRenamedFileName(ori);
				try {
					mf.transferTo(new File(path+"/"+rename));
					System.out.println("트랜스퍼 두번 함");
				}catch(IOException e) {
					e.printStackTrace();
				}
				ApprAttachment a = new ApprAttachment();
				a.setDocOriFileName(ori);
				a.setDocRenamedFile(rename);
				files.add(a);
			}
		}
		
		//2)삭제할 파일 있는지 확인
		List<ApprAttachment> delFiles= new ArrayList();

		if(delFile!=null) {
			for(String s : delFile) {
				ApprAttachment delAttachment = new ApprAttachment();
				String[] delFileInfo=s.split("/");
				//delFileInfo[1] - docFileNo
				//삭제할 파일번호 list에 담기
				delAttachment.setDocFileNo(Integer.parseInt(delFileInfo[1]));
				System.out.println("잘 담겼는지 확인 : "+delAttachment.getDocFileNo());
				delFiles.add(delAttachment);
			}
		}
		
		//update 메소드 실행
		int result=0;
		String msg = "", loc ="";
		try{
			result =service.updateTempApproval(appr, apprLines, appred, files, delFiles);
			if(delFile!=null) {
				for(String s : delFile) {
					String[] delFileInfo=s.split("/");
					//delFileInfo[0] - renamed filename
					//파일 삭제
					File delF = new File(path+"/"+delFileInfo[0]);
					if(delF.exists()) delF.delete();
					msg ="결재문서 작성 완료";
					loc = "";
				}
			}
		}catch(RuntimeException e) {
			for(ApprAttachment a : files) {
				File delF=new File(path+"/"+a.getDocRenamedFile());
				if(delF.exists()) delF.delete();
				e.printStackTrace();
				msg = "결재 문서 작성 실패 : "+e.getMessage();
				loc = "";
				
			}
		}
		m.addAttribute("loc", loc);
		m.addAttribute("msg", msg);
		m.addAttribute("script", "window.close();");
			
		return "common/msg";
	}
}
