package com.mijung.sample.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper  // 명시적으로 많이 써줌
public interface SuhyunMapper {
	
	/* 어노테이션으로는 복잡한 sql문을 쓰기 힘들고, dynamic sql문을 쓸 수 없어서
	 * 간단한 것만 어노테이션을 쓰고, 나머지는 xml을 이용해서 맵핑시킴 (아예 xml로 쓰는 경우가 더 많음)
	 */
	
	//@Select("select count(*) from jobs  where max_salary > #{merong}")
	public int read(int merong);
	
	//@Select("select count(*) from jobs  where max_salary < #{merong} and min_salary > #{merong2}")
	public int read2(@Param("merong") int aaa,@Param("merong2") int bbb);
	
	
	/* 크게 읽기(select),  쓰기(insert,update,delete)
	 * 기본적으로 읽기(2개) 와 쓰기(3개) 가 들어가게 됨, 그외 필요한 거 추가
	 * 메소드명이 sql문과 연결시키는 고유 ID값으로 쓰이기 때문에 같은 게 있으면 안됨
	@Select("select * from jobs")
	public int readList();
	
	@Insert("")
	public int ins();
	
	@Update("")
	public int upd();
	
	@Delete("")
	public int del();
	*/
}
