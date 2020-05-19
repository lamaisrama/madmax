package com.madmax.stool.project.model.service;

import java.util.List;

import com.madmax.stool.project.model.vo.Attachment;
import com.madmax.stool.project.model.vo.InsertHashTag;
import com.madmax.stool.project.model.vo.InsertNotification;
import com.madmax.stool.project.model.vo.InsertProjectBoard;
import com.madmax.stool.project.model.vo.InsertSchedule;
import com.madmax.stool.project.model.vo.InsertTask;
import com.madmax.stool.project.model.vo.InsertTaskManager;
import com.madmax.stool.project.model.vo.InsertWriting;
import com.madmax.stool.project.model.vo.ProjectMember;

public interface SelectedProjectInsertService {

	List<ProjectMember> selectProjectMemberList(int pjNo);

	int insertWriting(InsertWriting writing, InsertProjectBoard pb, List<InsertHashTag> hashTagList, List<InsertNotification> notList,
					List<Attachment> files);

	int insertTask(InsertTask task, InsertProjectBoard pb, List<InsertHashTag> hashTagList,
			List<InsertNotification> notList, List<InsertTaskManager> tmList, List<Attachment> files);

	int insertSchedule(InsertSchedule schedule, InsertProjectBoard pb, List<InsertHashTag> hashTagList,
			List<InsertNotification> notList);


}
