package model;

import java.io.Serializable;

public class ValidatePercentage implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private double valid;
	private double cancel;
	private double pause;
	private double stop;
	
	public double getValid() {
		return valid;
	}
	public void setValid(double valid) {
		this.valid = valid;
	}
	public double getCancel() {
		return cancel;
	}
	public void setCancel(double cancel) {
		this.cancel = cancel;
	}
	public double getPause() {
		return pause;
	}
	public void setPause(double pause) {
		this.pause = pause;
	}
	public double getStop() {
		return stop;
	}
	public void setStop(double stop) {
		this.stop = stop;
	}
}
