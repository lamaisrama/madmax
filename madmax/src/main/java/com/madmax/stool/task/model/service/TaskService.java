package com.madmax.stool.task.model.service;

import java.util.List;

import com.madmax.stool.project.model.vo.Project;
import com.madmax.stool.task.model.vo.NotiMember;
import com.madmax.stool.task.model.vo.TaskFilter;
import com.madmax.stool.task.model.vo.TaskPb;


public interface TaskService {



	List<Project> selectProject(String id);

	List<TaskPb> selectTaskEach(int no);

	List<TaskPb> selectTaskFilter(TaskFilter tf);

	TaskPb selectTaskView(int boardNo);

	List<NotiMember> selectTaskNoti(int boardNo);

}
