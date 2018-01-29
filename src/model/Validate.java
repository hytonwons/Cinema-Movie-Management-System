package model;

import java.io.Serializable;
import java.sql.Date;

public class Validate implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String userID;
	private Date validDate;
	private int cancel;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public Date getValidDate() {
		return validDate;
	}
	public void setValidDate(Date validDate) {
		this.validDate = validDate;
	}
	public int getCancel() {
		return cancel;
	}
	public void setCancel(int cancel) {
		this.cancel = cancel;
	}
}
