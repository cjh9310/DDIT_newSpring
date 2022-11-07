package com.mijung.sample.mapper;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import lombok.extern.slf4j.Slf4j;

//mapper나 service는 junit 테스트를 이용하는 것이 가성비 짱, 서버 돌리면 시간만 오래 걸림
//spring-test 라이브러리가 필요하고, 버젼체크가 필요

@ExtendWith(SpringExtension.class) // Junit5를 사용하겠다는 의미
@ContextConfiguration("classpath:config/spring/database-context.xml") // 설정파일 로딩
@Slf4j
public class SuhyunMapperTest {

	@Autowired
	private SuhyunMapper suhyunMapper;
	
	@Autowired
	private YumiMapper yumiMapper;
	
	@Test
	@DisplayName("유미매운맛 테스트")
	public void yumiTest() {
		log.debug("유밍"+yumiMapper.readYumi());
	}
	
	
	
	
	@Test
	@Disabled   // 테스트가 확인 된 건 요따구로 표시해 줌, 지우지 말고용
	@DisplayName("주고시픈 테스트이름")
	public void readTest() {
		log.debug("이제 잘 될거예용");
		assertEquals(10, suhyunMapper.read(9000)); 
	}

	@Test
	@Disabled
	@DisplayName("성겸이가 된데용?")
	public void readTest2() {
		log.debug("이제 잘 될거예용2");
		assertEquals(1, suhyunMapper.read2(9000,5000)); 
	}

}
