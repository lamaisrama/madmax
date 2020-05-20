package com.madmax.stool.project.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SelectedProjectSelectDaoImpl implements SelectedProjectSelectDao {

	@Override
	public List<Map<String, Object>> selectProjectBoard(SqlSessionTemplate session, int pjNo) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectProjectBoard",pjNo);
	}

	@Override
	public List<Map<String, Object>> selectWritingList(SqlSessionTemplate session, int pjNo) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectWritingList",pjNo);
	}

	@Override
	public List<Map<String, Object>> selectTaskList(SqlSessionTemplate session, int pjNo) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectTaskList",pjNo);
	}

	@Override
	public List<Map<String, Object>> selectScheduleList(SqlSessionTemplate session, int pjNo) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectScheduleList",pjNo);
	}

	
}
