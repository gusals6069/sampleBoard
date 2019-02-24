package com.sample.bbs.reply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.sample.bbs.reply.domain.ReplyVo;
import com.sample.bbs.reply.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyDAO {
	
	private ReplyDAO replyDAO;
	
	@Inject
    public ReplyServiceImpl(ReplyDAO replyDAO) {
        this.replyDAO = replyDAO;
    }
	
	@Override
	public List<ReplyVo> list(String postNo) throws Exception {
		return replyDAO.list(postNo);
	}
	
	@Override
	public void create(ReplyVo replyVo) throws Exception {
		replyDAO.create(replyVo);
	}
	
	@Override
	public void update(ReplyVo replyVo) throws Exception {
		replyDAO.update(replyVo);
	}
	
	@Override
	public void delete(String postNo) throws Exception {
		replyDAO.delete(postNo);
	}
}
