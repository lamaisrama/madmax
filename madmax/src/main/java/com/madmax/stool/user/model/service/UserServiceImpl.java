package com.madmax.stool.user.model.service;

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
	public int insertUser(User u) {
		return dao.insertUser(session, u);
	}

	
	
	
	
	
}
