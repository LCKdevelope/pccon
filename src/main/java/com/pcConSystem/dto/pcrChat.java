package com.pcConSystem.dto;

public class pcrChat {
	private String pcrCode;
	private String receive;
	private String send;
	private String msg;
	private String msgTime;
	public String getPcrCode() {
		return pcrCode;
	}
	public void setPcrCode(String pcrCode) {
		this.pcrCode = pcrCode;
	}
	public String getReceive() {
		return receive;
	}
	public void setReceive(String receive) {
		this.receive = receive;
	}
	public String getSend() {
		return send;
	}
	public void setSend(String send) {
		this.send = send;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getMsgTime() {
		return msgTime;
	}
	public void setMsgTime(String msgTime) {
		this.msgTime = msgTime;
	}
	@Override
	public String toString() {
		return "pcChat [pcrCode=" + pcrCode + ", receive=" + receive + ", send=" + send + ", msg=" + msg + ", msgTime="
				+ msgTime + "]";
	}
	

}
