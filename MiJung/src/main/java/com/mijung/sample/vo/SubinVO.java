package com.mijung.sample.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString   // 요건 디버깅용으로 꼬옥 빼먹지 말고 ..
//@Alias("subinVO")  // 요따구로도 해용  xml과 선택의 문제
public class SubinVO {
	private String name;
	private int age;
	private String sosok;
}
