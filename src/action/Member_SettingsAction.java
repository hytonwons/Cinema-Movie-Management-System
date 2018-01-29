package action;

import java.util.ArrayList;
import java.util.List;

import model.Consume;
import model.Payment;
import model.RegisterInfo;
import service.ConsumeService;
import service.PaymentService;
import service.RegisterInfoService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Member_SettingsAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private RegisterInfoService service1;
	private ConsumeService service2;
	private PaymentService service3;
	
	private RegisterInfo ri;
	private List<Payment> p = new ArrayList<Payment>();
	private List<Consume> c = new ArrayList<Consume>();
	private String gender;
	private String cardType;
	private String age;
	
	public RegisterInfoService getService1() {
		return service1;
	}
	public void setService1(RegisterInfoService service1) {
		this.service1 = service1;
	}
	
	public ConsumeService getService2() {
		return service2;
	}
	public void setService2(ConsumeService service2) {
		this.service2 = service2;
	}
	
	public PaymentService getService3() {
		return service3;
	}
	public void setService3(PaymentService service3) {
		this.service3 = service3;
	}
	
	public RegisterInfo getRi() {
		return ri;
	}
	public void setRi(RegisterInfo ri) {
		this.ri = ri;
	}
	public List<Consume> getC() {
		return c;
	}
	public void setC(List<Consume> c) {
		this.c = c;
	}
	public List<Payment> getP() {
		return p;
	}
	public void setP(List<Payment> p) {
		this.p = p;
	}

	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	
	
	public String execute() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		String ID = (String)ctx.getSession().get("userID");
		ri = service1.findByID(ID);
		cardType = service1.transferLevel(ri.getLevel());
		gender = service1.transferGender(ri.getGender());
		age = service1.transferAge(ri.getAge());
		c = service2.getConsume(ID);
		p = service3.getPayment(ID);
		return SUCCESS;
	}
}
