package com.ssafy.happyhouse.controller;

import java.sql.SQLException;


import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.model.PersonDto;
import com.ssafy.happyhouse.model.Realtor;

import com.ssafy.happyhouse.model.service.RealtorService;

@Controller
public class ChatController {

	@Autowired
	RealtorService service;
	
	private PersonDto personDto;
	private Realtor realtor;

	@RequestMapping("/chat")
	public String chatlisst(Model model, HttpSession session, HttpServletResponse response) throws SQLException {

		if (personDto != null) {
			session.setAttribute("userinfo", personDto);
			
		} 
		if(realtor !=null) {
			session.setAttribute("realtor", realtor);
			
		}
		
		model.addAttribute("realtors", service.realtorselectAll());
		return "chat/chatlist";
	}
	
	@RequestMapping("/moveChating")
	public ModelAndView chating(@RequestParam String rid, @RequestParam int rno) throws SQLException {
		ModelAndView mv = new ModelAndView();
		mv.addObject("realtorInfo", service.realtorInfo(rid,rno));
		mv.setViewName("chat/chat");
		return mv;
	}
	

}
