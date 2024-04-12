package com.pcConSystem.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcConSystem.dao.pcrAdDao;
import com.pcConSystem.dto.dto;
import com.pcConSystem.dto.pcrAd;
import com.pcConSystem.dto.pcrMembers;
import com.pcConSystem.dto.pcrOrders;
import com.pcConSystem.dto.pcrSeats;

@Service
public class pcrAdService {

	@Autowired
	pcrAdDao padao;

	public pcrAd adLogin(String adId, String adPw, String pcrCode) {

		return padao.getAdinfo(adId, adPw, pcrCode);
	}

	public int adJoin(pcrAd pcrAdinfo) {

		return padao.insertAdinfo(pcrAdinfo);
	}

	public String adIdCheck(String adId, String pcrCode) {
		return padao.adIdcheck(adId, pcrCode);
	}

	public ArrayList<dto> getseatlist(String pcrCode) {
		ArrayList<dto> list = padao.getseatlist(pcrCode);
		System.out.println(list);
		for (int i = 0; i < list.size(); i++) {
			String doubl=list.get(i).getsTime();
			if (doubl.equals("0")) {
				System.out.println("continue");
				continue;
			}
			double sTime = Double.parseDouble(list.get(i).getsTime());
			list.get(i).setsTime(convert_sTime_timeString(sTime));
			

		}

		return list;
	}

	public String convert_sTime_timeString(double sTime) {// 로그인 시 남은 시간 변환 3시간 남았을경우 3:00 2시간 24분 - 2:24

		int hours = (int) Math.floor(sTime);
		int minutes = (int) Math.round((sTime - hours) * 60);

		// 시간과 분을 문자열로 조합하여 반환합니다.

		// 시간과 분을 조합하여 시간 문자열을 만듭니다.
		String timeString = hours + "" + ":" + (minutes < 10 ? "0" + minutes + "" : minutes + "");
		System.out.println(timeString);
		return timeString;
	}

	public ArrayList<HashMap<String,String>> getorderlist(String pcrCode) {

		return padao.getorderlist(pcrCode);
	}

	public int updateAdminInfo(pcrAd pcrAdinfo) {

		return padao.updateAdminInfo(pcrAdinfo);
	}

	public ArrayList<pcrAd> getadminList(String pcrCode) {

		return padao.getadminList(pcrCode);
	}

	public int updateAdinfo(pcrAd pcrAdinfo) {

		return padao.updateAdinfo(pcrAdinfo);
	}

	public ArrayList<HashMap<String, String>> getSalesStatistics(String pcrCode, int days) {
		
		return padao.getSalesStatistics(pcrCode,days);
	}
	public ArrayList<HashMap<String, String>> getSalesStatistics_date(String pcrCode, String date) {
		
		return padao.getSalesStatistics_date(pcrCode,date);
	}

	public ArrayList<HashMap<String, String>> getSalesStatistics_month(String pcrCode, String month) {
		
		return padao.getSalesStatistics_month(pcrCode,month);
	}

	public ArrayList<HashMap<String,String>> getLoginIdlist(String pcrCode) {

		return padao.getLoginIdlist(pcrCode);
	}

	public ArrayList<HashMap<String, String>> getChartList_category(String pcrCode,String prCategory,String month) {

		return padao.getChartList_category(pcrCode,prCategory,month);
	}

	public ArrayList<HashMap<String, String>> getChartList_age(String pcrCode, int age) {

		return padao.getChartList_age(pcrCode,age);
	}


}
