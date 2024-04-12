package com.pcConSystem.dto;

public class dto {
	private String pcrCode;
	private String sTime;
	private String seatState;
	private String memId;
	private String seatUseProgram;
	private String seatNum;
	
	public String getPcrCode() {
		return pcrCode;
	}

	public void setPcrCode(String pcrCode) {
		this.pcrCode = pcrCode;
	}

	public String getsTime() {
		return sTime;
	}

	public void setsTime(String sTime) {
		this.sTime = sTime;
	}

	public String getSeatState() {
		return seatState;
	}

	public void setSeatState(String seatState) {
		this.seatState = seatState;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getSeatUseProgram() {
		return seatUseProgram;
	}

	public void setSeatUseProgram(String seatUseProgram) {
		this.seatUseProgram = seatUseProgram;
	}

	public String getSeatNum() {
		return seatNum;
	}

	public void setSeatNum(String seatNum) {
		this.seatNum = seatNum;
	}

	@Override
	public String toString() {
		return "dto [pcrCode=" + pcrCode + ", sTime=" + sTime + ", seatState=" + seatState + ", memId=" + memId
				+ ", seatUseProgram=" + seatUseProgram + ", seatNum=" + seatNum + "]";
	}
	
}
