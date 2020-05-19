package com.madmax.stool.project.model.service;

import java.util.List;

import com.madmax.stool.project.model.vo.Attachment;
import com.madmax.stool.project.model.vo.InsertHashTag;
import com.madmax.stool.project.model.vo.InsertNotification;
import com.madmax.stool.project.model.vo.InsertProjectBoard;
import com.madmax.stool.project.model.vo.InsertWriting;
import com.madmax.stool.project.model.vo.ProjectMember;

public interface SelectedProjectInsertService {

	List<ProjectMember> selectProjectMemberList(int pjNo);

	int insertWriting(InsertWriting writing, InsertProjectBoard pb, List<InsertHashTag> hashTagList, List<InsertNotification> notList,
					List<Attachment> files);


}
