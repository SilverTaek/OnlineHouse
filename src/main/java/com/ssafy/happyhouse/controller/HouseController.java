package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ssafy.happyhouse.model.FavoriteDto;
import com.ssafy.happyhouse.model.PersonDto;
import com.ssafy.happyhouse.model.service.HouseMapService;

@Controller
public class HouseController {
	
	@Autowired
	HouseMapService houseMapService;
	
//	@GetMapping(value="/qna")
//	public String mvqna() {	
//		return "index.html";
//	}
	
	@GetMapping(value="/mainSearch")
	public String mvMainSearch(Model model, String main_search) {	
		model.addAttribute("keyword", main_search);
		return "house/map";
	}
	
	@GetMapping(value = "/map")
	public String mvMap() {
		return "house/map";
	}
	
	@GetMapping(value = "/favorite")
	public String mvFavorite(Model model, HttpSession httpSession) {
		PersonDto personDto = (PersonDto) httpSession.getAttribute("userinfo");
		try {
			List<FavoriteDto> list = houseMapService.getfavList(personDto.getUserid());
			model.addAttribute("favlist", list);
			model.addAttribute("userid", personDto.getUserid());
			return "house/favorite";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "관심지역을 불러오는 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
	@GetMapping(value = "/store")
	public String mvStore() {
		return "house/store";
	}
	
	@GetMapping(value = "/environment")
	public String mvEnvironment() {
		return "house/environment";
	}
	
	@GetMapping(value = "/hospital")
	public String mvHospital() {
		return "covid19/hospital";
	}
	
	@GetMapping(value = "/triageroom")
	public String mvTriageRoom() {
		return "covid19/triageroom";
	}
	
	@GetMapping(value = "/housedeal/dong")
	public String houseDealDong(Model model) {
		model.addAttribute("type", "dong");
		return "house/realDeal";
	}
	
	@GetMapping(value = "/housedeal/apt")
	public String houseDealApt(Model model) {
		model.addAttribute("type", "apt");
		return "house/realDeal";
	}

}
