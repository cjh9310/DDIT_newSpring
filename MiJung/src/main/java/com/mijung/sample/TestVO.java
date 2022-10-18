package com.mijung.sample;

import java.util.ArrayList;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//@Data  요건 권장되지 않음, 너무 많이 해 버려서 일부 상황에서 디버깅이 더 어려워짐
//lombok을 쓰면 편하기도 하지만, 가독성이 아주 많이 향상됨

@Setter
@Getter
@ToString
public class TestVO {
	private String name;
	private int age;
	private ArrayList<String> friends;

}
