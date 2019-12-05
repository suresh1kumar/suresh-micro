package com.servlet.dao;

import java.util.List;

import com.servlet.bean.Zone;

public interface ZoneDao {
	
	public List<Zone> getProductDetails(double meiprice,double maxprice);

}
