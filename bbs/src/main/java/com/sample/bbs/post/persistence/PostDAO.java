package com.sample.bbs.post.persistence;

import java.util.List;
import java.util.Map;

import com.sample.bbs.post.domain.CategoryVo;
import com.sample.bbs.post.domain.PostVo;

public interface PostDAO {	
	void create(PostVo postVo) throws Exception;
	PostVo view(String postNo) throws Exception;
    void update(PostVo postVo) throws Exception;
    void delete(String postNo) throws Exception;
    List<PostVo> listAll(Map<String, Object> param) throws Exception;
    List<PostVo> listNews(Map<String, Object> param) throws Exception;
    int listCount (Map<String, Object> param) throws Exception;
    List<CategoryVo> cateList(String bbsNo) throws Exception;
}
