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
import com.madmax.stool.project.model.vo.InsertSchedule;
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
	@Transactional //트랜젝션처리!살려주세요~~~~~~~~~~~~~~~
	public int insertWriting(InsertWriting writing, InsertProjectBoard pb, List<InsertHashTag> hashTagList, List<InsertNotification> notList,
			List<Attachment> files) throws MyException {
		//1. ProjectBoard TB
		int result = dao.insertProjectBoardTB(session, pb);		
		
		//2-1. Writing TB - 총괄번호
		if(result == 0) {
//			throw new RuntimeException("ProjectBoard 삽입에러!");
			throw new MyException("ProjectBoard 삽입에러!");
		}
		
		if(result != 0){
			writing.setBoardNo(pb.getBoardNo());
			result = dao.insertWritingTB(session, writing);
			
			if(result==0) {
				throw new MyException("WritingTB 삽입에러!");
			}
		}
		
		//2-2. hashTag TB - 총괄번호
		if(!hashTagList.isEmpty()){
			for(InsertHashTag t : hashTagList) {
				t.setBoardNo(pb.getBoardNo());
				result = dao.insertHashTagTB(session, t);
				if(result==0) {
					throw new MyException("HashTagTB 삽입에러!");
				}
			}
		}
		
		//2-3. notification TB - 총괄번호
		if(!notList.isEmpty()){
			for(InsertNotification n : notList) {
				n.setBoardNo(pb.getBoardNo());
				result = dao.insertNotificationTB(session, n);
				if(result==0) {
					throw new MyException("NotificationTB 삽입에러!");
				}
			}
		}
		
		//3-1. writingAttachment TB - 글번호
		if(!files.isEmpty()) {
			for(Attachment a : files) {
				a.setNo(writing.getWritingNo());
				result = dao.insertWritingAttachmentTB(session, a);
				if(result==0) {
					throw new MyException("WritingAttachmentTB 삽입에러!");
				}
			}
		}
		
		//4. 프로젝트의 파일 - 프로젝트번호
		if(!files.isEmpty()) {
			for(Attachment a : files) {
				ProjectFile pf = new ProjectFile();		
				pf.setProjectNo(pb.getProjectNo());
				pf.setPjFileOriname(a.getOriginalFilename());
				pf.setPjFileRenamedname(a.getRenamedFilename());

				result = dao.insertProjectFileTB(session, pf);				
				if(result==0) {
					throw new MyException("ProjectFileTB 삽입에러!");
				}
			}
		}
		
		
		return result;
	}

	@Override
	@Transactional //트랜젝션처리!
	public int insertTask(InsertTask task, InsertProjectBoard pb, List<InsertHashTag> hashTagList,
			List<InsertNotification> notList, List<InsertTaskManager> tmList, List<Attachment> files) throws MyException {
		//1. ProjectBoard TB
		int result = dao.insertProjectBoardTB(session, pb);		
		
		//2-1. task TB - 총괄번호
		if(result == 0) {
			throw new MyException("ProjectBoard 삽입에러!");
		}
		if(result != 0){
			task.setBoardNo(pb.getBoardNo());
			result = dao.insertTaskTB(session, task);
			if(result==0) {
				throw new MyException("TaskTB 삽입에러!");
			}
		}
		
		//2-2. hashTag TB - 총괄번호
		if(!hashTagList.isEmpty()){
			for(InsertHashTag t : hashTagList) {
				t.setBoardNo(pb.getBoardNo());
				result = dao.insertHashTagTB(session, t);
				if(result==0) {
					throw new MyException("HashTagTB 삽입에러!");
				}
			}
		}
		
		//2-3. notification TB - 총괄번호
		if(!notList.isEmpty()){
			for(InsertNotification n : notList) {
				n.setBoardNo(pb.getBoardNo());
				result = dao.insertNotificationTB(session, n);
				if(result==0) {
					throw new MyException("NotificationTB 삽입에러!");
				}
			}
		}
		
		//3-1. taskAttachment TB - 글번호
		if(!files.isEmpty()) {
			for(Attachment a : files) {
				a.setNo(task.getTaskNo());
				result = dao.insertTaskAttachmentTB(session, a);				
				if(result==0) {
					throw new MyException("TaskAttachmentTB 삽입에러!");
				}
			}
		}
		
		//3-2. taskManager TB - 글번호
		if(!tmList.isEmpty()) {
			for(InsertTaskManager itm : tmList) {
				itm.setTaskNo(task.getTaskNo());
				result = dao.insertTaskManagerTB(session, itm);			
				if(result==0) {
					throw new MyException("TaskManagerTB 삽입에러!");
				}
			}
		}
		
		//4. 프로젝트의 파일 - 프로젝트번호
		if(!files.isEmpty()) {
			for(Attachment a : files) {
				ProjectFile pf = new ProjectFile();		
				pf.setProjectNo(pb.getProjectNo());
				pf.setPjFileOriname(a.getOriginalFilename());
				pf.setPjFileRenamedname(a.getRenamedFilename());

				result = dao.insertProjectFileTB(session, pf);		
				if(result==0) {
					throw new MyException("ProjectFileTB 삽입에러!");
				}
			}
		}
		
		
		return result;
	}

	
	@Override
	@Transactional
	public int insertSchedule(InsertSchedule schedule, InsertProjectBoard pb, List<InsertHashTag> hashTagList,
			List<InsertNotification> notList)  throws MyException {
		//1. ProjectBoard TB
		int result = dao.insertProjectBoardTB(session, pb);	

		//2-1. Schedule TB - 총괄번호
		if(result == 0) {
			throw new MyException("ProjectBoard 삽입에러!");
		}
		if(result != 0){
			schedule.setBoardNo(pb.getBoardNo());
			result = dao.insertScheduleTB(session, schedule);
			if(result==0) {
				throw new MyException("ScheduleTB 삽입에러!");
			}
		}
		
		//2-2. hashTag TB - 총괄번호
		if(!hashTagList.isEmpty()){
			for(InsertHashTag t : hashTagList) {
				t.setBoardNo(pb.getBoardNo());
				result = dao.insertHashTagTB(session, t);
				if(result==0) {
					throw new MyException("HashTagTB 삽입에러!");
				}
			}
		}
		
		//2-3. notification TB - 총괄번호
		if(!notList.isEmpty()){
			for(InsertNotification n : notList) {
				n.setBoardNo(pb.getBoardNo());
				result = dao.insertNotificationTB(session, n);
				if(result==0) {
					throw new MyException("NotificationTB 삽입에러!");
				}
			}
		}
		
		
		return result;
	}

}
