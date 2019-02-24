package com.sample.bbs.reply.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sample.bbs.reply.domain.ReplyVo;
import com.sample.bbs.reply.persistence.ReplyDAO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	private static final String NAMESPACE = "com.sample.bbs.mappers.reply.ReplyMapper";
	private SqlSession sqlSession;
	
	@Inject
	public void setSqlSession(SqlSession sqlSession) {
	   this.sqlSession = sqlSession;
	}
	
	@Override
	public List<ReplyVo> list(String postNo) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".replyList", postNo);
	}
	
	@Override
	public void create(ReplyVo replyVo) throws Exception {
		sqlSession.insert(NAMESPACE + ".replyCreate", replyVo);	
	}
	
	@Override
	public void update(ReplyVo replyVo) throws Exception {
		sqlSession.update(NAMESPACE + ".replyUpdate", replyVo);	
	}
	
	@Override
	public void delete(String postNo) throws Exception {
		sqlSession.delete(NAMESPACE + ".replyDelete", postNo);
	}
}
