package model;

import java.io.Serializable;

public class VIPPercentage implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private double diamond;
	private double gold;
	private double silver;
	public double getDiamond() {
		return diamond;
	}
	public void setDiamond(double diamond) {
		this.diamond = diamond;
	}
	public double getGold() {
		return gold;
	}
	public void setGold(double gold) {
		this.gold = gold;
	}
	public double getSilver() {
		return silver;
	}
	public void setSilver(double silver) {
		this.silver = silver;
	}
}
