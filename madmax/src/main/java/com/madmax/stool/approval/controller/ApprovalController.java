package com.madmax.stool.approval.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public ModelAndView selectDraftForm(ModelAndView mv, @RequestParam(required = false, defaultValue = "3") int dNo) {
		mv.addObject("type", service.selectApprDocForm(dNo));
		mv.setViewName("/approval/apprDocWrite");
		return mv;
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
				AppredDoc a = new AppredDoc(0, i);
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

	@RequestMapping("/appr/myStorageBox")
	public String myStorageBox() {
		return "approval/myStorageBox";
	}
	
	@RequestMapping("/appr/openApprDoc")
	public String openApproval(Model m, int apprNo) {
		ApprDoc appr= service.selectApprDoc(apprNo);
		m.addAttribute("appr", appr);
		System.out.println(appr);	
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

}
