package model;

import java.io.Serializable;

public class GenderPercentage implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private double man;
	private double woman;
	public double getMan() {
		return man;
	}
	public void setMan(double man) {
		this.man = man;
	}
	public double getWoman() {
		return woman;
	}
	public void setWoman(double woman) {
		this.woman = woman;
	}
}
