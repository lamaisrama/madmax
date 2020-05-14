package com.madmax.stool.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.user.model.vo.User;

public interface UserDao {

	int insertUser(SqlSessionTemplate session, User u);

}
