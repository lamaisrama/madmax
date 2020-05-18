package com.madmax.stool.user.model.service;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.madmax.stool.user.model.dao.UserDao;
import com.madmax.stool.user.model.vo.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao dao;
	
	@Autowired
	SqlSessionTemplate session;


	@Override
	public int insertUser(Map param) {
		// TODO Auto-generated method stub
		return dao.insertUser(session, param);
	}
		
	@Override
	public User selectUser(String userId) {
		
		return dao.selectUser(session, userId);
	}

	@Override
	public String selectId(HashMap hm) {

		return dao.selectId(session, hm);
	}

//	@Override
//	public String selectId(String userName, String phone) {
//		
//		return dao.selectId(session, userName, phone);
//	}
	
	

	
	
	
	
	
}
