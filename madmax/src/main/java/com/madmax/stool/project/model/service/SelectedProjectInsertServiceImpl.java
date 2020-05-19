package com.madmax.stool.project.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.madmax.stool.common.MyException;
import com.madmax.stool.project.model.dao.SelectedProjectInsertDao;
import com.madmax.stool.project.model.vo.Attachment;
import com.madmax.stool.project.model.vo.InsertHashTag;
import com.madmax.stool.project.model.vo.InsertNotification;
import com.madmax.stool.project.model.vo.InsertProjectBoard;
import com.madmax.stool.project.model.vo.InsertTask;
import com.madmax.stool.project.model.vo.InsertTaskManager;
import com.madmax.stool.project.model.vo.InsertWriting;
import com.madmax.stool.project.model.vo.ProjectFile;
import com.madmax.stool.project.model.vo.ProjectMember;

@Service
public class SelectedProjectInsertServiceImpl implements SelectedProjectInsertService {

	@Autowired
	private SelectedProjectInsertDao dao;

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<ProjectMember> selectProjectMemberList(int pjNo) {
		return dao.selectProjectMemberList(session, pjNo);
	}

	@Override
	@Transactional //트랜젝션처리!
	public int insertWriting(InsertWriting writing, InsertProjectBoard pb, List<InsertHashTag> hashTagList, List<InsertNotification> notList,
			List<Attachment> files) {
		//1. ProjectBoard TB
		int result = dao.insertProjectBoardTB(session, pb);		

		//2-1. Writing TB - 총괄번호
		if(result == 0) {
			throw new MyException("ProjectBoard 삽입에러!");
		}else{
			writing.setBoardNo(pb.getBoardNo());
			result = dao.insertWritingTB(session, writing);
		}
		
		//2-2. hashTag TB - 총괄번호
		if(result == 0) {
			throw new MyException("ProjectBoard 삽입에러!");
		}else if(!hashTagList.isEmpty()){
			for(InsertHashTag t : hashTagList) {
				t.setBoardNo(pb.getBoardNo());
				result = dao.insertHashTagTB(session, t);
			}
		}
		
		//2-3. notification TB - 총괄번호
		if(result == 0) {
			throw new MyException("ProjectBoard 삽입에러!");
		}else if(!notList.isEmpty()){
			for(InsertNotification n : notList) {
				n.setBoardNo(pb.getBoardNo());
				result = dao.InsertNotificationTB(session, n);
			}
		}
		
		//3-1. writingAttachment TB - 글번호
		if(result == 0) {
			throw new MyException("board삽입에러!");
		}
		if(!files.isEmpty()) {
			for(Attachment a : files) {
				a.setNo(writing.getWritingNo());
				result = dao.insertWritingAttachmentTB(session, a);
			}
		}
		
		//4. 프로젝트의 파일 - 프로젝트번호
		if(result == 0) {
			throw new MyException("board삽입에러!");
		}
		if(!files.isEmpty()) {
			for(Attachment a : files) {
				ProjectFile pf = new ProjectFile();		
				pf.setProjectNo(pb.getProjectNo());
				pf.setPjFileOriname(a.getOriginalFilename());
				pf.setPjFileRenamedname(a.getRenamedFilename());

				result = dao.insertProjectFileTB(session, pf);
			}
		}
		
		
		return 0;
	}

	@Override
	public int insertTask(InsertTask task, InsertProjectBoard pb, List<InsertHashTag> hashTagList,
			List<InsertNotification> notList, List<InsertTaskManager> tmList, List<Attachment> files) {
		//1. ProjectBoard TB
		int result = dao.insertProjectBoardTB(session, pb);		

		//2-1. task TB - 총괄번호
		if(result == 0) {
			throw new MyException("ProjectBoard 삽입에러!");
		}else{
			task.setBoardNo(pb.getBoardNo());
			result = dao.insertTaskTB(session, task);
		}
		
		//2-2. hashTag TB - 총괄번호
		if(result == 0) {
			throw new MyException("ProjectBoard 삽입에러!");
		}else if(!hashTagList.isEmpty()){
			for(InsertHashTag t : hashTagList) {
				t.setBoardNo(pb.getBoardNo());
				result = dao.insertHashTagTB(session, t);
			}
		}
		
		//2-3. notification TB - 총괄번호
		if(result == 0) {
			throw new MyException("ProjectBoard 삽입에러!");
		}else if(!notList.isEmpty()){
			for(InsertNotification n : notList) {
				n.setBoardNo(pb.getBoardNo());
				result = dao.InsertNotificationTB(session, n);
			}
		}
		
		//3-1. taskAttachment TB - 글번호
		if(result == 0) {
			throw new MyException("board삽입에러!");
		}
		if(!files.isEmpty()) {
			for(Attachment a : files) {
				a.setNo(task.getTaskNo());
				result = dao.insertTaskAttachmentTB(session, a);
			}
		}
		
		//3-2. taskManager TB - 글번호
		if(result == 0) {
			throw new MyException("board삽입에러!");
		}
		if(!files.isEmpty()) {
			for(InsertTaskManager itm : tmList) {
				itm.setTaskNo(task.getTaskNo());
				result = dao.insertTaskManagerTB(session, itm);
			}
		}
		
		//4. 프로젝트의 파일 - 프로젝트번호
		if(result == 0) {
			throw new MyException("board삽입에러!");
		}
		if(!files.isEmpty()) {
			for(Attachment a : files) {
				ProjectFile pf = new ProjectFile();		
				pf.setProjectNo(pb.getProjectNo());
				pf.setPjFileOriname(a.getOriginalFilename());
				pf.setPjFileRenamedname(a.getRenamedFilename());

				result = dao.insertProjectFileTB(session, pf);
			}
		}
		
		
		return 0;
	}

}
