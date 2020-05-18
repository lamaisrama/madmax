package com.madmax.stool.project.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.project.model.vo.ProjectMember;

@Repository
public class SelectedProjectInsertDaoImpl implements SelectedProjectInsertDao {

	@Override
	public List<ProjectMember> selectProjectMemberList(SqlSessionTemplate session, int pjNo) {
		return session.selectList("SelectedProject.selectProjectMemberList", pjNo);
	}

}
