package com.mijung.sample.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("suhyun")
public class SuhyunController {

	@GetMapping("/sabun")
	public String sabunTest(Model model) {
		
		List<Map<String, String>> dummyList = new ArrayList<Map<String,String>>();
		Map<String, String> myMap;
		for (int i=1; i<=50; i++) {
			myMap = new HashMap<String, String>();
			myMap.put("index" +  (int)(i/4) + "1", "첫번째");
			myMap.put("index" +  (int)(i/4) + "2", "두번째");
			myMap.put("index" +  (int)(i/4) + "3", "세번째");
			myMap.put("index" +  (int)(i/4) + "4", "네번째");
			dummyList.add(myMap);
		} 
		
		model.addAttribute("testList", dummyList);
		return "sabunhal";
	}
}
