package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.StoreDto;
import com.ssafy.happyhouse.model.mapper.StoreMapper;

@Service
public class StoreServiceImpl implements StoreService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<StoreDto> getStoreList(String sido, String gugun, String dong) throws Exception {
		return sqlSession.getMapper(StoreMapper.class).getStoreList(sido, gugun, dong);
	}

	@Override
	public List<StoreDto> getStoreDetail(String address) throws Exception {
		return sqlSession.getMapper(StoreMapper.class).getStoreDetail(address);
	}

}
