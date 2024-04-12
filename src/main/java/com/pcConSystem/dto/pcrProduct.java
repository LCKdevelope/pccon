package com.pcConSystem.dto;

public class pcrProduct {
	private String pcrCode;
	private String prCode;
	private String prName;
	private int prPrice;
	private String prState;
	private String prCategory;
	private String prImg;
	public String getPcrCode() {
		return pcrCode;
	}
	public void setPcrCode(String pcrCode) {
		this.pcrCode = pcrCode;
	}
	public String getPrCode() {
		return prCode;
	}
	public void setPrCode(String prCode) {
		this.prCode = prCode;
	}
	public String getPrName() {
		return prName;
	}
	public void setPrName(String prName) {
		this.prName = prName;
	}
	public int getPrPrice() {
		return prPrice;
	}
	public void setPrPrice(int prPrice) {
		this.prPrice = prPrice;
	}
	public String getPrState() {
		return prState;
	}
	public void setPrState(String prState) {
		this.prState = prState;
	}
	public String getPrCategory() {
		return prCategory;
	}
	public void setPrCategory(String prCategory) {
		this.prCategory = prCategory;
	}
	public String getPrImg() {
		return prImg;
	}
	public void setPrImg(String prImg) {
		this.prImg = prImg;
	}
	@Override
	public String toString() {
		return "pcrProduct [pcrCode=" + pcrCode + ", prCode=" + prCode + ", prName=" + prName + ", prPrice=" + prPrice
				+ ", prState=" + prState + ", prCategory=" + prCategory + ", prImg=" + prImg + "]";
	}
	
	
}
