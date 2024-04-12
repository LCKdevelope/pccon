package com.pcConSystem.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcConSystem.dao.pcrOrderDao;
import com.pcConSystem.dto.pcrOrders;




@Service
public class pcrOrderService {
	/*
	 * @Autowired pcrOrders pcrOrder;
	 */
	@Autowired
	pcrOrderDao odao;

	public int orderUpdateTime(String memId,String pcrCode,String prCode,String seatNum) { //시간충전 만 사용
		int odcount=1;
		String request = "없음";
		//1. 오더코드 생성
		String newCode=createOrdercode(pcrCode);
		pcrOrders odto= new pcrOrders();
		odto.setMemId(memId);
		odto.setPcrCode(pcrCode);
		odto.setOdCode(newCode);
		odto.setPrCode(prCode);
		odto.setSeatNum(seatNum);
		odto.setOdCount(odcount);
		odto.setRequest(request);
		//2. PCRORDERS에 인서트
		return odao.orderProduct(odto);

		
	}
	private String createOrdercode(String pcrCode) {
		String odCode =odao.getOrderCode(pcrCode);
		String od = (String) odCode.subSequence(0,2);
		String Code = (String) odCode.subSequence(2,5);
		System.out.println(od);
		int code = Integer.parseInt(Code);
		code++;
		Code=String.format("%03d", code);
		System.out.println(Code);
		String newCode=od+Code;
		System.err.println(newCode);
		return newCode;
	}
	
	public int orderProduct(String pcrCode, String prCode, int odCount,String seatNum,String request,String memId) {
		String odCode =createOrdercode(pcrCode);
		System.out.println("request: "+request);
		if(request=="") {
			
			request="없음";
		}
		pcrOrders odto= new pcrOrders();
		odto.setPcrCode(pcrCode);
		odto.setOdCode(odCode);
		odto.setPrCode(prCode);
		odto.setSeatNum(seatNum);
		odto.setOdCount(odCount);
		odto.setMemId(memId);
		odto.setRequest(request);
		
		return odao.orderProduct(odto);
	}

}
