package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.StoreDto;

public interface StoreService {
	public List<StoreDto> getStoreList(String sido, String gugun, String dong) throws Exception;

	public List<StoreDto> getStoreDetail(String address) throws Exception;
}
