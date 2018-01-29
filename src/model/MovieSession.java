package model;

import java.io.Serializable;
import java.sql.Date;

public class MovieSession implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int ID;
	private Date date;
	private String movieName;
	private String startTime;
	private int hallNum;
	private int leftSeat;
	private int price;
	
	public int getID() {
		return ID;
	}
	public void setID(int ID) {
		this.ID = ID;
	}
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	
	public int getHallNum() {
		return hallNum;
	}
	public void setHallNum(int hallNum) {
		this.hallNum = hallNum;
	}
	
	public int getLeftSeat() {
		return leftSeat;
	}
	public void setLeftSeat(int leftSeat) {
		this.leftSeat = leftSeat;
	}
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
