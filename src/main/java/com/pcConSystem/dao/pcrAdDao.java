package com.pcConSystem.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.pcConSystem.dto.dto;
import com.pcConSystem.dto.pcrAd;
import com.pcConSystem.dto.pcrOrders;

public interface pcrAdDao {

	public pcrAd getAdinfo(@Param(value = "adId") String adId, @Param(value = "adPw") String adPw,@Param(value = "pcrCode") String pcrCode);

	public int insertAdinfo(pcrAd pcrAdinfo);

	@Select(value = { "SELECT ADID FROM PCRAD WHERE ADID=#{adId} AND PCRCODE=#{pcrCode}" })
	public String adIdcheck(@Param(value = "adId") String adId,@Param(value = "pcrCode") String pcrCode);

	public ArrayList<dto> getseatlist(String pcrCode);

	public ArrayList<HashMap<String,String>> getorderlist(String pcrCode);

	public int updateAdminInfo(pcrAd pcrAdinfo);

	public ArrayList<pcrAd> getadminList(String pcrCode);

	public int updateAdinfo(pcrAd pcrAdinfo);

	public ArrayList<HashMap<String, String>> getSalesStatistics(@Param(value = "pcrCode") String pcrCode,@Param(value = "days") int days);
	
	public ArrayList<HashMap<String, String>> getSalesStatistics_date(@Param(value = "pcrCode") String pcrCode,@Param(value = "date") String date);

	public ArrayList<HashMap<String, String>> getSalesStatistics_month(@Param(value = "pcrCode") String pcrCode,@Param(value = "month") String month);

	public ArrayList<HashMap<String,String>> getLoginIdlist(String pcrCode);

	public ArrayList<HashMap<String, String>> getChartList_category(@Param(value = "pcrCode") String pcrCode,@Param(value = "prCategory") String prCategory, @Param(value = "month")String month);

	public ArrayList<HashMap<String, String>> getChartList_age(@Param(value = "pcrCode")String pcrCode,@Param(value = "age") int age);
	
}
                  