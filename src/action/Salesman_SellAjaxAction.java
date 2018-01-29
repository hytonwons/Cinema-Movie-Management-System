package action;

import service.RegisterInfoService;
import service.RemainderService;

import com.opensymphony.xwork2.ActionSupport;

public class Salesman_SellAjaxAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//从jsp页面得到的数据
	private String ID;
	
	//即将传给jsp页面的数据
	private double discount;
	private int remainder;
	
	private RegisterInfoService service1;
	private RemainderService service2;

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public RegisterInfoService getService1() {
		return service1;
	}

	public void setService1(RegisterInfoService service1) {
		this.service1 = service1;
	}

	public RemainderService getService2() {
		return service2;
	}

	public void setService2(RemainderService service2) {
		this.service2 = service2;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public int getRemainder() {
		return remainder;
	}

	public void setRemainder(int remainder) {
		this.remainder = remainder;
	}	
	
	public String execute()throws Exception{
		setRemainder(service2.getRemainder(ID));
		setDiscount(service1.getDiscount(ID));
		return SUCCESS;
	}
}
