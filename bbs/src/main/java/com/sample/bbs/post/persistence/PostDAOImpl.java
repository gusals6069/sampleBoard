package com.sample.bbs.post.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sample.bbs.post.domain.CategoryVo;
import com.sample.bbs.post.domain.PostVo;

@Repository
public class PostDAOImpl implements PostDAO {
	
	private static final String NAMESPACE = "com.sample.bbs.mappers.post.PostMapper";
	private SqlSession sqlSession;
	
	@Inject
	public void setSqlSession(SqlSession sqlSession) {
	   this.sqlSession = sqlSession;
	}
	
	@Override
	public void create(PostVo postVo) throws Exception {		
		sqlSession.insert(NAMESPACE + ".postCreate", postVo);
	}
	
	@Override
	public PostVo view(String postNo) throws Exception {
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("postNo", postNo);
		
		return sqlSession.selectOne(NAMESPACE + ".postView", parameter);
	}
	
	@Override
	public void update(PostVo postVo) throws Exception {
		sqlSession.update(NAMESPACE + ".postUpdate", postVo);	
	}
	
	@Override
	public void delete(String postNo) throws Exception {
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("postNo", postNo);
		 
		sqlSession.delete(NAMESPACE + ".postDelete", parameter);	
	}
	
	@Override
	public List<PostVo> listAll(Map<String, Object> param) throws Exception {		 
		return sqlSession.selectList(NAMESPACE + ".postList", param);
	}
	
	@Override
	public List<PostVo> listNews(Map<String, Object> param) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".postNews", param);
	}
	
	@Override
	public int listCount(Map<String, Object> param) throws Exception {	
		return sqlSession.selectOne(NAMESPACE + ".postCount", param);
	}
	
	@Override
	public List<CategoryVo> cateList(String bbsNo) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("bbsNo", bbsNo);
		 
		return sqlSession.selectList(NAMESPACE + ".cateList", param);
	}

	
}
