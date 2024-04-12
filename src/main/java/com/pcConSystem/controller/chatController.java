package com.pcConSystem.controller;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pcConSystem.service.pcrChatService;

@Controller
public class chatController {
	@Autowired
	pcrChatService pcsvc;
	
	@RequestMapping(value = "Message")
	public ModelAndView Message(String pcrCode,String memId,String seatNum,String loginTime) {
		ModelAndView mav= new ModelAndView();
		System.err.println("Message");
		//로그인한 타임 가져오기
		ArrayList<HashMap<String,String>> list = new ArrayList<HashMap<String,String>> ();
		String admin =pcrCode+"_admin";
		System.out.println(admin);
		System.out.println(loginTime);
		list =pcsvc.select_chattingLog(pcrCode,admin,memId,loginTime);
		System.out.println(list);
				
		
		mav.addObject("list", list );
		mav.addObject("pcrCode", pcrCode);
		mav.addObject("memId", memId);
		mav.addObject("seatNum", seatNum);
		mav.setViewName("Message");
		return mav;
	}
		

	
	@RequestMapping (value = "/insert_message")
	public @ResponseBody String insert_message(String pcrCode,String receive,String send,String msg) {
		
		System.err.println("/insert_message");
		
		
		 
		return pcsvc.insert_message(pcrCode,receive,send,msg)+"";
		
	}
	
	
	
		
}
