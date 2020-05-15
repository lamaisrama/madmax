package com.madmax.stool.user.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.user.model.vo.User;

@Repository
public class UserDaoImpl implements UserDao {

	@Override
	public int insertUser(SqlSessionTemplate session, Map param) {
	
		return session.insert("user.insertUser", param);
	}

	@Override
	public User selectUser(SqlSessionTemplate session, String userId) {
		
		return session.selectOne("user.selectUser", userId);
	}

	
	
}
