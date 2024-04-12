package com.pcConSystem.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.pcConSystem.dto.pcRoom;
import com.pcConSystem.service.societyService;

import com.pcConSystem.sockUtil.societySocketHandler;

@Controller
public class societyController {
	@Autowired
	societyService hsvc;
	@Autowired
	HttpSession session;
	
	@Autowired
	private societySocketHandler socSock;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		
		ModelAndView mav = new ModelAndView();
		ArrayList<pcRoom> pcRoomList = new ArrayList<pcRoom>();
		pcRoomList=hsvc.getPCRoomList();
		mav.addObject("pcRoomList",pcRoomList);
		mav.setViewName("society");
		return mav;		
		
	}
	@RequestMapping(value="/getPCRoomList")
	public @ResponseBody String getPCRoomList() {
		ArrayList<pcRoom> pcRoomList = new ArrayList<pcRoom>();
		pcRoomList=hsvc.getPCRoomList();
		return new Gson().toJson(pcRoomList);
		
	}
	@RequestMapping(value="/openPCRoomJoinform")
	public String openPCRoomJoinform() {
		return "openPCRoomJoinform";				
	}
	@RequestMapping(value = "/openPCRoom")
	public @ResponseBody int openPCRoom(String pcrName,String pcrLati,String pcrLong,int pcrSeatsEa) {
		System.out.println("pcrName: "+pcrName);
		System.out.println("pcrLati: "+pcrLati);
		System.out.println("pcrLong: "+pcrLong);
		System.out.println("int pcrSeatsEa :"+pcrSeatsEa);
		pcRoom pcr= new pcRoom();  //피시방 개업 객체생성
		pcr.setPcrLati(pcrLati);
		pcr.setPcrLong(pcrLong);
		pcr.setPcrName(pcrName);
		pcr.setPcrSeatsEa(pcrSeatsEa);
		//피시방지점코드 생성
		String newcode=hsvc.makecode();
		pcr.setPcrCode(newcode);
		int result=	hsvc.openPCRoom(pcr);
		System.out.println(pcr.toString());
		//자리 테이블 생성  (insert) pcrSeatsEa의 갯수만큼 생성
		result+=hsvc.makeSeats(newcode,pcrSeatsEa);
		System.out.println("피시방 자리생성: "+result);
		return result;
	}
	
	
	@RequestMapping(value = "/enterPCRoom") 
	public ModelAndView enterPCRoom(String pcrCode,String seatNum,String act) {
		System.out.println("/enterPCRoom");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("pcrCode",pcrCode);
		mav.addObject("seatNum",seatNum);
		mav.setViewName("/enterPCRoom");
		return mav;
	}

	@RequestMapping(value="/update")
	public @ResponseBody String update() {
		System.err.println("update()");
		ArrayList<HashMap<String, String>> infoList = socSock.getConnPCList();
		System.out.println(infoList);
		
		
		return new Gson().toJson(infoList);
	}
	

	
	
	
	
	
}
