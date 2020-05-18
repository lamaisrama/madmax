package com.madmax.stool.project.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.project.model.vo.ProjectMember;

public interface SelectedProjectInsertDao {

	List<ProjectMember> selectProjectMemberList(SqlSessionTemplate session, int pjNo);

}
