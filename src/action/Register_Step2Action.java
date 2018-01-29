package action;

import java.util.Calendar;
import java.util.Date;

import model.Payment;
import model.Remainder;
import model.Validate;
import service.PaymentService;
import service.RegisterInfoService;
import service.RemainderService;
import service.ValidateService;

import com.opensymphony.xwork2.ActionSupport;

public class Register_Step2Action extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String ID;
	private int optionsRadios;
	
	private RegisterInfoService service1;
	private PaymentService service2;
	Payment p = new Payment();
	private RemainderService service3;
	Remainder r = new Remainder();
	private ValidateService service4;
	Validate v = new Validate();
	
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
	public PaymentService getService2() {
		return service2;
	}
	public void setService2(PaymentService service2) {
		this.service2 = service2;
	}
	public RemainderService getService3() {
		return service3;
	}
	public void setService3(RemainderService service3) {
		this.service3 = service3;
	}
	public ValidateService getService4() {
		return service4;
	}
	public void setService4(ValidateService service4) {
		this.service4 = service4;
	}
	public int getOptionsRadios() {
		return optionsRadios;
	}
	public void setOptionsRadios(int optionsRadios) {
		this.optionsRadios = optionsRadios;
	}
	
	public String execute()throws Exception{
		System.out.println(ID);
		int level = service1.transferMoneyIntoLevel(optionsRadios);
		service1.updateLevel(ID, level);
		
		Date curDate = new Date();
		java.sql.Date date=new java.sql.Date(curDate.getTime());
		p.setDate(date);
		p.setUserID(ID);
		p.setMoney(optionsRadios);
		service2.save(p);
		
		r.setMoney(optionsRadios);
		r.setUserID(ID);
		service3.save(r);
		
		java.sql.Date newDate = getDateOneYearLater();
		v.setUserID(ID);
		v.setValidDate(newDate);
		service4.save(v);
		return SUCCESS;
		
	}
	
	private java.sql.Date getDateOneYearLater(){
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());
		int currenYear = calendar.get(Calendar.YEAR);
		calendar.set(Calendar.YEAR, currenYear + 1);
		java.sql.Date newDate = new java.sql.Date(calendar.getTimeInMillis());
		return newDate;
	}
}
