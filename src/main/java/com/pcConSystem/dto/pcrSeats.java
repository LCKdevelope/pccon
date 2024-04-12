package com.pcConSystem.dto;

public class pcrSeats {
	private String pcrCode;
	private String seatNum;
	private String seatState;
	private String seatUseProgram;
	private String seatDate;
	private String memId;
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getPcrCode() {
		return pcrCode;
	}
	public void setPcrCode(String pcrCode) {
		this.pcrCode = pcrCode;
	}
	public String getSeatNum() {
		return seatNum;
	}
	public void setSeatNum(String seatNum) {
		this.seatNum = seatNum;
	}
	public String getSeatState() {
		return seatState;
	}
	public void setSeatState(String seatState) {
		this.seatState = seatState;
	}
	public String getSeatUseProgram() {
		return seatUseProgram;
	}
	public void setSeatUseProgram(String seatUseProgram) {
		this.seatUseProgram = seatUseProgram;
	}
	public String getSeatDate() {
		return seatDate;
	}
	public void setSeatDate(String seatDate) {
		this.seatDate = seatDate;
	}
	@Override
	public String toString() {
		return "pcrSeats [pcrCode=" + pcrCode + ", seatNum=" + seatNum + ", seatState=" + seatState
				+ ", seatUseProgram=" + seatUseProgram + ", seatDate=" + seatDate + ", memId=" + memId + "]";
	}
	

}
