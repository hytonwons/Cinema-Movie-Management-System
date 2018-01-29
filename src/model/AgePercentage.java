package model;

import java.io.Serializable;

public class AgePercentage implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private double teens;
	private double twenties;
	private double thirties;
	private double forties;
	private double fifties;
	private double elderly;
	public double getTeens() {
		return teens;
	}
	public void setTeens(double teens) {
		this.teens = teens;
	}
	public double getTwenties() {
		return twenties;
	}
	public void setTwenties(double twenties) {
		this.twenties = twenties;
	}
	public double getThirties() {
		return thirties;
	}
	public void setThirties(double thirties) {
		this.thirties = thirties;
	}
	public double getForties() {
		return forties;
	}
	public void setForties(double forties) {
		this.forties = forties;
	}
	public double getFifties() {
		return fifties;
	}
	public void setFifties(double fifties) {
		this.fifties = fifties;
	}
	public double getElderly() {
		return elderly;
	}
	public void setElderly(double elderly) {
		this.elderly = elderly;
	}
}
