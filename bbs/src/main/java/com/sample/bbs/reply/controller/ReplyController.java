package com.sample.bbs.reply.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.sample.bbs.reply.domain.ReplyVo;
import com.sample.bbs.reply.service.ReplyService;

@RestController
@RequestMapping("/reply")
public class ReplyController {

    private final ReplyService replyService;

    @Inject
    public ReplyController(ReplyService replyService) {
        this.replyService = replyService;
    }

    // 댓글 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
    public List<ReplyVo> list( @RequestParam("postNo") String postNo, HttpSession session) throws Exception{
        List<ReplyVo> list = replyService.list(postNo); 
        return list;
    }
    
    // 댓글 입력
    @RequestMapping(value ="/insert", method = RequestMethod.POST)
    public void insert(@ModelAttribute ReplyVo replyVo, HttpSession session) throws Exception{
        replyService.create(replyVo);
    }
    
    // 댓글 수정 - 미구현
    /*@RequestMapping(value ="/update")
    public void update(@ModelAttribute ReplyVo replyVo, HttpSession session) throws Exception{
    	replyService.update(replyVo);
    }*/
    
    // 댓글 삭제 - 미구현
    /*@RequestMapping(value ="/delete", method = RequestMethod.POST)
    public void delete(@RequestParam("replyNo") String replyNo, HttpSession session) throws Exception{
    	replyService.delete(replyNo);
    }*/
   
}
