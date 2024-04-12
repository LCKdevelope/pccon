package com.pcConSystem.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthOptionPaneUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.pcConSystem.dto.pcrAd;
import com.pcConSystem.dto.pcrMembers;
import com.pcConSystem.dto.pcrProduct;
import com.pcConSystem.dto.pcrSeats;
import com.pcConSystem.service.societyService;
import com.pcConSystem.service.pcrMembersService;
import com.pcConSystem.service.pcrProductrService;

@Controller
public class membersController {

	@Autowired
	pcrMembersService pmsvc;
	@Autowired
	HttpSession session;
	@Autowired
	societyService hsvc;
	@Autowired
	pcrProductrService pdsvc;

	
	@RequestMapping(value = "/memberinfoPage")
	public ModelAndView memberinfoPage(String pcrCode,String memId) {
		System.err.println("memberinfoPage()");
		ModelAndView mav = new ModelAndView();
		pcrMembers pcrMemberinfo=new pcrMembers();
		pcrMemberinfo=pmsvc.memberLogin(memId, null, pcrCode);
		mav.addObject("pcrMemberinfo", pcrMemberinfo);
		mav.addObject("pcrCode", pcrCode);
		mav.addObject("memId", memId);
		mav.setViewName("memberinfoPage");
		return mav;
	}
	
	@RequestMapping(value = "/memberLoginformcheck")
	public @ResponseBody String memberLoginformcheck(String memId, String memPw, String pcrCode) {
		System.err.println("memberLoginformcheck()");
		System.out.println("memId: " + memId);
		System.out.println("memPw: " + memPw);
		System.out.println("pcrCode: " + pcrCode);
		String result = "N";

		pcrMembers pcrMemberinfo=new pcrMembers();
		pcrMemberinfo=pmsvc.memberLogin(memId, memPw, pcrCode);
					  
		
		
		if (pcrMemberinfo ==null) {
			return result;   //로그인 실패시 N리턴
		} else {
			if(pcrMemberinfo.getsTime()>0) {
				return "Y";   //남은 시간이 있으면 Y리턴				
			}else {
				return "noTime";  //남은시간이 없을시 notime리턴
			}
			
		}
	}

	@RequestMapping(value = "/memberLogin")
	public ModelAndView memberLogin(String memId, String memPw, String seatNum, String pcrCode) {
		ModelAndView mav = new ModelAndView();
		System.out.println("memberLogin");
		System.out.println("memId: " + memId);
		System.out.println("pcrCode: " + pcrCode);
		String pcRoomName = hsvc.getpcRoomName(pcrCode);
		pcrMembers pcrMemberinfo = pmsvc.memberLogin(memId, memPw, pcrCode);
		if (pcrMemberinfo != null) {
			System.out.println("로그인성공");
			mav.addObject("seatNum", seatNum);
			//자리 테이블의 상태 업데이트
			session.setAttribute("mempcrCode",pcrCode);
			pmsvc.updateSeat_state(seatNum,pcrCode,memId);  //로그인시간 업데이트
			System.out.println("시작시간: "+pmsvc.selectloginTime(pcrCode,seatNum));
			mav.addObject("loginTime", pmsvc.selectloginTime(pcrCode,seatNum));// 로그인 시간 가져오기
			mav.addObject("pcRoomName", pcRoomName);
			mav.addObject("pcr", pcrMemberinfo);

			mav.setViewName("loginedMonitor");// 바탕화면
		} else {
			System.out.println("로그인실패");
			mav.setViewName("enterPCRoom");//
		}

		return mav;
	}
	@RequestMapping(value="/memberLogout")
	public @ResponseBody int memberLogout(String pcrCode,String seatNum) {
		System.out.println("memberLogout()");		
		
		return pmsvc.updateSeat(seatNum, pcrCode);
	}
	

	@RequestMapping(value = "/memberJoinForm")
	public ModelAndView memberJoinForm(String pcrCode) {
		ModelAndView mav = new ModelAndView();
		System.out.println("손님 회원가입창 ");
		mav.addObject("pcrCode",pcrCode);
		mav.setViewName("memberJoinForm");
		return mav;

	}

	@RequestMapping(value = "/memberIdCheck")
	public @ResponseBody String memberIdCheck(String memId,String pcrCode) {
		System.out.println("memId: " + memId);

		String result = "N";

		if (memId == "") {
			return "N";
		}
		result = pmsvc.memberIdCheck(memId, pcrCode);
		if (result == null) {
			return "Y";
		} else {
			return result;
		}

	}

	@RequestMapping(value = "/memberJoin")
	public ModelAndView memberJoin(pcrMembers pcrMembersInfo) {
		ModelAndView mav = new ModelAndView();
		System.out.println("손님 회원가입 "); // 팝업
		pcrMembersInfo.setsTime(0);
		pcrMembersInfo.setMemo("");

		int result = pmsvc.memberJoin(pcrMembersInfo);
		if (result >= 1) {
			System.out.println("회원가입 완료");
			mav.addObject("idCreated", "create");
			mav.setViewName("memberJoinForm");
		} else {

		}

		return mav;

	}
	@RequestMapping(value = "/get_sTime")
	public @ResponseBody String get_sTime(String pcrCode,String memId) {
		System.err.println("get_sTime()");
		
		double result=pmsvc.getsTime(pcrCode,memId);
		System.out.println("result: "+result);
		return result+"";
	}
	@RequestMapping(value = "execute")
	public ModelAndView execute(String pcrCode,String memId,String seatNum, String seatUseProgram) {
		ModelAndView mav= new ModelAndView();
		mav.addObject("pcrCode", pcrCode);
		mav.addObject("memId", memId);
		mav.addObject("seatNum", seatNum);
		mav.addObject("seatUseProgram", seatUseProgram);
		if(seatUseProgram.equals("Naver")) {
			mav.setViewName("Naver");			
		}else if(seatUseProgram.equals("Youtube")) {
			mav.setViewName("Youtube");			
		}else if(seatUseProgram.equals("LeagueOfLegeond")) {
			mav.setViewName("LeagueOfLegeond");			
		}else if(seatUseProgram.equals("KakaoTalk")) {
			mav.setViewName("KakaoTalk");			
		}else if(seatUseProgram.equals("Discord")) {
			mav.setViewName("Discord");			
		}
		
		
		
		return mav;
	}
	
	@RequestMapping (value = "/updateMemberInfo")
	public ModelAndView updateMemberInfo(pcrMembers pcrMembersInfo) {
		ModelAndView mav =new ModelAndView();
		int result = pmsvc.updateMemberInfo(pcrMembersInfo);
		mav.addObject("update", result);
		mav.setViewName("memberinfoPage");
		return mav;
	}
	
	@RequestMapping(value = "/productOrderPage")
	public ModelAndView productOrderPage(String pcrCode,String memId,String seatNum) {
		ModelAndView mav =new ModelAndView();
		ArrayList<pcrProduct> prList = pdsvc.getProductList(pcrCode);
		ArrayList<String> categoryList = pdsvc.getcategoryList(pcrCode);
		System.out.println();
		System.out.println(prList.toString());
		System.out.println(categoryList.toString());
		mav.addObject("categoryList", categoryList);
		mav.addObject("prList_gson", new Gson().toJson(prList));
		
		mav.addObject("prList", prList);
		mav.addObject("pcrCode", pcrCode);
		mav.addObject("seatNum", seatNum);
		mav.addObject("memId", memId);
		
		mav.setViewName("productOrderPage");
		return mav;
	}
	

	
	
	

}
