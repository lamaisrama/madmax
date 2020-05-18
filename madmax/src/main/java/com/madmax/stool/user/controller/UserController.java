package com.madmax.stool.user.controller;

import static com.madmax.stool.common.RenameFactory.getRenamedFileName;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.madmax.stool.user.model.service.UserService;
import com.madmax.stool.user.model.vo.User;

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
	
	
	@RequestMapping("/user/joinUser.do")
	public String joinUser() {
		
		return "user/login/joinUser";
	}
/*	
	@RequestMapping("/user/userEnrollEnd.do")
	public String insertUser(@RequestParam Map param, Model m) {
		
		
//		User u = new User();
//		
		System.out.println("암호화 전 : " + param.get("password"));
//		param.setPassword(encoder.encode(param.getPassword()));
		String pw = (String)param.get("password");
		pw = encoder.encode(pw);
		param.put("password", pw);
		System.out.println("암호화 후 : " + param.get("password"));
		
		
//		logger.debug("유저:"+param);
		
		int result = service.insertUser(param);
		//int result = service.insertUser(u);
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
*/
	
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
		
		
//		String ori=upFile.getOriginalFilename();
//		String rename=getRenamedFileName(ori);
//		param.put("profile", rename);
		
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
	

//	@RequestMapping("/user/checkId")
//	@ResponseBody
//	public int checkId(@RequestParam("userId") String userId) {
//		return ;
//		User u = service.selectUser(userId);
//		boolean flag = u!=null?false:true;
//		if(flag==false) {
//			res.getWriter().write("<span class='ml-2'>"+"<b>"+userId+"</b>"+"은/는 <span style='color:red;'>이미 사용중</span>인 아이디입니다.</span>");
//		}else{
//			res.getWriter().write("<span class='ml-2'>"+"<b>"+userId+"</b>"+"은/는 <span style='color:green;'>사용가능</span>한 아이디입니다.</span>");
//		}
//	}
	
//	@RequestMapping("/user/findIdPw.do")
//	public String findIdPw() {
//		return "user/login/findIdPw";
//	}
//	
//	@RequestMapping("/user/findId.do")
////	@ResponseBody
////	public String findId(@RequestParam("userName") String userName, @RequestParam("phone") String phone) {
//	public String findId(HttpServletRequest req, HttpServletResponse res, Model m) {	
////		String result = service.selectId(userName, phone);
////		return result;
//		String name = req.getParameter("userName");
//		String phone = req.getParameter("phone");
//		HashMap hm = new HashMap();
//		hm.put("userName", name);
//		hm.put("phone", phone);
//		
//		String result = service.selectId(hm);
//		
//		return result;
//	}
//	
//	
//	
////	@RequestMapping("/user/findPw.do")
//	@RequestMapping(value = "/user/findPw.do")
//	public ModelAndView userpassword2(@RequestParam("userId") String userId,
//			@RequestParam("userName") String userName, @RequestParam("phone") String phone,
//			ModelAndView mv) throws Exception {
//
//		Map<String, Object> map = new HashMap<String, Object>();
//
//		map.put("userId", userId);
//		map.put("userName", userName);
//		map.put("phone", phone); // <- 비밀번호를 찾고자 하는 사람의 정보를 DB에서 찾아오고,
//
//		System.out.println("a : " + map);
//
//		User user = service.userpasswordfind(map);
//
//		if (user != null) { // 유저정보를 찾았다면
//
//			String newPwd = FindUtil.getNewPwd();
//
//			Map<String, String> map2 = new HashMap<>();
//
//			map2.put("userId",userId);
//			map2.put("newPwd", newPwd); // DB에서 찾아온 정보를 map2로 담아서
//
//			System.out.println("b ; " + map2);
//
//			service.changePwd(map2);
//
//			String subject = "=임시 비밀번호 발급안내=";
//
//			String msg = "";
//			msg += "<br> <br> <div align='center' style='border:1px solid black;'>";
//			msg += "<h3 style='color: blue';><strong>" + userId + "<br>";
//			msg += "님</strong>의 임시 비밀번호 입니다. 로그인 후 비밀번호를 변경하세요.</h3>";
//			msg += "<p> 임시 비밀번호 : <strong>" + newPwd + "<br> <br> </strong></p></div> ";
//
//			MailUtil.sendMail(phone, subject, msg); // mailutil을 사용해 임시 비밀번호를 메일로 보냅니다.
//
//			mv.setViewName("userpassword2");
//			
//			return mv;
//			
//		} else {
//			int check = 0;
//			mv.addObject("checkSep", check);
//			mv.setViewName("userpasswordfind");
//			return mv;
//		}
//
//	}
	
	
}
