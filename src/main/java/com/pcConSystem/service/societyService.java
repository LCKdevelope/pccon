package com.pcConSystem.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcConSystem.dao.pcrSocietyDao;
import com.pcConSystem.dto.pcRoom;

@Service
public class societyService {
	@Autowired
	pcrSocietyDao hdao;

	public String makecode() {
		String pcr = "pcr";
		String pcrcode = hdao.selectpcrCode();
		String odNum = pcrcode.replace("pcr",""); //pcr000
		int Num = Integer.parseInt(odNum);//0
		Num++;//1
		String newcode = String.format("%03d", Num);//001
		String newodcode = pcr + newcode; //pcr001
		System.out.println(newodcode);
		return newodcode;

	}

	public int openPCRoom(pcRoom pcr) {
		
		return hdao.insertPCRoom(pcr);
	}

	public ArrayList<pcRoom> getPCRoomList() {

		return hdao.selectPCRoomList();
	}

	public String getpcRoomName(String pcrCode) {
		// TODO Auto-generated method stub
		return hdao.getpcRoomName(pcrCode);
	}

	public pcRoom getpcRoomInfo(String pcrCode) {
		
		return hdao.getpcRoomInfo(pcrCode);
	}

	public int makeSeats(String pcrCode,int pcrSeatEa) {
		int result =0;
		for(int seatNum=1;seatNum<=pcrSeatEa;seatNum++) {
			result+=hdao.insertSeats(pcrCode,seatNum);
			
		}
		
		return result;
	}

}
