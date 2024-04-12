package com.pcConSystem.dto;

public class pcrOrders {
	private String pcrCode;
	private String odCode;
	private String prCode;
	private String seatNum;
	private String memId;
	private int odCount;
	private String request;
	private String odDate;
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getOdDate() {
		return odDate;
	}
	public void setOdDate(String odDate) {
		this.odDate = odDate;
	}
	public String getPcrCode() {
		return pcrCode;
	}
	public void setPcrCode(String pcrCode) {
		this.pcrCode = pcrCode;
	}
	public String getOdCode() {
		return odCode;
	}
	public void setOdCode(String odCode) {
		this.odCode = odCode;
	}
	public String getPrCode() {
		return prCode;
	}
	public void setPrCode(String prCode) {
		this.prCode = prCode;
	}
	public String getSeatNum() {
		return seatNum;
	}
	public void setSeatNum(String seatNum) {
		this.seatNum = seatNum;
	}
	public int getOdCount() {
		return odCount;
	}
	public void setOdCount(int odCount) {
		this.odCount = odCount;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	@Override
	public String toString() {
		return "pcrOrders [pcrCode=" + pcrCode + ", odCode=" + odCode + ", prCode=" + prCode + ", seatNum=" + seatNum
				+ ", memId=" + memId + ", odCount=" + odCount + ", request=" + request + ", odDate=" + odDate + "]";
	}
	
}
