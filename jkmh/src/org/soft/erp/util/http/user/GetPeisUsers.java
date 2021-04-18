package org.soft.erp.util.http.user;

import java.util.List;

public class GetPeisUsers {
	private int code;
	private String msg;
	List<PeisUser> usersInfoList;
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public List<PeisUser> getUsersInfoList() {
		return usersInfoList;
	}
	public void setUsersInfoList(List<PeisUser> usersInfoList) {
		this.usersInfoList = usersInfoList;
	}



	

}
