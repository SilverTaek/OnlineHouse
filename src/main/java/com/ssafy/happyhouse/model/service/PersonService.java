package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.PersonDto;
import com.ssafy.happyhouse.model.Realtor;

public interface PersonService {
	public void regist(PersonDto personDto) throws Exception;

	public int searchPw(String userid, String email) throws Exception;

	public PersonDto personInfo(String userid) throws Exception;

	public void modify(PersonDto personDto) throws Exception;

	public void delete(String userid) throws Exception;
	
	public List<PersonDto> selectAll()throws SQLException;
	
	//중개사 전체 검색
		public List<Realtor> realtorselectAll()throws SQLException;
		//중개사 삭제
		public void rdelete(String rid) throws SQLException;
		
		public void updatePw(String newpwd, int userno) throws Exception;

}
