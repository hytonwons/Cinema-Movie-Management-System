package model;

import java.io.Serializable;

public class ActivityAnswer implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int ID;
	private String userID;
	private String movieName;
	private int q1Answer;
	private int q2Answer;
	
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public int getQ1Answer() {
		return q1Answer;
	}
	public void setQ1Answer(int q1Answer) {
		this.q1Answer = q1Answer;
	}
	public int getQ2Answer() {
		return q2Answer;
	}
	public void setQ2Answer(int q2Answer) {
		this.q2Answer = q2Answer;
	}
}
