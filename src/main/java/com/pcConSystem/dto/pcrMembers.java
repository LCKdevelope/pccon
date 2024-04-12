package com.pcConSystem.dto;

public class pcrMembers {
	private String pcrCode;
	private String memId;
	private String memPw;
	private String memName;
	private String memEmail;
	private int memAge;
	private String memHp;
	private double sTime;//남은시간
	private String memo;
	
	
	public String getPcrCode() {
		return pcrCode;
	}
	public void setPcrCode(String pcrCode) {
		this.pcrCode = pcrCode;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public int getMemAge() {
		return memAge;
	}
	public void setMemAge(int memAge) {
		this.memAge = memAge;
	}
	public String getMemHp() {
		return memHp;
	}
	public void setMemHp(String memHp) {
		this.memHp = memHp;
	}
	public double getsTime() {
		return sTime;
	}
	public void setsTime(double sTime) {
		this.sTime = sTime;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	@Override
	public String toString() {
		return "pcrMembers [pcrCode=" + pcrCode + ", memId=" + memId + ", memPw=" + memPw + ", memName=" + memName
				+ ", memEmail=" + memEmail + ", memAge=" + memAge + ", memHp=" + memHp + ", sTime=" + sTime + ", memo="
				+ memo + "]";
	}
	
}
