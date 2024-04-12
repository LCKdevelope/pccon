package com.pcConSystem.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.pcConSystem.dto.pcrAd;
import com.pcConSystem.dto.pcrOrders;

public interface pcrOrderDao {

	String getOrderCode(String pcrCode);

	int orderProduct(pcrOrders odto);

	
}
                  