package model;

import java.io.Serializable;

public class Remainder implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String userID;
	private int money;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
}
