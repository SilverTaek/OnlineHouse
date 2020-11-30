package com.ssafy.happyhouse.model.service;


import java.util.List;

import com.ssafy.happyhouse.model.FavoriteDto;
import com.ssafy.happyhouse.model.HospitalDto;
import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.TriageRoomDto;

public interface HouseMapService {
	
	List<SidoGugunCodeDto> getSido() throws Exception;
	List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception;
	List<HouseInfoDto> getDongInGugun(String gugun) throws Exception;
	List<HouseInfoDto> getAptInDong(String dong) throws Exception;
	List<HouseDealDto> getAptName(String aptName) throws Exception;
	List<HouseDealDto> getAptNameHash(String aptName, String dong) throws Exception;
	List<HospitalDto> getHospitalName(String gugun) throws Exception;
	List<HospitalDto> getHospitalList(String hname) throws Exception;
	List<TriageRoomDto> getTriageName(String gugun) throws Exception;
	List<TriageRoomDto> getTriageList(String tname) throws Exception;
	List<FavoriteDto> getfavList(String id) throws Exception;
	void addfavList(FavoriteDto favoriteDto) throws Exception;
	void deletefav(FavoriteDto favoriteDto) throws Exception;
	List<HouseDealDto> getAptNameDetail(String aptname) throws Exception;
	
}
