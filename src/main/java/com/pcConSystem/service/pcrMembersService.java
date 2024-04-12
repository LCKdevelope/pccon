package com.pcConSystem.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcConSystem.dao.pcrMemberDao;
import com.pcConSystem.dto.pcrAd;
import com.pcConSystem.dto.pcrMembers;

@Service
public class pcrMembersService {

	@Autowired
	pcrMemberDao pmdao;
	
	public pcrMembers memberLogin(String memId,String memPw, String pcrCode) {

		return pmdao.getmemberInfo(memId,memPw,pcrCode);
	}

	public int memberJoin(pcrMembers pcrMembersInfo) {
		// TODO Auto-generated method stub
		return pmdao.insertmember(pcrMembersInfo);
	}

	public String memberIdCheck(String memId, String pcrCode) {
		return pmdao.memberIdCheck(memId,pcrCode);
	}

	public int chargeTime(String pcrCode, String memId, double time) {
		
		return pmdao.chargeTime(pcrCode,memId,time);
	}

	public int updateSeat_state(String seatNum, String pcrCode ,String memId) {
		return pmdao.updateSeat_state_login(seatNum,pcrCode,memId);		
	}

	public int updateSeat(String seatNum, String pcrCode) {
		
		return pmdao.updateSeat_state_logout(seatNum,pcrCode);
	}

	public int update_seat_clean(String  pcrCode, int seatNum) {

		return pmdao.update_seat_clean(seatNum,pcrCode);
	}

	public int update_time(String pcrCode, String memId, String sTime) {

		return pmdao.update_time(pcrCode,memId,sTime);
	}

	public double getsTime(String pcrCode, String memId) {

		return pmdao.getsTime(pcrCode,memId);
	}

	public String selectloginTime(String pcrCode, String seatNum) {
		return pmdao.selectloginTime(pcrCode,seatNum);
		
	}

	public int updateMemberInfo(pcrMembers pcrMembersInfo) {
		System.err.println(pcrMembersInfo.toString());

		return pmdao.updateMemberInfo(pcrMembersInfo) ;
	}

	public ArrayList<pcrMembers> getmemberList(String pcrCode) {

		return pmdao.getmemberList(pcrCode);
	}

	


}
