package com.pcConSystem.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.pcConSystem.dto.pcrAd;
import com.pcConSystem.dto.pcrMembers;

public interface pcrMemberDao {

	pcrMembers getmemberInfo(@Param(value = "memId") String memId, @Param(value = "memPw") String memPw, @Param(value = "pcrCode") String pcrCode);

	int insertmember(pcrMembers pcrMembersInfo);

	@Select(value = { "SELECT MEMID FROM PCRMEMBERS WHERE MEMID=#{memId} AND PCRCODE=#{pcrCode}" })
	String memberIdCheck(@Param(value = "memId")String memId,@Param(value = "pcrCode") String pcrCode);

	Object getProductList_time(String pcrCode);

	int chargeTime(@Param(value = "pcrCode")String pcrCode,@Param(value = "memId") String memId,@Param(value = "time") double time);

	int updateSeat_state_login(@Param(value = "seatNum")String seatNum,@Param(value = "pcrCode") String pcrCode,@Param(value = "memId") String memId);

	int updateSeat_state_logout(@Param(value = "seatNum")String seatNum,@Param(value = "pcrCode") String pcrCode);

	int update_seat_clean(@Param(value = "seatNum")int seatNum,@Param(value = "pcrCode") String pcrCode);

	int update_time(@Param(value = "pcrCode")String pcrCode,@Param(value = "memId") String memId,@Param(value = "sTime") String sTime);

	double getsTime(@Param(value = "pcrCode") String pcrCode,@Param(value = "memId") String memId);

	String selectloginTime(@Param(value = "pcrCode") String pcrCode,@Param(value = "seatNum") String seatNum);

	int updateMemberInfo(pcrMembers pcrMembersInfo);

	ArrayList<pcrMembers> getmemberList(String pcrCode);

	
}
                  