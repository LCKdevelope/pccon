package com.pcConSystem.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.pcConSystem.dto.dto;
import com.pcConSystem.dto.pcrAd;
import com.pcConSystem.dto.pcrOrders;

public interface pcrChatDao {

	public int insert_message(@Param(value = "pcrCode") String pcrCode, @Param(value = "receive") String receive,
			@Param(value = "send") String send, @Param(value = "msg") String msg);

	public ArrayList<HashMap<String, String>> select_chattingLog(@Param(value = "pcrCode") String pcrCode,
			@Param(value = "ad") String admin, @Param(value = "guest") String guest,
			@Param(value = "loginTime") String loginTime);

}
