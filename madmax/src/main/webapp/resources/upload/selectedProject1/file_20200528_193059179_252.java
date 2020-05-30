package com.kh.spring.member.controller;

import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;

//@Component
@Controller
@SessionAttributes({"loginMember"})
public class MemberController {
	//log4j를 이용하여 로그 남기기
	//1. log4j객체를 생성. -> Logger(slf4j)
	
	//private Logger logger=LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private Logger logger;
	
	
	@Autowired
	@Qualifier("real")
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder encoder;//비밀번호 암호화처리객체
	
	
	@RequestMapping("/member/insertMember.do")
	public String insertMember() {
		return "member/memberEnroll";
	}
	@RequestMapping("/member/memberEnrollEnd.do")
	public String insertMember(Member m, Model model) {
		
		//비밀번호 암호화하기
		//비밀번호 단방향 암호화는 BCryptPasswordEncoder객체를 이용
		// 암호화 : encode매소드를 이용
		
		System.out.println("암호화 전 : "+m.getPassword());
		m.setPassword(encoder.encode(m.getPassword()));
		System.out.println("암호화 후 : "+m.getPassword());
		
		int result=service.insertMember(m);
		
		String page="";
		
		if(result==0) {
			page="common/msg";
			model.addAttribute("msg","회원가입실패");
			model.addAttribute("loc","/member/insertMember.do");
		}else {
			page="redirect:/";
		}
		//return "redirect:/";// /WEB-INF/views//.jsp
		return page;
		
	}
	
	@RequestMapping("/member/memberLogin.do")
	public String login(String userId, String password, 
			Model m, HttpSession session) {
		
		//로그 출력하기!
		logger.debug(""+session);
		logger.debug("이건 디버그");
		logger.info("이건 info");
		logger.warn("이건 warn");
		logger.error("이건 error");
		
		
		Member login=service.selectMember(userId);
		//로그인여부 확인하기
		//if(login!=null&&login.getPassword().equals(password)) {
		/* 암호화된 값을 비교하기 위해서는 matches메소드를 이용 */
		if(login!=null&&encoder.matches(password, login.getPassword())) {
			//로그인 성공
			m.addAttribute("msg","로그인 성공");
			//로그인 유지하기 위해 객체저장
			//model에 저장되어있는 객체를 Session범위로 확장하기
			//SessionAttributes어노테이션을 이용
			m.addAttribute("loginMember",login);
			//session.setAttribute("loginMember", login);
		}else {
			//로그인 실패
			m.addAttribute("msg","로그인 실패");
		}
		
		m.addAttribute("loc","/");
		
		return "common/msg";
	}
	
	
	@RequestMapping("/member/logout.do")
	public String logout(SessionStatus status,HttpSession session) {
		
		if(!status.isComplete()) {
			status.setComplete();//로그아웃
		}
		
		//session.invalidate();
		
		return "redirect:/";
	}
	//outputStream으로 처리하기
	@RequestMapping("/member/checkId")
	public void checkId(String userId, ServletOutputStream out) {
		Member m=service.selectMember(userId);
		boolean flag=m!=null?false:true;
		try {
			out.print(flag);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
}




