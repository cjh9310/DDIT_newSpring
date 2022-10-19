package com.mijung.sample;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.hc.client5.http.fluent.Request;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/suhyun")   /* 요건 써줘야 가독성이 좋아짐 */
@Slf4j                    /* 롬복이 지원  logger를 따로 안 맹글어도 됨 */
public class MyController {

	@GetMapping("/get")
	public String getName(HttpServletResponse response) {
		return "ajaxTest";   //
	}
	
	@GetMapping(value="/googleNews",produces = "application/json;charset=utf-8")
	@ResponseBody  // for AJAX
	public String getNews(String keyWord) throws Exception {
		
	  log.info("체킁:" + keyWord);
	  String encKeyword = URLEncoder.encode(keyWord, "UTF-8");
	  //서버 우회 
	  String content = Request.get("https://news.google.com/rss/search?q=" + encKeyword + "&hl=ko&gl=KR&ceid=KR:ko")
		       .execute()
		       .returnContent().toString();
		return content;   //
	}
	
	
	
	@PostMapping("/post")
	@ResponseBody
	public String postName(@RequestBody ArrayList<TestVO> merong) {
		
		for (TestVO testVO : merong) {
			log.info(testVO.getName());
			log.info(""+testVO.getAge());
			log.info(testVO.getFriends().toString());
			log.info("==================================");
		}
		
		
		/*
		for (String one : kumku) {
			System.out.println(one);  // 누느로 화긴
		}
		*/
		
		
		return "Strange Ji Young";
		/* ArrayList 리턴
		List<String>  myList = new ArrayList<String>();
		for(int i=0; i<=10; i++) {
			myList.add("Roze" + i);
		}
		
		return myList;  // Jackson이 알아성 js 배열 문자열로 바꾸어 줌
		*/
		
		/* Map 리턴
		Map<String,String> myMap = new HashMap<String, String>();
		myMap.put("roze", "MIP");
		myMap.put("jenni", "VIP");
		myMap.put("risa", "Dancing Queen");
		myMap.put("jisu", "Kospi");

		return myMap;
	    */
		
		/*
		// List<Map>  리턴     요런 걸 사용하는 경우가 가장 마늠
		// List -> [],  Map -> {}
		List<Map<String, String>> myList = new ArrayList<Map<String,String>>();
		Map<String, String> justMap;
		
		for(int i=1; i<=4; i++) {
			justMap = new HashMap<String, String>();
			justMap.put("key"+i, "value"+i);
			myList.add(justMap);
		}
		
		return myList;
		*/
		
		/* VO를 매칭시킬 상황이 아닌데, 데이타 타입이 뒤죽박죽인 경우(잘 발생하지 않음)
		List<Map<String, Object>>  ,  꺼낼 때 casting 해야 함에 주의
		*/
	}
}
