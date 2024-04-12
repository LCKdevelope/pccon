package com.pcConSystem.dao;




import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.pcConSystem.dto.pcRoom;


public interface pcrSocietyDao {


	public String selectpcrCode();

	public int insertPCRoom(pcRoom pcr);

	public ArrayList<pcRoom> selectPCRoomList();

	@Select(value = { "SELECT PCRNAME FROM PCROOM WHERE PCRCODE=#{pcrCode}" })
	public String getpcRoomName(String pcrCode);

	@Select(value = { "SELECT * FROM PCROOM WHERE PCRCODE=#{pcrCode}" })
	public pcRoom getpcRoomInfo(String pcrCode);

	public int insertSeats(@Param(value = "pcrCode") String pcrCode,@Param(value = "seatNum") int seatNum);
	
}
                  