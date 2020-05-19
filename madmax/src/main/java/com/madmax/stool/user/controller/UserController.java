package com.madmax.stool.user.controller;

import static com.madmax.stool.common.RenameFactory.getRenamedFileName;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.madmax.stool.user.email.Email;
import com.madmax.stool.user.email.FindUtil;
import com.madmax.stool.user.email.MailUtil;
import com.madmax.stool.user.model.service.UserService;
import com.madmax.stool.user.model.vo.User;
import static com.madmax.stool.user.email.FindUtil.getNewPwd;;

@Controller
@SessionAttributes({"loginUser"})
public class UserController {
	
	@Autowired
	private UserService service;
	
	@Autowired
	private Logger logger;
	
	//비밀번호 암호화처리객체
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private Email email;
	
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
		
		String page = "";
		
		if(result==0) {
			page = "common/msg";
			m.addAttribute("msg", "회원가입실패! 다시 시도해주세요!");
			m.addAttribute("loc", "/user/joinUser.do");
		}else {
			page = "redirect:/";
		}
		return page;
	}
	
	@RequestMapping("/user/userLogin.do")
	public String login(String userId, String password, Model m, HttpSession session) {
		
		User login = service.selectUser(userId);
		
		if(login!=null&&encoder.matches(password, login.getPassword())) {	
			
			m.addAttribute("msg", "로그인성공!");
			m.addAttribute("loginUser", login);
			
//			logger.debug("user:"+login.getUserName());
		}else {
			m.addAttribute("msg", "로그인실패!");
		}
		m.addAttribute("loc", "/");
		return "common/msg";
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
	
	
	// pw 찾기
//	@RequestMapping("/user/findingPw.do")
//	public ModelAndView findingPw(@RequestParam Map param, Model m) {
//		
//		String id = (String)param.get("userId");
//		String email = (String)param.get("email");
//		
//		User u = service.findPw();
//		
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("user", u);
//		mv.setViewName("jsonView");
//		
//		return mv;
//	}
	
	
	
	@RequestMapping("/user/findingPw.do")
	public ModelAndView sendEmailAction (@RequestParam Map<String, Object> paramMap, ModelMap model, ModelAndView mv) throws Exception {

		String USERID = (String) paramMap.get("userId");
		String EMAIL = (String) paramMap.get("email");
		
		User u = service.findPw(paramMap);
		
		// 임시비번 랜덤값을 돌려 -> 랜덤값을 가지고 db에 가서 변경
		String password = getNewPwd();
		
		String newPwd = encoder.encode(password);
		
		int result =0;
		if(u!=null) {
			Map<String, String> map = new HashMap();
			map.put("userId", u.getUserId());
			map.put("password", newPwd);
			
			result = service.changePw(map);
		}
		
		// 임시 비번을 db에 저장할 메소드 
		
		if(result>0) {
			email.setContent("임시 비밀번호는 "+password+" 입니다."); // 이메일로 보낼 메시지
			email.setReceiver(EMAIL); // 받는이의 이메일 주소
			email.setSubject(USERID+"님 비밀번호 찾기 메일입니다."); // 이메일로 보낼 제목
			
			try {
				MimeMessage msg = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper 
				= new MimeMessageHelper(msg, true, "UTF-8");
				
				messageHelper.setSubject(email.getSubject());
				messageHelper.setText(email.getContent());
				messageHelper.setTo(email.getReceiver());
				messageHelper.setFrom("madmax@gmail.com"); // 보내는 이의 주소(root-context.xml 에서 선언했지만 적어줬음)
				msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));
				mailSender.send(msg);
				
			}catch(MessagingException e) {
				System.out.println("MessagingException");
				e.printStackTrace();
			}
			mv.addObject("msg", "작성한 이메일로 임시비번이 전송되었습니다.");
			mv.setViewName("jsonView");
			return mv;
		}else {
			mv.addObject("msg", "일치하는 정보가 없습니다.");
			mv.setViewName("jsonView");
			return mv;
		}
	}
	
	
	
	//	@RequestMapping("/user/findingPw.do")
//	public ModelAndView userpassword2(@RequestParam("userId") String userId,
//			@RequestParam("email") String email, ModelAndView mv) throws Exception {
//
//		Map<String, Object> map = new HashMap<String, Object>();
//
//		map.put("userId", userId);
//		map.put("email", email); // <- 비밀번호를 찾고자 하는 사람의 정보를 DB에서 찾아오고,
//
//		System.out.println("a : " + map);
//		System.out.println("id : " + userId);
//		System.out.println("email : " + email);
//
//		User u = service.findPw(map);
//
//		if (u != null) { // 유저정보를 찾았다면
//
//			String newPwd = FindUtil.getNewPwd();
//
//			Map<String, String> map2 = new HashMap<>();
//
//			map2.put("userId", userId);
//			map2.put("newPwd", newPwd); // DB에서 찾아온 정보를 map2로 담아서
//
//			System.out.println("b ; " + map2);
//
////			service.changePwd(map2);
//
//			String subject = "[madmax] 임시 비밀번호 발급안내";
//
//			String msg = "";
//			msg += "<br> <br> <div align='center' style='border:1px solid black;'>";
//			msg += "<h3 style='color: blue';><strong>" + userId + "<br>";
//			msg += "님</strong>의 임시 비밀번호 입니다. 로그인 후 비밀번호를 변경하세요.</h3>";
//			msg += "<p> 임시 비밀번호 : <strong>" + newPwd + "<br> <br> </strong></p></div> ";
//
//			MailUtil.sendMail(email, subject, msg); // mailutil을 사용해 임시 비밀번호를 메일로 보냄.
//
////			mv.setViewName("userpassword2");
//			return mv;
//		} else {
//			int check = 0;
//			mv.addObject("checkSep", check);
//			mv.setViewName("userpasswordfind");
//			return mv;
//		}
//
//	}


	
	

	
	
}
