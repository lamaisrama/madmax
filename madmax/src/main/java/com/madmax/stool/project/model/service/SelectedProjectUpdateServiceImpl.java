package com.madmax.stool.project.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.madmax.stool.common.MyException;
import com.madmax.stool.project.model.dao.SelectedProjectUpdateDao;
import com.madmax.stool.project.model.vo.Attachment;
import com.madmax.stool.project.model.vo.InsertHashTag;
import com.madmax.stool.project.model.vo.InsertNotification;
import com.madmax.stool.project.model.vo.InsertProjectBoard;
import com.madmax.stool.project.model.vo.InsertTask;
import com.madmax.stool.project.model.vo.InsertTaskManager;
import com.madmax.stool.project.model.vo.InsertWriting;
import com.madmax.stool.project.model.vo.ProjectFile;


@Service
public class SelectedProjectUpdateServiceImpl implements SelectedProjectUpdateService {

	@Autowired
	private SelectedProjectUpdateDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int deleteFavorite(Map<String, Object> pjInfo) {
		return dao.deleteFavorite(session, pjInfo);
	}

	@Override
	public int insertFavorite(Map<String, Object> pjInfo) {
		return dao.insertFavorite(session, pjInfo);
	}

	@Override
	public int updateProjectColor(Map<String, Object> pjInfo) {
		return dao.updateProjectColor(session, pjInfo);
	}

	@Override
	public int deleteProjectMember(Map<String, Object> pjInfo) {
		return dao.deleteProjectMember(session, pjInfo);
	}

	@Override
	@Transactional
	public int updateProjectManager(Map<String, Object> pjInfo) {
		int result = dao.updateProjectManager(session, pjInfo);
		if(result == 0) {
			throw new MyException("PROJECTTABLE UPDATE에러!");
		}
		
		if(result != 0){
			result = dao.deleteProjectMember(session, pjInfo);	
			if(result==0) {
				throw new MyException("PROJECTMEMBER DELETE에러!");
			}
		}
		return result;
	}

	@Override
	public int updateSelectedProject(Map<String, Object> upMap) {
		return dao.updateSelectedProject(session, upMap);
	}

	@Override
	public int insertBookmark(Map<String, Object> bInfo) {
		return dao.insertBookmark(session, bInfo);
	}

	@Override
	public int deleteBookmark(Map<String, Object> bInfo) {
		return dao.deleteBookmark(session, bInfo);
	}

	@Override
	public int updatePinPost(Map<String, Object> pjInfo) {
		return dao.updatePinPost(session, pjInfo);
	}

	@Override
	@Transactional
	public int insertComment(Map<String, Object> cMap) {
		int result =  dao.insertComment(session, cMap);
		if(result == 0) {
			throw new MyException("COMMENT INSERT에러!");
		}
		
		String receiveId = (String) cMap.get("receiveId");
		String senderId = (String) cMap.get("senderId");
		
		
		if(result != 0 && !(receiveId.equals(senderId)) ){
			result = dao.insertCommentNotification(session, cMap);	
			if(result==0) {
				throw new MyException("NOTIFICATION INSERT에러!");
			}
		}
		return result;
	}

	@Override
	public int updateComment(Map<String, Object> cMap) {
		return dao.updateComment(session, cMap);
	}

	@Override
	public int deleteComment(Map<String, Object> cMap) { 
		return dao.deleteComment(session, cMap);
	}

	@Override
	public int updateProjectBoardStatus(Map<String, Object> pbMap) {
		return dao.updateProjectBoardStatus(session, pbMap);
	}

	@Override
	public List<Attachment> selectOrifiles(Map<String, Object> pInfo) {
		return dao.selectOrifiles(session, pInfo);
	}

	@Override
	@Transactional
	public int updateWriting(InsertWriting writing, InsertProjectBoard pb, List<InsertNotification> deleteNotList,
			List<InsertNotification> newNotList, List<InsertHashTag> deleteTagList, List<InsertHashTag> newTagList,
			List<Attachment> oriFiles, List<Attachment> newFiles, Map<String, Object> pInfo) throws MyException {
		
		//1. 글 수정
		int result = dao.updateWriting(session, writing);
		if(result == 0) {
			throw new MyException("updateWriting 에러!");
		}
		
		//2. 해시태그
		//2-1) 해시태그 삭제
		if(!deleteTagList.isEmpty()){
			for(InsertHashTag t : deleteTagList) {
				result = dao.deleteHashTag(session, t);
				if(result==0) {
					throw new MyException("deleteHashTag 에러!");
				}
			}
		}
		//2-2) 해시태그 등록
		if(!newTagList.isEmpty()){
			for(InsertHashTag t : newTagList) {
				result = dao.insertHashTag(session, t);
				if(result==0) {
					throw new MyException("insertHashTag 에러!");
				}
			}
		}
		
		//3. 언급
		//3-1) 언급 삭제
		if(!deleteNotList.isEmpty()){
			for(InsertNotification n : deleteNotList) {
				result = dao.deleteNotificationTB(session, n);
				if(result==0) {
					throw new MyException("deleteNotification 에러!");
				}
			}
		}		
		//3-2) 언급 등록 (추가)
		if(!newNotList.isEmpty()){
			for(InsertNotification n : newNotList) {
				result = dao.insertNotificationTB(session, n);
				if(result==0) {
					throw new MyException("insertNotification 에러!");
				}
			}
		}		
		
		
		//4.파일		
		//newFiles가 있어야지만 추가&삭제
		int postNo = (int) pInfo.get("postNo");
		int pjNo = (int) pInfo.get("pjNo");
		if(!newFiles.isEmpty()) {
			//4-1. 새로운파일 추가 - ProjectFile
			for(Attachment a : newFiles) {
				ProjectFile pj = new ProjectFile();
				pj.setProjectNo(pjNo);
				pj.setPjFileOriname(a.getOriginalFilename());
				pj.setPjFileRenamedname(a.getRenamedFilename());
				
				result = dao.insertProjectFileTB(session, pj);				
				if(result==0) {
					throw new MyException("insertWritingAttachment 에러!");
				}
			}
			//4-2. 새로운파일 추가 - Attachmet
			for(Attachment a : newFiles) {
				a.setNo(postNo);
				result = dao.insertWritingAttachmentTB(session, a);				
				if(result==0) {
					throw new MyException("insertWritingAttachment 에러!");
				}
			}
			
			//4-3. 원래파일 삭제 - ProjectFile
			for(Attachment a : oriFiles) {
				Map<String, Object> pjFileMap = new HashMap();
				pjFileMap.put("pjNo", pInfo.get("pjNo"));
				pjFileMap.put("oriName", a.getOriginalFilename());
				pjFileMap.put("reName", a.getRenamedFilename());				
				
				result = dao.deleteProjectFile(session, pjFileMap);				
				if(result==0) {
					throw new MyException("deleteProjectFile 에러!");
				}
			}
			
			//4-4. 원래파일 삭제 - Attachmet
			for(Attachment a : oriFiles) {		
				result = dao.deleteWritingAttachmentTB(session, a);			
				if(result==0) {
					throw new MyException("deleteAttachment 에러!");
				}
			}
			
		}		
		
		return result;
	}

	@Override
	@Transactional
	public int updateTask(InsertTask task, InsertProjectBoard pb, List<InsertNotification> deleteNotList,
			List<InsertNotification> newNotList, List<InsertHashTag> deleteTagList, List<InsertHashTag> newTagList,
			List<Attachment> oriFiles, List<Attachment> newFiles, Map<String, Object> pInfo,
			List<InsertTaskManager> deleteTMList, List<InsertTaskManager> newTMList) {

		//1. 업무 수정
		int result = dao.updateTask(session, task);
		if(result == 0) {
			throw new MyException("updateTask 에러!");
		}
		
		//1-2. 업무 담당자 수정
		//3-1) 언급 삭제
		if(!deleteTMList.isEmpty()){
			for(InsertTaskManager tm : deleteTMList) {
				result = dao.deleteTaskManager(session, tm);
				if(result==0) {
					throw new MyException("deleteTaskManager 에러!");
				}
			}
		}		
		//3-2) 언급 등록 (추가)
		if(!newTMList.isEmpty()){
			for(InsertTaskManager tm : newTMList) {
				result = dao.insertTaskManager(session, tm);
				if(result==0) {
					throw new MyException("insertTaskManager 에러!");
				}
			}
		}			
		
		//2. 해시태그
		//2-1) 해시태그 삭제
		if(!deleteTagList.isEmpty()){
			for(InsertHashTag t : deleteTagList) {
				result = dao.deleteHashTag(session, t);
				if(result==0) {
					throw new MyException("deleteHashTag 에러!");
				}
			}
		}
		//2-2) 해시태그 등록
		if(!newTagList.isEmpty()){
			for(InsertHashTag t : newTagList) {
				result = dao.insertHashTag(session, t);
				if(result==0) {
					throw new MyException("insertHashTag 에러!");
				}
			}
		}
		
		//3. 언급
		//3-1) 언급 삭제
		if(!deleteNotList.isEmpty()){
			for(InsertNotification n : deleteNotList) {
				result = dao.deleteNotificationTB(session, n);
				if(result==0) {
					throw new MyException("deleteNotification 에러!");
				}
			}
		}		
		//3-2) 언급 등록 (추가)
		if(!newNotList.isEmpty()){
			for(InsertNotification n : newNotList) {
				result = dao.insertNotificationTB(session, n);
				if(result==0) {
					throw new MyException("insertNotification 에러!");
				}
			}
		}		
		
		
		//4.파일		
		//newFiles가 있어야지만 추가&삭제
		int postNo = (int) pInfo.get("postNo");
		int pjNo = (int) pInfo.get("pjNo");
		if(!newFiles.isEmpty()) {
			//4-1. 새로운파일 추가 - ProjectFile
			for(Attachment a : newFiles) {
				ProjectFile pj = new ProjectFile();
				pj.setProjectNo(pjNo);
				pj.setPjFileOriname(a.getOriginalFilename());
				pj.setPjFileRenamedname(a.getRenamedFilename());
				
				result = dao.insertProjectFileTB(session, pj);				
				if(result==0) {
					throw new MyException("insertWritingAttachment 에러!");
				}
			}
			//4-2. 새로운파일 추가 - Attachmet
			for(Attachment a : newFiles) {
				a.setNo(postNo);
				result = dao.insertTaskAttachmentTB(session, a);				
				if(result==0) {
					throw new MyException("insertTaskAttachment 에러!");
				}
			}
			
			//4-3. 원래파일 삭제 - ProjectFile
			for(Attachment a : oriFiles) {
				Map<String, Object> pjFileMap = new HashMap();
				pjFileMap.put("pjNo", pInfo.get("pjNo"));
				pjFileMap.put("oriName", a.getOriginalFilename());
				pjFileMap.put("reName", a.getRenamedFilename());				
				
				result = dao.deleteProjectFile(session, pjFileMap);				
				if(result==0) {
					throw new MyException("deleteProjectFile 에러!");
				}
			}
			
			//4-4. 원래파일 삭제 - Attachmet
			for(Attachment a : oriFiles) {		
				result = dao.deleteTaskAttachmentTB(session, a);			
				if(result==0) {
					throw new MyException("deleteTaskAttachment 에러!");
				}
			}
			
		}		
		
		return result;
	}
	

}
