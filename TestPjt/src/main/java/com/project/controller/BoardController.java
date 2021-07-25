package com.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.service.BoardService;
import com.project.vo.BoardVO;
import com.project.vo.PageMaker;
import com.project.vo.SearchCriteria;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	// 게시판 글 작성 화면123
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("writeView");
		
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BoardVO boardVO) throws Exception{
		logger.info("write");
		
		service.write(boardVO);
		
		return "redirect:/board/list";
	}
	
	// 게시판 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String table(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		logger.info("list");

		PageMaker pageMaker = new PageMaker();
		model.addAttribute("list", service.list(scri));
		
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		model.addAttribute("pageMaker", pageMaker);
		//System.out.println(pageMaker);
		/* System.out.println(service.list(scri)); */
		return "board/list";
		
	}
	
	// 게시판 조회
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(BoardVO boardVO,HttpSession session, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("read");
		
		model.addAttribute("read", service.read(boardVO.getBno()));
		model.addAttribute("scri", scri);
		/* System.out.println(service.read(boardVO.getBno())); */
		return "board/readView";
	}
	
	// 게시판 수정뷰
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("updateView");
		
		model.addAttribute("update", service.read(boardVO.getBno()));
		model.addAttribute("scri", scri);
		
		return "board/updateView";
	}
	
	// 게시판 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("update");
		

		service.update(boardVO);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/readView?bno=" + boardVO.getBno() + "&page="+ scri.getPage() +"&perPageNum="+ scri.getPerPageNum() +"&searchType="+ scri.getSearchType() +"&keyword=" + scri.getKeyword();
		
	}


	
	//게시물 선택삭제
    @RequestMapping(value = "/delete")
    public String ajaxTest(HttpServletRequest request, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
            
        String[] ajaxMsg = request.getParameterValues("valueArr");
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	service.delete(ajaxMsg[i]);
        	
    		rttr.addAttribute("page", scri.getPage());
    		rttr.addAttribute("perPageNum", scri.getPerPageNum());
    		rttr.addAttribute("searchType", scri.getSearchType());
    		rttr.addAttribute("keyword", scri.getKeyword());
        }
        return "redirect:/board/readView?&page="+ scri.getPage() +"&perPageNum="+ scri.getPerPageNum() +"&searchType="+ scri.getSearchType() +"&keyword=" + scri.getKeyword();
		
    }
    
	// 페이지 홈
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void index() throws Exception{
		logger.info("index");
		
	}
	
}