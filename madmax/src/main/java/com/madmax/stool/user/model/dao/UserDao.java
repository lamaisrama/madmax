package com.madmax.stool.user.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.user.model.vo.User;

public interface UserDao {

	int insertUser(SqlSessionTemplate session, Map param);

	User selectUser(SqlSessionTemplate session, String userId);

	// id찾기
//	String selectId(SqlSessionTemplate session, String userName, String phone);
	String selectId(SqlSessionTemplate session, HashMap hm);



}
