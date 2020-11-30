package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.StoreDto;

@Mapper
public interface StoreMapper {
	public List<StoreDto> getStoreList(String sido, String gugun, String dong) throws Exception;

	public List<StoreDto> getStoreDetail(String address) throws Exception;
}
