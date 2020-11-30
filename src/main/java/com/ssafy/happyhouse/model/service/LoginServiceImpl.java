package com.ssafy.happyhouse.model.service;


import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.PersonDto;
import com.ssafy.happyhouse.model.Realtor;
import com.ssafy.happyhouse.model.mapper.LoginMapper;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public PersonDto login(Map<String, String> map) throws Exception {
		if(map.get("userid") == null || map.get("userpwd") == null)
			return null;
		return sqlSession.getMapper(LoginMapper.class).login(map);
	}
	
	@Override
	public Integer admin(String userid, String userpwd) throws Exception {
		return sqlSession.getMapper(LoginMapper.class).admin(userid, userpwd);
	}

	@Override
	public Realtor realtorlogin(Map<String, String> map) throws Exception {
		if(map.get("rid") == null || map.get("rpwd") == null)
			return null;
		return sqlSession.getMapper(LoginMapper.class).realtorlogin(map);
	}
	
}
