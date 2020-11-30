package com.ssafy.happyhouse.model.service;

import java.util.Map;

import com.ssafy.happyhouse.model.PersonDto;
import com.ssafy.happyhouse.model.Realtor;

public interface LoginService {
	public PersonDto login(Map<String, String> map) throws Exception;
	public Realtor realtorlogin(Map<String, String> map) throws Exception;
	public Integer admin(String userid, String userpwd) throws Exception;
	
}
