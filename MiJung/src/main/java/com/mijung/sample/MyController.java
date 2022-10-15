package com.mijung.sample;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/suhyun") /* 요건 써줘야 가독성이 좋아짐 */  // 실행 후 검색 =>http://localhost:8004/sample/suhyun/get
public class MyController {

	@GetMapping(value="/get", produces="application/json;charset=utf-8")
	@ResponseBody                // 이게 붙으면 Ajax용
	// @ResponseBody가 없으면 메롱.jsp를 찾는다.
	public String getName(HttpServletResponse response) {
		return "메롱";     // 
	}
	
	@PostMapping("/post")
	@ResponseBody
	public String postName() {
		return "안메롱";
	}
}
