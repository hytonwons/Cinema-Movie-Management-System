package model;

public class Discount {
	private final static double SILVER_DISCOUNT=0.75;
	private final static double GOLD_DISCOUNT=0.5;
	private final static double DIAMOND_DISCOUNT=0.3;
	public double getSilverDiscount() {
		return SILVER_DISCOUNT;
	}
	public double getGoldDiscount() {
		return GOLD_DISCOUNT;
	}
	public double getDiamondDiscount() {
		return DIAMOND_DISCOUNT;
	}
}
