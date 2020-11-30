package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.PersonDto;
import com.ssafy.happyhouse.model.Realtor;
import com.ssafy.happyhouse.model.mapper.PersonMapper;



@Service
public class PersonServiceImpl implements PersonService{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void regist(PersonDto personDto) throws Exception {
		sqlSession.getMapper(PersonMapper.class).regist(personDto);
		
	}

	@Override
	public int searchPw(String userid, String email) throws Exception {
		return sqlSession.getMapper(PersonMapper.class).searchPw(userid, email);
		
	}

	@Override
	public PersonDto personInfo(String userid) throws Exception {
		return sqlSession.getMapper(PersonMapper.class).personInfo(userid);
	}

	@Override
	public void modify(PersonDto personDto) throws Exception {
		sqlSession.getMapper(PersonMapper.class).modify(personDto);
		
	}

	@Override
	public void delete(String userid) throws Exception {
		sqlSession.getMapper(PersonMapper.class).delete(userid);
		
	}

	@Override
	public List<PersonDto> selectAll() throws SQLException {
		
		return sqlSession.getMapper(PersonMapper.class).selectAll();
	}
	
	@Override
	public void rdelete(String rid) throws SQLException {
		// TODO Auto-generated method stub
		sqlSession.getMapper(PersonMapper.class).rdelete(rid);

	}

	@Override
	public List<Realtor> realtorselectAll() throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(PersonMapper.class).realtorselectAll();
	}

	@Override
	public void updatePw(String newpwd, int userno) throws Exception {
		sqlSession.getMapper(PersonMapper.class).updatePw(newpwd, userno);
	}
	
}
