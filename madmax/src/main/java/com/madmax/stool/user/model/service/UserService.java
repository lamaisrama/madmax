package com.madmax.stool.user.model.service;

import com.madmax.stool.user.model.vo.User;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface UserService {

	
	int insertUser(Map param);

	User selectUser(String userId);

	// id찾기
	String selectId(HashMap hm);



}
