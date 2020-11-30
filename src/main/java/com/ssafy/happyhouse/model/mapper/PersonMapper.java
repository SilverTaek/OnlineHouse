package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.PersonDto;
import com.ssafy.happyhouse.model.Realtor;

public interface PersonMapper {
	//비밀번호 찾기
	public int searchPw(String userid, String email) throws SQLException;
	//회원가입
	public void regist(PersonDto personDto) throws SQLException;
	//회원정보 페이지
	public PersonDto personInfo(String userid) throws SQLException;
	//회원정보 수정
	public void modify(PersonDto personDto) throws SQLException;
	//회원정보 삭제
	public void delete(String userid) throws SQLException;
	//전체 회원 검색
	public List<PersonDto> selectAll()throws SQLException;
	//중개사 전체 검색
	public List<Realtor> realtorselectAll()throws SQLException;
	//중개사 삭제
	public void rdelete(String rid) throws SQLException;
	//새로운 비밀번호 설정 
		public void updatePw(String newpwd, int userno) throws SQLException;

}
