package com.madmax.stool.user.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.user.model.vo.User;

public interface UserDao {

	int insertUser(SqlSessionTemplate session, Map param);

	User selectUser(SqlSessionTemplate session, String userId);

	// id찾기
	User selectId(SqlSessionTemplate session, Map param);

	// pw찾기
	User findPw(SqlSessionTemplate session, Map<String, Object> map);


	int changePw(SqlSessionTemplate session, Map<String, String> map);



}
