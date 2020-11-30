package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;


import com.ssafy.happyhouse.model.Realtor;

public interface RealtorMapper {
	//공인중개사 관련
	
	//비밀번호 찾기
	public String searchrPw(String rid, String remail) throws SQLException;
	//회원가입
	public void rregist(Realtor realtor) throws SQLException;
	//회원정보 페이지
	public Realtor realtorInfo(String rid, int rno) throws SQLException;
	//회원정보 수정
	public void rmodify(Realtor realtor) throws SQLException;
	//회원정보 삭제
	public void rdelete(String rid) throws SQLException;
	//전체 회원 검색
	public List<Realtor> realtorselectAll()throws SQLException;

}
