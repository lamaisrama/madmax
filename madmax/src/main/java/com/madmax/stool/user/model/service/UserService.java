package com.madmax.stool.user.model.service;

import com.madmax.stool.user.model.vo.User;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

@Service
public interface UserService {

	
	int insertUser(Map param);

	User selectUser(String userId);

	// id찾기
	User selectId(Map param);

	// pw찾기
	User findPw(Map<String, Object> map);

	int changePw(Map<String, String> map);

	
	
	
	// id찾기
//	String selectId(HashMap hm);
//	ArrayList<String> findId(User u);

	// pw찾기
//	String getPw(Map<String, Object> paramMap);



}
