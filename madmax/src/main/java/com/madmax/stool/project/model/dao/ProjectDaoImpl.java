package com.madmax.stool.project.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.project.model.vo.Favorite;
import com.madmax.stool.project.model.vo.Project;

@Repository
public class ProjectDaoImpl implements ProjectDao {

	@Override
	public int insertProject(SqlSessionTemplate session, Project p) {
		// TODO Auto-generated method stub
		return session.insert("project.insertProject", p);
	}

	@Override
	public int insertProjectMember(SqlSessionTemplate session,Project p) {
		// TODO Auto-generated method stub
		return session.insert("project.insertProjectMember", p);
	}

	@Override
	public List<Project> selectProjectList(SqlSessionTemplate session, String id,int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		
		return session.selectList("project.selectProjectList",id,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public List<String> selectProjectMembers(SqlSessionTemplate session, int pNo) {
		// TODO Auto-generated method stub
		return session.selectList("project.selectProjectMembers",pNo);
	}

	@Override
	public int selectProjectCount(SqlSessionTemplate session, String id) {
		// TODO Auto-generated method stub
		return session.selectOne("project.selectProjectCount",id);
	}

	@Override
	public List<Project> selectComProjectList(SqlSessionTemplate session, String id, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return  session.selectList("project.selectComProjectList",id,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int selectComProjectCount(SqlSessionTemplate session, String id) {
		// TODO Auto-generated method stub
		return  session.selectOne("project.selectComProjectCount",id);
	}

	@Override
	public List<Favorite> selectFavorite(SqlSessionTemplate session,String id) {
		
		return session.selectList("project.selectFavorite",id);
	}

	@Override
	public int selectFavoriteCount(SqlSessionTemplate session,String id) {
		
		return session.selectOne("project.selectFavoriteCount",id);
	}

	
	
	

}
