package com.sample.bbs.reply.persistence;

import java.util.List;
import com.sample.bbs.reply.domain.ReplyVo;

public interface ReplyDAO {
    List<ReplyVo> list(String postNo) throws Exception;
    void create(ReplyVo replyVo) throws Exception;
    void update(ReplyVo replyVo) throws Exception;
    void delete(String postNo) throws Exception;
}
