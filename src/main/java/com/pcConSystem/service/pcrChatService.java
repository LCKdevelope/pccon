package com.pcConSystem.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcConSystem.dao.pcrChatDao;
import com.pcConSystem.dao.pcrSocietyDao;
import com.pcConSystem.dto.pcRoom;

@Service
public class pcrChatService {
	@Autowired
	pcrChatDao pcdao; 

	public int insert_message(String pcrCode,String receive, String send, String msg) {
		return pcdao.insert_message(pcrCode,receive,send,msg);		
		
	}

	public ArrayList<HashMap<String, String>> select_chattingLog(String pcrCode, String admin, String guest, String loginTime) {
		// TODO Auto-generated method stub
		return pcdao.select_chattingLog(pcrCode,admin,guest,loginTime);
	}
	
}
