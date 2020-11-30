package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.StoreDto;
import com.ssafy.happyhouse.model.service.StoreService;

@RestController
public class StoreController {
	
	@Autowired
	StoreService storeService;
	
	@GetMapping(value="/store/storeList/{sido}/{gugun}/{dong}")
	public List<StoreDto> getStoreList(@PathVariable String sido, @PathVariable String gugun, @PathVariable String dong) {
		try {
			return storeService.getStoreList(sido, gugun, dong);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	@GetMapping(value = "/store/storeDetail/{address}")
	public List<StoreDto> getStoreDetail(@PathVariable String address){
		try {
			return storeService.getStoreDetail(address);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}
