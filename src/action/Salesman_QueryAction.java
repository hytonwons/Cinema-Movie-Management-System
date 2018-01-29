package action;

import java.util.ArrayList;
import java.util.List;

import model.Consume;
import model.Payment;
import model.RegisterInfo;
import service.ConsumeService;
import service.LoginService;
import service.PaymentService;
import service.RegisterInfoService;

import com.opensymphony.xwork2.ActionSupport;

public class Salesman_QueryAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private RegisterInfoService service1;//
	private ConsumeService service2;//
	private PaymentService service3;//
	private LoginService service4;//
	
	private String search_content;
	
	private RegisterInfo ri;
	private List<Payment> p = new ArrayList<Payment>();
	private List<Consume> c = new ArrayList<Consume>();
	private String gender;
	private String cardType;
	
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
	public LoginService getService4() {
		return service4;
	}
	public void setService4(LoginService service4) {
		this.service4 = service4;
	}
	
	public String getSearch_content() {
		return search_content;
	}
	public void setSearch_content(String search_content) {
		this.search_content = search_content;
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
	
	
	public String execute() throws Exception{
		System.out.println(search_content);
		int length = search_content.length();
		if(length==7){
			System.out.println("下面开始查询是否有"+search_content+"的卡号");
			if(service4.findByID(search_content)){
				ri = service1.findByID(search_content);
				cardType = service1.transferLevel(ri.getLevel());
				gender = service1.transferGender(ri.getGender());
				c = service2.getConsume(search_content);
				p = service3.getPayment(search_content);
				return SUCCESS;
			}else{
				System.out.println("不存在"+search_content+"的卡号");
				return ERROR;
			}
		}else {
			if(length==11){
				System.out.println("下面开始查询是否有"+search_content+"的手机号");
				if(service1.checkByTel(search_content)){
					ri = service1.findByTel(search_content);
					cardType = service1.transferLevel(ri.getLevel());
					gender = service1.transferGender(ri.getGender());
					c = service2.getConsume(ri.getID());
					p = service3.getPayment(ri.getID());
					return SUCCESS;
				}else{
					System.out.println("不存在"+search_content+"的手机号");
					return ERROR;
				}
			}
			return ERROR;
		}
	}
	
}
