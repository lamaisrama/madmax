package com.madmax.stool.project.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.project.model.vo.AllAttachment;

public interface AsidebarDao {

	int selectMemberCount(SqlSessionTemplate session, int pjNo);


}
