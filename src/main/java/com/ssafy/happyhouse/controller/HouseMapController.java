package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.FavoriteDto;
import com.ssafy.happyhouse.model.HospitalDto;
import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.PersonDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.TriageRoomDto;
import com.ssafy.happyhouse.model.service.HouseMapService;

@RestController
public class HouseMapController {

	@Autowired
	HouseMapService houseMapService;
	
	@GetMapping(value = "/map/sidolist")
	public List<SidoGugunCodeDto> getSido(){
		try {
			return houseMapService.getSido();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@GetMapping(value = "/map/sido/{sido}")
	public List<SidoGugunCodeDto> getGugunInSido(@PathVariable String sido){
		try {
			return houseMapService.getGugunInSido(sido);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@GetMapping(value = "/map/gugun/{gugun}")
	public List<HouseInfoDto> getDongInGugun(@PathVariable String gugun){
		try {
			return houseMapService.getDongInGugun(gugun);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@GetMapping(value = "/map/dong/{dong}")
	public List<HouseInfoDto> getAptInDong(@PathVariable String dong){
		try {
			return houseMapService.getAptInDong(dong);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@GetMapping(value = "/map/aptname/{aptname}/{dong}")
	List<HouseDealDto> getAptNameHash(@PathVariable String aptname, @PathVariable String dong) {
		try {
			return houseMapService.getAptNameHash(aptname, dong);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	@GetMapping(value = "/map/searchAptName/{aptname}")
	List<HouseDealDto> getAptName(@PathVariable String aptname) {
		try {
			return houseMapService.getAptName(aptname);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@GetMapping(value = "/map/searchAptNameDetail/{aptname}")
	List<HouseDealDto> getAptNameDetail(@PathVariable String aptname) {
		try {
			return houseMapService.getAptNameDetail(aptname);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@GetMapping(value = "/covid/hospitalName/{gugun}")
	List<HospitalDto> getHospitalName(@PathVariable String gugun) {
		try {
			return houseMapService.getHospitalName(gugun);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@GetMapping(value = "/covid/hospitalHName/{hname}")
	List<HospitalDto> getHospitalList(@PathVariable String hname) {
		try {
			return houseMapService.getHospitalList(hname);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@GetMapping(value = "/covid/triageroomName/{gugun}")
	List<TriageRoomDto> getTriageName(@PathVariable String gugun) {
		try {
			return houseMapService.getTriageName(gugun);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@GetMapping(value = "/covid/triageroomTName/{tname}")
	List<TriageRoomDto> getTriageList(@PathVariable String tname) {
		try {
			return houseMapService.getTriageList(tname);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@PostMapping(value = "/favorite/add/{sido}/{gugun}/{dong}")
	void addfavList(@PathVariable String sido, @PathVariable String gugun, @PathVariable String dong, HttpSession session) {
		try {
			PersonDto personDto = (PersonDto) session.getAttribute("userinfo");
			if(personDto!=null) {
				FavoriteDto favoriteDto = new FavoriteDto();
				favoriteDto.setUserid(personDto.getUserid());
				favoriteDto.setLocation(sido+" "+gugun+" "+dong);
				houseMapService.addfavList(favoriteDto);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@PostMapping(value = "/favorite/delete/{userid}/{location}")
	void deletefav(@PathVariable String userid, @PathVariable String location) {
		FavoriteDto favoriteDto = new FavoriteDto();
		favoriteDto.setUserid(userid);
		favoriteDto.setLocation(location);
		try {
			houseMapService.deletefav(favoriteDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	

}
