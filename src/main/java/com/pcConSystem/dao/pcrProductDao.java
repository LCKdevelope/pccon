package com.pcConSystem.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.pcConSystem.dto.pcrAd;
import com.pcConSystem.dto.pcrProduct;

public interface pcrProductDao {



	String getprCode(String pcrCode);

	int registryProduct(pcrProduct pdto);

	ArrayList<pcrProduct> getProductList_time(String pcrCode);

	ArrayList<pcrProduct> getProductList(String pcrCode);

	ArrayList<String> getcategoryList(String pcrCode);

	ArrayList<pcrProduct> getCategoryList_type(@Param(value = "pcrCode") String pcrCode,@Param(value = "prCategory")  String prCategory);

	int deleteProduct(@Param(value = "pcrCode") String pcrCode,@Param(value = "prCode")  String prCode);

	
	

	
}
                  