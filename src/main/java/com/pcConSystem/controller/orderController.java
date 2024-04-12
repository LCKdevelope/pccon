package com.pcConSystem.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pcConSystem.dto.pcrMembers;
import com.pcConSystem.dto.pcrProduct;
import com.pcConSystem.service.pcrMembersService;
import com.pcConSystem.service.pcrOrderService;
import com.pcConSystem.service.pcrProductrService;



@Controller
public class orderController {
	@Autowired
	pcrOrderService osvc;
	@Autowired
	pcrProductrService psvc;
	@Autowired
	pcrMembersService pmsvc;
	
	
	@RequestMapping(value = "/chargeTimePage")
	public ModelAndView chargeTimePage(String memId,String pcrCode,String seatNum) {
		System.out.println("chargeTimePage()");
		System.out.println("seatNum: " + seatNum);
		System.out.println("memId: " + memId);
		System.out.println("pcrCode: " + pcrCode);
		ModelAndView mav  = new ModelAndView();
		pcrMembers pcrMemberinfo=pmsvc.memberLogin(memId,null,pcrCode);//회원정보 가져오기
		ArrayList<pcrProduct> list=psvc.getProductList_time(pcrCode);  //시간에 따른 리스트 정보 가져오기
		mav.addObject("seatNum", seatNum);
		mav.addObject("list",list);
		mav.addObject("pcrMemberinfo",pcrMemberinfo);
		mav.setViewName("chargeTimePage");
		return mav;		
	}
	@RequestMapping(value = "/chargeTime")
	public @ResponseBody int chargeTime(String memId,double time,String pcrCode,String prCode,String seatNum) {
		System.out.println("chargeTime()");
		System.out.println(memId);
		System.out.println("충전할 시간: "+time);
		System.out.println(pcrCode);
		System.out.println(seatNum);
		
		//피시방 1시간 결제 시 오더 부분에 피시방 1시간 주문번호생성 ,
		int result =osvc.orderUpdateTime(memId,pcrCode,prCode,seatNum);
		
		// 멤버테이블에 피시방 time시간 update 
		result+=pmsvc.chargeTime(pcrCode,memId,time);
		return result;
	}
	@RequestMapping(value="/orderProduct")
	public @ResponseBody int orderProduct(String pcrCode,String prCode, int odCount,String seatNum,String request,String memId) {
		int result = osvc.orderProduct(pcrCode,prCode,odCount,seatNum,request,memId);
		System.out.println("result "+result);
		return result;
		
	}
}
