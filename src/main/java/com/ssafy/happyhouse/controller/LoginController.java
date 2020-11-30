package com.ssafy.happyhouse.controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.PersonDto;
import com.ssafy.happyhouse.model.Realtor;
import com.ssafy.happyhouse.model.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	LoginService service;

	@RequestMapping("/loginform")
	public String loginform() {

		return "person/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam Map<String, String> map, Model model, String userpwd, HttpSession session,
			HttpServletResponse response) {
		try {
			PersonDto personDto = service.login(map);
			if (personDto != null) {
				session.setAttribute("userinfo", personDto);
				session.setAttribute("grade", service.admin(personDto.getUserid(), userpwd));
				Cookie cookie = new Cookie("userid", personDto.getUserid());
				cookie.setPath("/");
				if ("saveok".equals(map.get("idsave"))) {
					cookie.setMaxAge(60 * 60 * 24 * 365 * 40);// 40년간 저장.
				} else {
					cookie.setMaxAge(0);
				}
				response.addCookie(cookie);

			} else {
				model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 로그인해 주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "로그인 중 문제가 발생했습니다.");
			return "error/error";
		}
		return "index";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}

	@RequestMapping("realtor/login")
	public String realtorlogin(@RequestParam Map<String, String> map, Model model, String rpwd, HttpSession session,
			HttpServletResponse response) {
		try {
			Realtor realtor = service.realtorlogin(map);
			if (realtor != null) {
				session.setAttribute("realtorinfo", realtor);
				session.setAttribute("grade", service.admin(realtor.getRid(), rpwd));

			} else {
				model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 로그인해 주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "로그인 중 문제가 발생했습니다.");
			return "error/error";
		}
		return "index";
	}
}
