package com.ssafy.happyhouse.controller;

import java.sql.SQLException;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.model.Realtor;
import com.ssafy.happyhouse.model.service.RealtorService;

@Controller
public class RealtorController {
	
	@Autowired
	RealtorService service;
	
	
	@RequestMapping("/realtorLogin")
	public String loginform() {
		return"realtor/login";
		
	}
	@RequestMapping("/realtorRegister")
	public String registform() {
		return "realtor/registForm";
	}
	
	@RequestMapping("/realtor/regist")
	public String regist(Realtor realtor) {
		
		try {
			service.rregist(realtor);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/realtorLogin";
	}
	
	
	
	@RequestMapping("/realtor/updateForm")
	public String realtorUpdateForm(String rid,int rno, Model model) {
		try {
			model.addAttribute("realtorInfo",service.realtorInfo(rid, rno));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "realtor/admin";
	}
	
	@RequestMapping("/realtor/update")
	public String realtorUpdate(Realtor realtor) {
		System.out.println(realtor);
		try {
			service.rmodify(realtor);
			System.out.println(realtor);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return"error/error";
		}	
		System.out.println(realtor);
		return"index";
	}
	
	
}
