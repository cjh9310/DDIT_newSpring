package com.mijung.sample.mapper;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.mijung.sample.vo.HeyrimVO;

import lombok.extern.slf4j.Slf4j;

@ExtendWith(SpringExtension.class) // Junit5를 사용하겠다는 의미
@ContextConfiguration("classpath:config/spring/database-context.xml") // 설정파일 로딩
@Slf4j
public class HeyrimMapperTest {
	
	@Autowired
	private HeyrimMapper heyrimMapper;
	
	@Test
	public void testInsert() {
		HeyrimVO namchin = new HeyrimVO();
		namchin.setNamGrade("최상");
		namchin.setNamName("곽동석");
		namchin.setNamTel("010-8282-2424");
		namchin.setNamId(1);
		
		log.debug(namchin.toString());
		
		assertEquals(1,heyrimMapper.insertNam(namchin));
		
	}

}
