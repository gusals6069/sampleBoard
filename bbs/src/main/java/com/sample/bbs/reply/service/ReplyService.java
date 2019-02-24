package com.sample.bbs.reply.service;

import java.util.List;
import com.sample.bbs.reply.domain.ReplyVo;

public interface ReplyService {
    List<ReplyVo> list(String postNo) throws Exception;
    void create(ReplyVo replyVo) throws Exception;
    void update(ReplyVo replyVo) throws Exception;
    void delete(String postNo) throws Exception;
}
