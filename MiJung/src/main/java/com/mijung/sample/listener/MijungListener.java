package com.mijung.sample.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MijungListener implements ServletContextListener {

	/* 초기화 되고 나서 자동 실행 */
	@Override  
	public void contextInitialized(ServletContextEvent sce) {
		log.info("저 언제 실행되용? 초기화");
		ServletContext  jiyoung = sce.getServletContext();
		// 자주 쓰는 값을 세팅해 놓으면  편하게 쓸 수 있음, 예를 들면 , contextPath
		jiyoung.setAttribute("webPath", jiyoung.getContextPath());
		log.info("메롱");
	}

	/* 종료 될 때 자동 실행 */
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		log.info("저는 또 언제 실행 되나용?");
	}

}
