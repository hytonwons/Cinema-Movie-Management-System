package model;

public class Age {
	private final static String TEENS = "10~20岁";
	private final static String TWENTIES = "20~30岁";
	private final static String THIRTIES = "30~40岁";
	private final static String FORTIES = "40~50岁";
	private final static String FIFTIES = "50~60岁";
	private final static String ELDERLY = "60岁以上";
	
	public String getTeens() {
		return TEENS;
	}

	public String getTwenties() {
		return TWENTIES;
	}

	public String getThirties() {
		return THIRTIES;
	}

	public String getForties() {
		return FORTIES;
	}

	public String getFifties() {
		return FIFTIES;
	}

	public String getElderly() {
		return ELDERLY;
	}
}
