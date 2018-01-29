package action;

import service.LoginService;
import service.RegisterInfoService;
import model.RegisterInfo;
import model.User;

import com.opensymphony.xwork2.ActionSupport;

public class Register_Step1Action extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private RegisterInfo info;
	
	private String ID;
	private String bankNum;
	
	User user = new User();
	
	private RegisterInfoService service1;
	private LoginService service2;
		
	public RegisterInfo getInfo() {
		return info;
	}
	public void setInfo(RegisterInfo info) {
		this.info = info;
	}
	
	public LoginService getService2() {
		return service2;
	}
	public void setService2(LoginService service2) {
		this.service2 = service2;
	}
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	
	public String execute()throws Exception{
		//info.setID("1000000");
		ID = service1.createNewID();
		bankNum = info.getBankCardNum();
		info.setID(ID);
		user.setID(ID);
		user.setPassword(info.getPassword());
		service1.save(info);
		service2.save(user);
		//System.out.println(ID);
		//System.out.println(info.getPassword());
		//System.out.println(info.getBankCardNum());
		//System.out.println(info.getTelephone());
		//System.out.println(info.getID());
		//System.out.println(service);
		//service.save(info);
		return SUCCESS;
	}
	public RegisterInfoService getService1() {
		return service1;
	}
	public void setService1(RegisterInfoService service1) {
		this.service1 = service1;
	}
	public String getBankNum() {
		return bankNum;
	}
	public void setBankNum(String bankNum) {
		this.bankNum = bankNum;
	}
}
