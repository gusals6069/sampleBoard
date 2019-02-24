package com.sample.bbs.post.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sample.bbs.post.domain.CategoryVo;
import com.sample.bbs.post.domain.PostVo;
import com.sample.bbs.post.persistence.PostDAO;

@Service
public class PostServiceImpl implements PostService{

	private PostDAO postDAO;
	
	@Inject
    public PostServiceImpl(PostDAO postDAO) {
        this.postDAO = postDAO;
    }
	
	@Override
	public void create(PostVo postVo) throws Exception {
		postDAO.create(postVo);
	}

	@Override
	public PostVo view(String postNo) throws Exception {
		return postDAO.view(postNo);
	}

	@Override
	public void update(PostVo postVo) throws Exception {
		postDAO.update(postVo);
		
	}

	@Override
	public void delete(String postNo) throws Exception {
		postDAO.delete(postNo);
	}

	@Override
	public List<PostVo> listAll(Map<String, Object> param) throws Exception {
		return postDAO.listAll(param);
	}
	
	@Override
	public List<PostVo> listNews(Map<String, Object> param) throws Exception {
		return postDAO.listNews(param);
	}
	
	@Override
	public int listCount(Map<String, Object> param) throws Exception {
		return postDAO.listCount(param);
	}
	
	@Override
	public List<CategoryVo> cateList(String bbsNo) throws Exception {
		return postDAO.cateList(bbsNo);
	}

	
	
}
