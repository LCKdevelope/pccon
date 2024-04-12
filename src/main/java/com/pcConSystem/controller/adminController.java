package com.pcConSystem.controller;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.pcConSystem.dto.dto;
import com.pcConSystem.dto.pcRoom;
import com.pcConSystem.dto.pcrAd;
import com.pcConSystem.dto.pcrMembers;
import com.pcConSystem.dto.pcrOrders;
import com.pcConSystem.dto.pcrProduct;
import com.pcConSystem.dto.pcrSeats;
import com.pcConSystem.service.societyService;
import com.pcConSystem.service.pcrAdService;
import com.pcConSystem.service.pcrMembersService;
import com.pcConSystem.service.pcrProductrService;

@Controller
public class adminController {
	@Autowired
	pcrProductrService pdsvc;

	@Autowired
	pcrAdService pasvc;
	@Autowired
	HttpSession session;
	@Autowired
	societyService hsvc;
	@Autowired
	pcrMembersService pmsvc;

	
	
	@RequestMapping(value = "/getChartList_age")
	public @ResponseBody String getChartList_age(String pcrCode,int age) {
		System.err.println("/getChartList_age");
		ArrayList<HashMap<String,String>> list = pasvc.getChartList_age(pcrCode,age);
		System.out.println(list.toString());

		return new Gson().toJson(list);
		
	}

	
	@RequestMapping(value = "/getChartList_category")
	public @ResponseBody String getChartList_category(String pcrCode,String prCategory,String month) {
		System.err.println("/getChartList_category");
		ArrayList<HashMap<String,String>> list = pasvc.getChartList_category(pcrCode,prCategory,month);
		System.out.println(list.toString());

		return new Gson().toJson(list);
		
	}
		
	
	@RequestMapping(value = "/getLoginIdlist")
	public @ResponseBody String getLoginIdlist(String pcrCode) {
		System.err.println("/getLoginIdlist");

		ArrayList<HashMap<String,String>> list = pasvc.getLoginIdlist(pcrCode);
		System.out.println(list.toString());

		return new Gson().toJson(list);
	}

	@RequestMapping(value = "/getChartList_month")
	public @ResponseBody String getChartList_month(String pcrCode, String month) {
		System.err.println("getChartList");
		System.out.println("month " + month);

		ArrayList<HashMap<String, String>> list = pasvc.getSalesStatistics_month(pcrCode, month);

		return new Gson().toJson(list);
	}

	@RequestMapping(value = "/getChartList")
	public @ResponseBody String getChartList(String pcrCode, String date) {
		System.err.println("getChartList");
		System.out.println("date " + date);

		ArrayList<HashMap<String, String>> list = pasvc.getSalesStatistics_date(pcrCode, date);

		return new Gson().toJson(list);
	}

	@RequestMapping(value = "/salesStatisticsPage")
	public ModelAndView salesStatisticsPage(String pcrCode) {
		ModelAndView mav = new ModelAndView();
		System.err.println("salesStatisticsPage");
		int days = 0;
		ArrayList<HashMap<String, String>> list = pasvc.getSalesStatistics(pcrCode, days);
		ArrayList<String> categoryList=pdsvc.getcategoryList(pcrCode);
		System.out.println(categoryList.toString());
		mav.addObject("categoryList_gson", new Gson().toJson(categoryList));
		mav.addObject("categoryList", categoryList);
		mav.addObject("list", new Gson().toJson(list));
		mav.addObject("pcrCode", pcrCode);
		mav.setViewName("salesStatisticsPage");
		return mav;

	}

	@RequestMapping(value = "/adminInfoPage")
	public ModelAndView adminInfoPage(String pcrCode, String adId) {
		System.err.println("adminInfoPage()");
		System.err.println(pcrCode);
		System.err.println(adId);
		ModelAndView mav = new ModelAndView();
		pcrAd pcrAdinfo = new pcrAd();
		pcrAdinfo = pasvc.adLogin(adId, null, pcrCode);
		System.out.println(pcrAdinfo.toString());
		mav.addObject("pcrAdinfo", pcrAdinfo);
		mav.setViewName("adminInfoPage");
		return mav;
	}

	@RequestMapping(value = "/adminLoginForm")
	public ModelAndView adminLoginForm(String pcrCode) {
		System.err.println("adminLoginForm() ");
		ModelAndView mav = new ModelAndView();
		System.out.println(pcrCode);

		mav.addObject("pcrCode", pcrCode);
		mav.setViewName("adminLoginForm");
		return mav;
	}

	@RequestMapping(value = "/adLogin")
	public ModelAndView adLogin(String adId, String adPw, String pcrCode) {
		System.err.println("adLogin() ");
		ModelAndView mav = new ModelAndView();
		pcrAd pcrAdinfo = pasvc.adLogin(adId, adPw, pcrCode);
		pcRoom pcRoomInfo = hsvc.getpcRoomInfo(pcrCode);
		ArrayList<dto> seatlist = new ArrayList<dto>(); // 자리리스트불러오기
		ArrayList<HashMap<String, String>> odlist = new ArrayList<HashMap<String, String>>();
		odlist = pasvc.getorderlist(pcrCode);
		seatlist = pasvc.getseatlist(pcrCode);
		session.setAttribute("AdminpcrCode", pcrCode);
		mav.addObject("odlist", odlist);
		mav.addObject("seatlist", seatlist);
		mav.addObject("pcRoomInfo", pcRoomInfo);
		mav.addObject("pcrAdinfo", pcrAdinfo);
		mav.setViewName("adminPage");

		return mav;
	}

	@RequestMapping(value = "/adLoginformcheck")
	public @ResponseBody String adLoginformcheck(String adId, String adPw, String pcrCode) {
		System.err.println("adLoginformcheck()");
		pcrAd pcrAdinfo = pasvc.adLogin(adId, adPw, pcrCode);
		if (pcrAdinfo != null) {
			System.out.println("로그인성공");
			return "Y";
		} else {
			System.out.println("로그인실패");
			return "N";
		}

	}

	@RequestMapping(value = "/adminJoinForm")
	public ModelAndView adminJoinForm(String pcrCode) {
		System.err.println("adminJoinForm(");
		ModelAndView mav = new ModelAndView();

		System.out.println("pcrCode: " + pcrCode);
		mav.addObject("pcrCode", pcrCode);
		mav.setViewName("adminJoinForm");
		return mav;

	}

	@RequestMapping(value = "/adminJoin")
	public ModelAndView adminJoin(pcrAd pcrAdinfo) {
		System.err.println("adminJoin() ");
		ModelAndView mav = new ModelAndView();
		pcrAdinfo.setAdRight("CEO");// 기본값 N

		int result = pasvc.adJoin(pcrAdinfo);
		if (result >= 1) {
			System.out.println("회원가입 완료");
		} else {

		}
		mav.addObject("idCreated", "create");
		mav.setViewName("adminJoinForm");
		return mav;

	}

	@RequestMapping(value = "/adIdCheck")
	public @ResponseBody String adIdCheck(String adId, String pcrCode) {
		System.err.println("adIdCheck()");
		String pcrAdinfo = pasvc.adIdCheck(adId, pcrCode);

		return pcrAdinfo;
	}

	@RequestMapping(value = "/update_seat_clean")
	public @ResponseBody int update_seat_clean(String pcrCode, String seatNum, String seatState) {
		System.err.println("update_seat_clean()");
		System.out.println("pcrCode " + pcrCode);
		System.out.println("seatNum " + seatNum);
		int newseatNum = Integer.parseInt(seatNum.replaceAll("[^0-9]", ""));

		return pmsvc.update_seat_clean(pcrCode, newseatNum);

	}

	@RequestMapping(value = "/update_time")
	public @ResponseBody int update_time_for1minute(String pcrCode, String memId, String sTime) {
		System.err.println("update_time()");
		System.out.println("pcrCode " + pcrCode);
		System.out.println("memId " + memId);
		System.out.println("sTime " + sTime);
		if (sTime == null) {
			System.err.println("sTime이 null일경우 리턴");
			return 0;

		}
		return pmsvc.update_time(pcrCode, memId, sTime);
	}

	@RequestMapping(value = "/getOdlist")
	public @ResponseBody String getOdlist(String pcrCode) {
		ArrayList<HashMap<String, String>> list = pasvc.getorderlist(pcrCode);
		return new Gson().toJson(list);

	}

	@RequestMapping(value = "/updateAdminInfo")
	public ModelAndView updateAdminInfo(pcrAd pcrAdinfo) {
		ModelAndView mav = new ModelAndView();
		int result = pasvc.updateAdminInfo(pcrAdinfo);
		mav.addObject("update", result);
		mav.setViewName("adminInfoPage");
		return mav;
	}

	@RequestMapping(value = "/adminChangeRight")
	public ModelAndView adminChangeRight(String pcrCode) {
		ModelAndView mav = new ModelAndView();
		ArrayList<pcrAd> adminList = pasvc.getadminList(pcrCode);
		System.out.println(adminList);

		mav.addObject("adminList", adminList);

		mav.setViewName("adminChangeRight");
		return mav;
	}

	@RequestMapping(value = "/adminChangeMemberInfo")
	public ModelAndView adminChangeMemberInfo(String pcrCode) {
		ModelAndView mav = new ModelAndView();
		ArrayList<pcrMembers> memberList = pmsvc.getmemberList(pcrCode);
		mav.addObject("memberList", memberList);

		mav.setViewName("adminChangeMemberInfo");
		return mav;
	}

	@RequestMapping(value = "/updateAdinfo")
	public ModelAndView updateAdinfo(pcrAd pcrAdinfo) {
		ModelAndView mav = new ModelAndView();

		pasvc.updateAdinfo(pcrAdinfo);
		mav.addObject("adminList", null);
		mav.setViewName("adminChangeRight");
		return mav;
	}

	@RequestMapping(value = "/updateMemberinfo")
	public ModelAndView updateMemberinfo(pcrMembers pcrMemberInfo) {
		ModelAndView mav = new ModelAndView();

		pmsvc.updateMemberInfo(pcrMemberInfo);
		mav.addObject("memberList", null);
		mav.setViewName("adminChangeMemberInfo");
		return mav;
	}

}
