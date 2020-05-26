package com.madmax.stool.project.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.project.model.vo.AllAttachment;

@Repository
public class AsidebarDaoImpl implements AsidebarDao {

	@Override
	public int selectMemberCount(SqlSessionTemplate session,int pjNo) {
		return session.selectOne("aside.selectMemberCount",pjNo);
	}



	
	
	
	
}
