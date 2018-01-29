package model;

import java.io.Serializable;

public class CashCardPercentage implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private double card;
	private double cash;
	public double getCard() {
		return card;
	}
	public void setCard(double card) {
		this.card = card;
	}
	public double getCash() {
		return cash;
	}
	public void setCash(double cash) {
		this.cash = cash;
	}
	
	
}
