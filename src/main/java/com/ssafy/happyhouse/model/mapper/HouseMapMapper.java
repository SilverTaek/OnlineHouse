package com.ssafy.happyhouse.model.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.FavoriteDto;
import com.ssafy.happyhouse.model.HospitalDto;
import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.TriageRoomDto;

@Mapper
public interface HouseMapMapper {
	List<SidoGugunCodeDto> getSido() throws Exception;
	List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception;
	List<HouseInfoDto> getDongInGugun(String gugun) throws Exception;
	List<HouseInfoDto> getAptInDong(String dong) throws Exception;
	List<HouseDealDto> getAptNameHash(String aptname, String dong) throws Exception;
	List<HouseDealDto> getAptName(String aptName) throws Exception;
	List<HospitalDto> getHospitalName(String gugun) throws Exception;
	List<HospitalDto> getHospitalList(String hname) throws Exception;
	List<TriageRoomDto> getTriageName(String gugun) throws Exception;
	List<TriageRoomDto> getTriageList(String tname) throws Exception;
	List<FavoriteDto> getfavList(String id) throws Exception;
	void addfavList(FavoriteDto favoriteDto) throws Exception;
	void deletefav(FavoriteDto favoriteDto) throws Exception;
	List<HouseDealDto> getAptNameDetail(String aptName) throws Exception;
	

	
}
