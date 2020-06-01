package com.madmax.stool.user.controller;

import static com.madmax.stool.common.RenameFactory.getRenamedFileName;
import static com.madmax.stool.user.email.FindUtil.getNewPwd;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.madmax.stool.board.model.service.BoardService;
import com.madmax.stool.board.model.vo.Board;
import com.madmax.stool.calendar.model.service.CalendarService;
import com.madmax.stool.calendar.model.vo.Calendar;
import com.madmax.stool.project.model.service.ProjectService;
import com.madmax.stool.project.model.vo.Favorite;
import com.madmax.stool.user.email.Email;
import com.madmax.stool.user.model.service.UserService;
import com.madmax.stool.user.model.vo.User;;

@Controller
@SessionAttributes({"loginUser"})
public class UserController {
	
	@Autowired
	private UserService service;
	
	@Autowired
	private ProjectService proService;
	
	@Autowired
	private CalendarService cService;
	
	@Autowired
	private BoardService bService;
	
	@Autowired
	private Logger logger;
	
	//비밀번호 암호화처리객체
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private Email email;
	

		
	@RequestMapping("/main.do")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/user/joinUser.do")
	public String joinUser() {
		
		return "user/login/joinUser";
	}
	
	
	@RequestMapping("/user/userEnrollEnd.do")
	public String insertUser(@RequestParam Map param, Model m, MultipartFile upFile, HttpSession session) {
		
		System.out.println("암호화 전 : " + param.get("password"));
		String pw = (String)param.get("password");
		pw = encoder.encode(pw);
		param.put("password", pw);
		System.out.println("암호화 후 : " + param.get("password"));
		
		logger.debug("파일명 : "+upFile.getOriginalFilename());
		logger.debug("파일크기 : "+upFile.getSize());
		
		String path=session.getServletContext().getRealPath("/resources/upload/profile");
		
		File f = new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}
		
		if(!upFile.isEmpty()) {
			String ori=upFile.getOriginalFilename();
			String ext = ori.substring(ori.lastIndexOf("."));
			String rename=getRenamedFileName(ori);
			try {
				upFile.transferTo(new File(path+"/"+rename));
			}catch(IOException e) {
				e.printStackTrace();
			}
			param.put("profile", rename);
		}
		
		int result = service.insertUser(param);
		
		String page = "common/msg";
		
		if(result==0) {
			m.addAttribute("msg", "회원가입실패! 다시 시도해주세요!");
			m.addAttribute("loc", "/user/joinUser.do");
		}else {
			m.addAttribute("msg", "회원가입성공! 관리자의 승인을 기다리세요!");
			m.addAttribute("loc", "/");
		}
		return page;
	}
	
	
	@RequestMapping("/user/userLogin.do")
	public String login(String userId, String password, Model m, HttpSession session, HttpServletRequest req) {
		
		User login = service.selectUser(userId);
//		logger.debug(login.toString());
		
		/* 세션 생성 */
	    session = req.getSession();
	    session.setAttribute("loginUser", login);
	    
		String id=login.getUserId();
		
		List<Favorite> list = proService.selectFavorite(id);
		int total = proService.selectFavoriteCount(id); 
		
		//캘린더 추가
		List<Calendar> cal=cService.selectSchedule(id);
		logger.debug("조회결과 : " + list);
//		mv.addObject("list", list);
//		mv.addObject("total", total);
		
		// 공지사항
		List<Board> blist = bService.selectBoard(1, 10);
//		logger.debug("board조회결과 : "+blist.size());
		logger.debug("board조회결과 : "+blist);
		
		String page = "";
		if(login!=null&&encoder.matches(password, login.getPassword())) {	
			page = "main";
			m.addAttribute("list",list);
			m.addAttribute("total",total);
			m.addAttribute("schedule",cal);
			m.addAttribute("loginUser", login);
			m.addAttribute("blist", blist);
			//logger.debug("user:"+login.getUserName());
			
		}else {
			page = "common/msg";
			m.addAttribute("msg", "로그인실패! 관리자에게 문의하세요.");
			m.addAttribute("loc", "/");
		}
		return page;
	}
	
	@RequestMapping("/user/logout.do")
	public String logout(SessionStatus status, HttpSession session) {
		
		if(!status.isComplete()) {
			status.setComplete();
		}
		
		return "redirect:/";
	}
	
	
	@RequestMapping("/user/checkId.do")
	@ResponseBody
	public Map checkId(String userId){
		
		User u=service.selectUser(userId);
		
		boolean flag=u!=null?false:true;
		
		Map<String,Object> map=new HashMap();
		map.put("user", u);
		map.put("flag",flag);
		//return flag;
		return map;
	}
	
//	@RequestMapping("/user/checkId")
//	public void checkId(String userId, HttpServletResponse res) {
//		
//		User u = service.selectUser(userId);
//		boolean flag = u!=null?false:true;
//		try {
//			res.setContentType("text/html;charset=utf-8");
////			res.getWriter().print(flag?"가능":"불가능!");
//			res.getWriter().write(flag?"<span style='color:green;'>가능!</span>":"<span style='color:red;'>불가능!</span>");
//		}catch(IOException e) {
//			e.printStackTrace();
//		}
//	}
	
	@RequestMapping("/user/findIdPw")
	public String findIdPw() {
		return "user/login/findIdPw";
	}
	
	// id찾기
	@RequestMapping("/user/findingId")
	public ModelAndView findingId(@RequestParam Map param, Model m) {
		
		String name = (String) param.get("userName");
		String phone = (String) param.get("phone");
		
		User u = service.selectId(param);
		//("msg","찾으시는 아이디는"u.getName
	
		ModelAndView mv=new ModelAndView();
		mv.addObject("User",u);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	
	@RequestMapping("/user/findingPw.do")
	public ModelAndView sendEmailAction (@RequestParam Map<String, Object> paramMap, ModelMap model, ModelAndView mv) throws Exception {

		String USERID = (String) paramMap.get("userId");
		String EMAIL = (String) paramMap.get("email");
		
		User u = service.findPw(paramMap);
		
		// 임시비번 랜덤값을 돌려 -> 랜덤값을 가지고 db에 가서 변경
		String password = getNewPwd();
		
		//String newPwd = encoder.encode(password);
		
		int result =0;
		if(u!=null) {
			Map<String, String> map = new HashMap();
			map.put("userId", u.getUserId());
//			map.put("password", newPwd());
			map.put("password", password);
			
			result = service.changePw(map);
		}
		
		// 임시 비번을 db에 저장할 메소드 
		
		if(result>0) {
			email.setContent("임시 비밀번호는 "+password+" 입니다."); // 이메일로 보낼 메시지
			email.setReceiver(EMAIL); 
			email.setSubject("[MADMAX] " + USERID + "님 비밀번호 찾기 메일입니다.");
			
			try {
				MimeMessage msg = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
				
				messageHelper.setSubject(email.getSubject());
				messageHelper.setText(email.getContent());
				messageHelper.setTo(email.getReceiver());
				messageHelper.setFrom("corporationmadmax@gmail.com");
				msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));
				mailSender.send(msg);
				
			}catch(MessagingException e) {
				System.out.println("MessagingException");
				e.printStackTrace();
			}
			mv.addObject("msg", "작성한 이메일로 임시비번이 전송되었습니다.");
			mv.addObject("flag", true);
			//mv.setViewName("jsonView");
			//return mv;
			
		}else {
			mv.addObject("msg", "일치하는 정보가 없습니다.");
			mv.addObject("flag", false);
		}
		mv.setViewName("jsonView");		
		return mv;
	}
	
	@RequestMapping("/user/updatePw")
	public String updatePwView() {
		return "user/login/updatePw";
	}
	@RequestMapping("/checkTemp.do")
	@ResponseBody
	public boolean checkTemp(String id, String pw) {
		
		User check=service.selectUser(id);
		
		return check.getPassword().equals(pw);
	}
	
	@RequestMapping("/user/updatePw.do")
	public String updatePw(@RequestParam Map param, Model m) {
		
		String userId = (String)param.get("userId");
		String newPwd = (String)param.get("password1");
		String newPw = (String)param.get("password2");
		
		System.out.println("pwb : "+newPwd);
		System.out.println("pwc : "+newPw);
		System.out.println("id : "+userId);

		String page = "";

		if(newPwd.equals(newPw)) {
		
			newPwd = encoder.encode(newPwd);
		
			System.out.println("pwa : "+newPwd);
		
			param.put("id", userId);
			param.put("newPwd", newPwd);
		
			int result = service.updatePw(param);
			
			if(result>0) {
				page="common/msg";
				m.addAttribute("msg", "비밀번호 변경 성공!");
				m.addAttribute("loc", "/");
			}
			
		}else if(!newPwd.equals(newPw)) {
			page = "common/msg";
			m.addAttribute("msg", "비밀번호 변경 실패!");
			m.addAttribute("loc", "/user/findIdPw");
		}
			
		return page;
	}

	@RequestMapping("/user/userInfo")
	public String userInfo() {
		return "user/userInfo";
	}
	@RequestMapping("/user/userUpdate")
	public String updateuser() {
		return "user/login/updateUser";
	}
	@RequestMapping("/user/userUpdate.do")
	public ModelAndView updateUser(ModelAndView mv, @RequestParam Map param, MultipartFile upFile, HttpServletRequest req, HttpSession session) {
		
		User u = (User)req.getSession().getAttribute("loginUser");
		String pw = (String)param.get("password");
		String email = (String)param.get("email");
		String phone = (String)param.get("phone");
		
		pw = encoder.encode(pw);
		
		param.put("id", u.getUserId());
		param.put("pw", pw);
		param.put("email", email);
		param.put("phone", phone);
		
		String path = session.getServletContext().getRealPath("/resources/upload/profile");
		
		File f = new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}
		
		String rename ="";
		
		if(!upFile.isEmpty()) {
			String ori=upFile.getOriginalFilename();
			String ext = ori.substring(ori.lastIndexOf("."));
			rename=getRenamedFileName(ori);
			try {
				upFile.transferTo(new File(path+"/"+rename));
			}catch(IOException e) {
				e.printStackTrace();
			}
			param.put("profile", rename);
		}
		
		u.setProfile(rename);
		int result = service.updateUser(param);
		
		mv.addObject("loginUser", u);
		mv.setViewName("user/userInfo");
		
		return mv;
	}
	

	
	
}
