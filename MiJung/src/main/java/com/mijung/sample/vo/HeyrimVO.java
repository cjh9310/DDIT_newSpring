package com.mijung.sample.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

//@Setter
@Getter
@ToString
@Slf4j
public class HeyrimVO {
	private int namId;
	private String namName;
	private String namTel;
	private String namGrade;
	
	public void setNamId(int namId) {
		log.debug(""+namId);
		this.namId = namId;
	}
	
	public void setNamName(String namName) {
		log.debug(namName);
		this.namName = namName;
	}
	
	public void setNamTel(String namTel) {
		log.debug(namTel);
		this.namTel = namTel;
	}
	
	public void setNamGrade(String namGrade) {
		log.debug(namGrade);
		this.namGrade = namGrade;
	}
	
}	
