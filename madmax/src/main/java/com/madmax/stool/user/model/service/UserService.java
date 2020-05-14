package com.madmax.stool.user.model.service;

import com.madmax.stool.user.model.vo.User;

import org.springframework.stereotype.Service;

@Service
public interface UserService {

	int insertUser(User u);

}
