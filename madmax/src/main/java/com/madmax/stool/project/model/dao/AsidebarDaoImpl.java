package com.madmax.stool.project.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AsidebarDaoImpl implements AsidebarDao {

	@Override
	public Map<String, Object> selectProjectMemberNo(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("aside.selectProjectMemberNo");
	}

	@Override
	public List<Map<String, Object>> selectProjectMemberList(SqlSessionTemplate session, int pjNo) {
		// TODO Auto-generated method stub
		return session.selectList("aside.selectProjectMemberList");
	}

	@Override
	public List<Map<String, Object>> selectStoolUser(SqlSessionTemplate session, int pjNo) {
		// TODO Auto-generated method stub
		return session.selectList("aside.selectStoolUser");
	}

	
	
}
