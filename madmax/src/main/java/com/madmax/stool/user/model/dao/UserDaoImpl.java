package com.madmax.stool.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.user.model.vo.User;

@Repository
public class UserDaoImpl implements UserDao {

	@Override
	public int insertUser(SqlSessionTemplate session, User u) {
	
		return session.insert("user/insertUser", u);
	}

	
	
}
