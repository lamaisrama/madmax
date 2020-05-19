package com.madmax.stool.user.model.dao;

import java.util.HashMap;
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


	@Override
	public String selectId(SqlSessionTemplate session, HashMap hm) {

		return session.selectOne("user.selectId", hm);
	}



//	@Override
//	public String selectId(SqlSessionTemplate session, String userName, String phone) {
//		
//		return session.selectOne("user.selectId", userName, phone);
//	}

	
	
}
