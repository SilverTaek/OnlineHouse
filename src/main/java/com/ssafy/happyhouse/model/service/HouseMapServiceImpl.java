package com.ssafy.happyhouse.model.service;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.FavoriteDto;
import com.ssafy.happyhouse.model.HospitalDto;
import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.TriageRoomDto;
import com.ssafy.happyhouse.model.mapper.HouseMapMapper;

@Service
public class HouseMapServiceImpl implements HouseMapService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<SidoGugunCodeDto> getSido() throws Exception {
		return sqlSession.getMapper(HouseMapMapper.class).getSido();
	}

	@Override
	public List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception {
		return sqlSession.getMapper(HouseMapMapper.class).getGugunInSido(sido);
	}

	@Override
	public List<HouseInfoDto> getDongInGugun(String gugun) throws Exception {
		return sqlSession.getMapper(HouseMapMapper.class).getDongInGugun(gugun);
	}

	@Override
	public List<HouseInfoDto> getAptInDong(String dong) throws Exception {
		return sqlSession.getMapper(HouseMapMapper.class).getAptInDong(dong);
	}

	@Override
	public List<HouseDealDto> getAptNameHash(String aptName, String dong) throws Exception {
		return sqlSession.getMapper(HouseMapMapper.class).getAptNameHash(aptName, dong);
	}

	@Override
	public List<HouseDealDto> getAptName(String aptName) throws Exception {
		return sqlSession.getMapper(HouseMapMapper.class).getAptName(aptName);
	}
	
	@Override
	public List<HouseDealDto> getAptNameDetail(String aptName) throws Exception {
		return sqlSession.getMapper(HouseMapMapper.class).getAptNameDetail(aptName);
	}

	@Override
	public List<HospitalDto> getHospitalName(String gugun) throws Exception {
		return sqlSession.getMapper(HouseMapMapper.class).getHospitalName(gugun);
	}

	@Override
	public List<HospitalDto> getHospitalList(String hname) throws Exception {
		return sqlSession.getMapper(HouseMapMapper.class).getHospitalList(hname);
	}

	@Override
	public List<TriageRoomDto> getTriageName(String gugun) throws Exception {
		return sqlSession.getMapper(HouseMapMapper.class).getTriageName(gugun);
	}

	@Override
	public List<TriageRoomDto> getTriageList(String tname) throws Exception {
		return sqlSession.getMapper(HouseMapMapper.class).getTriageList(tname);
	}

	@Override
	public List<FavoriteDto> getfavList(String id) throws Exception {
		return sqlSession.getMapper(HouseMapMapper.class).getfavList(id);
	}

	@Override
	public void addfavList(FavoriteDto favoriteDto) throws Exception {
		sqlSession.getMapper(HouseMapMapper.class).addfavList(favoriteDto);
		
	}

	@Override
	public void deletefav(FavoriteDto favoriteDto) throws Exception {
		sqlSession.getMapper(HouseMapMapper.class).deletefav(favoriteDto);
		
	}

}
