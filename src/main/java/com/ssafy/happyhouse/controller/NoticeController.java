package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.model.BoardDto;
import com.ssafy.happyhouse.model.service.BoardService;

@Controller
public class NoticeController {
	
	@Autowired
	BoardService service;
	
	@RequestMapping("/getlist")
	public String getList(Model model) {
		try {
			model.addAttribute("list",service.list());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return"error/error";
		}
		
		return "board/list";
	}
	
	@RequestMapping("/getlistpage")
	public String getListpage(Model model, int num) throws SQLException {
		int count = service.count();
		int postNum = 10;
		int pageNum = (int)Math.ceil((double)count/postNum);
		
		int displayPost = (num - 1) * postNum;
		
		List<BoardDto> list = null;
		list = service.listPage(displayPost, postNum);
		model.addAttribute("list", list);
		model.addAttribute("newlist", service.list());
		model.addAttribute("pageNum", pageNum);
		
		
		return "board/newpage";
	}
	
	@RequestMapping("/writeform")
	public String writeform() {
		
		
		return "board/write";
	}
	
	@PostMapping("/write")
	public String write(BoardDto board) {
		try {
			service.write(board);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return"error/error";
		}
		
		return"redirect:/getlistpage?num=1";
	}
	
	@RequestMapping("/view")
	public String view(int bno, Model model) {
		try {
			model.addAttribute("view",service.view(bno));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return"error/error";
		}
		
		return"board/view";
	}
	
	@RequestMapping("/notice/modifyform")
	public String modifyform(int bno, Model model) {
		try {
			model.addAttribute("view", service.view(bno));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return"error/error";
		}
		return"board/modify";
	}
	
	@RequestMapping("/notice/modify")
	public String modify(BoardDto board) throws SQLException {
		service.modify(board);
		return"redirect:/view?bno=" + board.getBno();
	}
	
	@RequestMapping("/notice/delete")
	public String delete(int bno) {
		try {
			service.delete(bno);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return"error/error";
		}
		return"redirect:/getlistpage?num=1";
	}
	
	@RequestMapping("/newNotice")
	public String newNotice(Model model) throws SQLException {
		model.addAttribute("list", service.list());
		return"board/NewFile";
	}
	
	@RequestMapping("/notice/remove")
	public String remove(int[] checkdel)throws Exception {
		
		for(int i=0; i<checkdel.length; i++) {
			service.delete(checkdel[i]);
		}
		
		return "redirect:/getlistpage?num=1";
		
	}
	
	
}
