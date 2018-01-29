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

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Member_ActiveAjaxAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int price;
	
	private String message;
	private RegisterInfoService service1;
	private PaymentService service2;
	Payment p = new Payment();
	private RemainderService service3;
	Remainder r = new Remainder();
	private ValidateService service4;
	Validate v = new Validate();

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
	
	public String execute()throws Exception{
		ActionContext ctx = ActionContext.getContext();
		String ID = (String)ctx.getSession().get("userID");
		System.out.println(ID);
		int level = service1.transferMoneyIntoLevel(price);
		service1.updateLevel(ID, level);
		
		Date curDate = new Date();
		java.sql.Date date=new java.sql.Date(curDate.getTime());
		p.setDate(date);
		p.setUserID(ID);
		p.setMoney(price);
		service2.save(p);
		
		r.setMoney(price);
		r.setUserID(ID);
		service3.save(r);
		
		java.sql.Date newDate = getDateOneYearLater();
		v.setUserID(ID);
		v.setValidDate(newDate);
		service4.save(v);
		message="您已激活成功！";
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
