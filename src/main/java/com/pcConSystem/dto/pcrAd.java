package com.pcConSystem.dto;

public class pcrAd {
	private String pcrCode;
	private String adName;
	private String adId;
	private String adPw;
	private String adHp;
	private String adEmail;
	private String adRight;
	public String getPcrCode() {
		return pcrCode;
	}
	public void setPcrCode(String pcrCode) {
		this.pcrCode = pcrCode;
	}
	public String getAdName() {
		return adName;
	}
	public void setAdName(String adName) {
		this.adName = adName;
	}
	public String getAdId() {
		return adId;
	}
	public void setAdId(String adId) {
		this.adId = adId;
	}
	public String getAdPw() {
		return adPw;
	}
	public void setAdPw(String adPw) {
		this.adPw = adPw;
	}
	public String getAdHp() {
		return adHp;
	}
	public void setAdHp(String adHp) {
		this.adHp = adHp;
	}
	public String getAdEmail() {
		return adEmail;
	}
	public void setAdEmail(String adEmail) {
		this.adEmail = adEmail;
	}
	public String getAdRight() {
		return adRight;
	}
	public void setAdRight(String adRight) {
		this.adRight = adRight;
	}
	@Override
	public String toString() {
		return "pcrAd [pcrCode=" + pcrCode + ", adName=" + adName + ", adId=" + adId + ", adPw=" + adPw + ", adHp="
				+ adHp + ", adEmail=" + adEmail + ", adRight=" + adRight + "]";
	}
	

}
