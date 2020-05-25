package com.madmax.stool.project.model.service;

import java.util.List;
import java.util.Map;

import com.madmax.stool.project.model.vo.Project;

public interface ProjectService {

	int insertProject(Project p);

	List<Project> selectProjectList(String id, int cPage, int numPerpage);

	List<String> selectProjectMembers(int pNo);

	int selectProjectCount(String id);

	List<Project> selectComProjectList(String id, int cPage, int numPerpage);

	int selectComProjectCount(String id);



}
