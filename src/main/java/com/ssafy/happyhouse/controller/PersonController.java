package com.ssafy.happyhouse.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.model.PersonDto;
import com.ssafy.happyhouse.model.service.PersonService;

@Controller
public class PersonController {
	
	@Autowired
	private PersonService service;
	
	
	
	@RequestMapping("/person/searchPw")
	public String searchPw(Model model, String userid, String email) {
		try {
			model.addAttribute("userno", service.searchPw(userid, email));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return"error/error";
		}
		return "person/updatePwForm";
	}

	@RequestMapping("/registForm")
	public String registform() {
		
		return "person/registForm";
	}
	
	@RequestMapping("/searchPwForm")
	public String searchPwform() {
		return "person/searchPwForm";
	}
	@RequestMapping("/person/updatePw")
	public String updatePw(String newpwd, int userno) {
		try {
			service.updatePw(newpwd, userno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return"error/error";
		}
		return "person/login";
	}
	
	@RequestMapping("/regist")
	public String regist(PersonDto personDto) {
		try {
			service.regist(personDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return"person/login";
	}
	
	@RequestMapping("/mydata")
	public String mydata(Model model,String userid) {
		try {
			model.addAttribute("person", service.personInfo(userid));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return"error/error";
		}
		return"person/mydata";
	}
	
	@RequestMapping("/person/modifyform")
	public String modifyform(Model model,String userid) {
		try {
			model.addAttribute("person", service.personInfo(userid));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return"error/error";
		}
		return "person/updateForm";
	}
	
	@RequestMapping("/person/modify")
	public String modify(PersonDto personDto) {
		System.out.println(personDto);
		try {
			service.modify(personDto);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return"error/error";
		}
		
		return"redirect:/mydata?userid=" + personDto.getUserid();
	}
	
	@RequestMapping("/person/delete")
	public String delete(String userid,HttpServletRequest request) {
		try {
			service.delete(userid);
			request.getSession().invalidate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return"error/error";
		}
		return"index";
	}
	
	@RequestMapping("/person/list")
	public String list(Model model) {
		try {
			model.addAttribute("person",service.selectAll());
			model.addAttribute("realtorInfo", service.realtorselectAll());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return"error/error";
		}
		return"person/list";
	}
	@RequestMapping("/person/remove")
	public String remove(String[] checkdel)throws Exception {
		
		for(int i=0; i<checkdel.length; i++) {
			service.delete(checkdel[i]);
		}
		
		return "redirect:/person/list";
		
	}
	
	@RequestMapping("/realtor/remove")
	public String realtorRemove(String[] checkdel)throws Exception {
		
		for(int i=0; i<checkdel.length; i++) {
			service.rdelete(checkdel[i]);
		}
		
		return "redirect:/person/list";
		
	}
	
	
	
	
}
