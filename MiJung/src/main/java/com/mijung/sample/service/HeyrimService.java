package com.mijung.sample.service;

import java.util.List;

import com.mijung.sample.vo.HeyrimVO;

public interface HeyrimService {
	
	public List<HeyrimVO> getList();
	
	public HeyrimVO getNam(String namId);
	
	public int insertNam(HeyrimVO namchin);
	
	public int updateNam(HeyrimVO namchin);
	
	public int deleteNam(HeyrimVO namchin);
}
