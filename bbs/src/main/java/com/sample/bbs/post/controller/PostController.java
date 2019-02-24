package com.sample.bbs.post.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sample.bbs.post.domain.PostVo;
import com.sample.bbs.post.service.PostService;
import com.sample.bbs.common.util.PageMaker;

@Controller
@RequestMapping("/post")
public class PostController<httpServletRequest> {
	
	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	private PostService postService;
	
	@Inject
	public PostController(PostService postService) {
		this.postService = postService;
	}
	
	// 목록 페이지 이동
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@RequestParam("bbsNo") String bbsNo, @RequestParam("curPage") String curPage, 
					   @RequestParam(value="searchType", required=false) String searchType,
					   @RequestParam(value="searchKeyword", required=false) String searchKeyword, Model model) throws Exception {
		
		logger.info("searchType = "+searchType);
		logger.info("searchKeyword = "+searchKeyword);
		
		Map<String, Object> countParam = new HashMap<String, Object>();
		countParam.put("bbsNo", bbsNo);
		countParam.put("searchType", searchType);
		countParam.put("searchKeyword", searchKeyword);
		int totalCount = postService.listCount(countParam);
		
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setPageNo(Integer.parseInt(curPage));
	    pageMaker.setPageSize(10);
	    pageMaker.setBlockSize(10);
	    pageMaker.setTotalCount(totalCount);
	    
	    Map<String, Object> param = new HashMap<String, Object>();
	    param.put("bbsNo", bbsNo);
	    param.put("searchType", searchType);
	    param.put("searchKeyword", searchKeyword);
	    param.put("startRowNum", pageMaker.getStartRowNum());
		param.put("endRowNum", pageMaker.getEndRowNum());
	    
	    model.addAttribute("postList", postService.listAll(param));
	    model.addAttribute("postNews", postService.listNews(param));  
	    model.addAttribute("postCount", totalCount);
	    model.addAttribute("pageMaker", pageMaker);
	    
	    model.addAttribute("searchType", searchType);
	    model.addAttribute("searchKeyword", searchKeyword);
	    
	    return "/post/list";
	}
	
	// 조회 페이지 이동
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(@RequestParam("postNo") String postNo, Model model) throws Exception {
	    model.addAttribute("post", postService.view(postNo));

	    return "/post/view";
	}
	
	// 등록 페이지 이동
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGET(@RequestParam("bbsNo") String bbsNo, Model model) throws Exception {	    
		model.addAttribute("categoryList", postService.cateList(bbsNo));
		
	    return "/post/write";
	}
	
	// 등록 처리
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(PostVo postVo, @RequestParam("bbsNo") String bbsNo, RedirectAttributes redirectAttributes) throws Exception {
	    logger.info(postVo.toString());
	    
	    postService.create(postVo);
	    redirectAttributes.addFlashAttribute("msg", "regSuccess");

	    return "redirect:/post/list?bbsNo=" + bbsNo + "&curPage=1";
	}
	
	// 수정 페이지 이동
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("postNo") String postNo, @RequestParam("bbsNo") String bbsNo, Model model) throws Exception {
	    model.addAttribute("post", postService.view(postNo));
	    model.addAttribute("categoryList", postService.cateList(bbsNo));

	    return "/post/modify";
	}
	
	// 수정 처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(PostVo postVo, @RequestParam("bbsNo") String bbsNo, RedirectAttributes redirectAttributes) throws Exception {
		postService.update(postVo);
	    redirectAttributes.addFlashAttribute("msg", "modSuccess");

	    return "redirect:/post/list?bbsNo=" + bbsNo + "&curPage=1";
	}
	
	// 삭제 처리
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String remove(@RequestParam("postNo") String postNo, @RequestParam("bbsNo") String bbsNo, RedirectAttributes redirectAttributes) throws Exception {
	    postService.delete(postNo);
	    redirectAttributes.addFlashAttribute("msg", "delSuccess");

	    return "redirect:/post/list?bbsNo=" + bbsNo + "&curPage=1";
	}
}
