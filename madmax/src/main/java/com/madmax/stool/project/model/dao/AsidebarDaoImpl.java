package com.madmax.stool.project.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.project.model.vo.AllAttachment;
import com.madmax.stool.project.model.vo.InsertProjectMember;

@Repository
public class AsidebarDaoImpl implements AsidebarDao {

	@Override
	public int selectMemberCount(SqlSessionTemplate session,int pjNo) {
		return session.selectOne("aside.selectMemberCount",pjNo);
	}

	@Override
	public int insertProjectMember(SqlSessionTemplate session, Map<String, Object> map) {
		return session.insert("aside.insertProjectMember",map);
	}

	@Override
	public int checkPjMember(SqlSessionTemplate session, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectOne("aside.checkPjMember",map);
	}

	
	

	
	
	
	
}
