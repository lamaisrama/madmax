package com.madmax.stool.project.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface AsidebarDao {

	Map<String, Object> selectProjectMemberNo(SqlSessionTemplate session);

	List<Map<String, Object>> selectProjectMemberList(SqlSessionTemplate session, int pjNo);

	List<Map<String, Object>> selectStoolUser(SqlSessionTemplate session, int pjNo);

}
