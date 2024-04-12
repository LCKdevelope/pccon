package com.pcConSystem.dto;

public class pcRoom {
	private String pcrCode;
	private String pcrName;
	private String pcrLati;
	private String pcrLong;
	private int pcrSeatsEa;

	public String getPcrCode() {
		return pcrCode;
	}

	public void setPcrCode(String pcrCode) {
		this.pcrCode = pcrCode;
	}

	public String getPcrName() {
		return pcrName;
	}

	public void setPcrName(String pcrName) {
		this.pcrName = pcrName;
	}

	public String getPcrLati() {
		return pcrLati;
	}

	public void setPcrLati(String pcrLati) {
		this.pcrLati = pcrLati;
	}

	public String getPcrLong() {
		return pcrLong;
	}

	public void setPcrLong(String pcrLong) {
		this.pcrLong = pcrLong;
	}

	public int getPcrSeatsEa() {
		return pcrSeatsEa;
	}

	public void setPcrSeatsEa(int pcrSeatsEa) {
		this.pcrSeatsEa = pcrSeatsEa;
	}

	@Override
	public String toString() {
		return "pcRoom [pcrCode=" + pcrCode + ", pcrName=" + pcrName + ", pcrLati=" + pcrLati + ", pcrLong=" + pcrLong
				+ ", pcrSeatsEa=" + pcrSeatsEa + "]";
	}
	

}
