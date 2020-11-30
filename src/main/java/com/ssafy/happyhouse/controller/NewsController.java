package com.ssafy.happyhouse.controller;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ssafy.happyhouse.model.service.RealtorService;

@Controller
public class NewsController {
	@Autowired
	RealtorService service;
	
	
	@RequestMapping("/")
	public String Home() {
		
		return"index";
	}
	
	@RequestMapping("/api/news")
    public String getData(Model model) throws JsonMappingException, JsonProcessingException {
        String clientId = "WTCGMLb3wQnfg3p3slx7"; //애플리케이션 클라이언트 아이디값"
        String clientSecret = "LqINRGZ_mS"; //애플리케이션 클라이언트 시크릿값"

        String text = null;
        try {
            text = URLEncoder.encode("코로나부동산", "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }

        String apiURL = "https://openapi.naver.com/v1/search/news?query=" + text;    // json 결과
        //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);
        ObjectMapper objMapper = new ObjectMapper();
        
        Map<String, String> resultMap = objMapper.readValue(responseBody, Map.class);
        model.addAttribute("news", resultMap);
        
        
        
       return"news";
    }
	@RequestMapping("realtor/info")
    public String getDataRealtor(Model model,String rid, int rno) throws JsonMappingException, JsonProcessingException, SQLException {
        String clientId = "WTCGMLb3wQnfg3p3slx7"; //애플리케이션 클라이언트 아이디값"
        String clientSecret = "LqINRGZ_mS"; //애플리케이션 클라이언트 시크릿값"

        String text = null;
        try {
            text = URLEncoder.encode("부동산", "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }

        String apiURL = "https://openapi.naver.com/v1/search/news?query=" + text;    // json 결과
        //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);
        ObjectMapper objMapper = new ObjectMapper();
        
        Map<String, String> resultMap = objMapper.readValue(responseBody, Map.class);
        model.addAttribute("news", resultMap);
        
        
        model.addAttribute("realtorInfo", service.realtorInfo(rid, rno));
		model.addAttribute("realtor", service.realtorselectAll());
		return"realtor/info2";
    }

    private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }

    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
}