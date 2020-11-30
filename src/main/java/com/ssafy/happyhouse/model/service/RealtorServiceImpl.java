package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.ssafy.happyhouse.model.Realtor;
import com.ssafy.happyhouse.model.mapper.RealtorMapper;
@Service
public class RealtorServiceImpl implements RealtorService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String searchrPw(String rid, String remail) throws SQLException {
		// TODO Auto-generated method stub
		sqlSession.getMapper(RealtorMapper.class).searchrPw(rid, remail);
		return null;
	}

	@Override
	public void rregist(Realtor realtor) throws SQLException {
		// TODO Auto-generated method stub
		sqlSession.getMapper(RealtorMapper.class).rregist(realtor);

	}

	@Override
	public Realtor realtorInfo(String rid, int rno) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(RealtorMapper.class).realtorInfo(rid,rno);
	}

	@Override
	public void rmodify(Realtor realtor) throws SQLException {
		// TODO Auto-generated method stub
		sqlSession.getMapper(RealtorMapper.class).rmodify(realtor);

	}

	@Override
	public void rdelete(String rid) throws SQLException {
		// TODO Auto-generated method stub
		sqlSession.getMapper(RealtorMapper.class).rdelete(rid);

	}

	@Override
	public List<Realtor> realtorselectAll() throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(RealtorMapper.class).realtorselectAll();
	}

}
