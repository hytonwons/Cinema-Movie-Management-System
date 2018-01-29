package action;

import java.sql.Date;

import model.RegisterInfo;
import service.RegisterInfoService;
import service.RemainderService;
import service.ValidateService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Member_HandleAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String userID;
	private String state;
	private int remainder;
	private Date validDate;
	private boolean valid;
	private String cardNum;
	
	private RegisterInfoService service1;
	
	private RemainderService service2;
	
	private ValidateService service3;

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getRemainder() {
		return remainder;
	}

	public void setRemainder(int remainder) {
		this.remainder = remainder;
	}

	public Date getValidDate() {
		return validDate;
	}

	public void setValidDate(Date validDate) {
		this.validDate = validDate;
	}

	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean valid) {
		this.valid = valid;
	}
	
	public String getCardNum() {
		return cardNum;
	}

	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
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

	public ValidateService getService3() {
		return service3;
	}

	public void setService3(ValidateService service3) {
		this.service3 = service3;
	}
	
	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	public String execute()throws Exception{
		ActionContext ctx = ActionContext.getContext();
		userID = (String)ctx.getSession().get("userID");
		System.out.println(userID);
		RegisterInfo ri = new RegisterInfo();
		ri = service1.findByID(userID);
		int level = ri.getLevel();
		cardNum = ri.getBankCardNum();
		if(level!=0){
			if(service3.isCancled(userID)||service3.isStoped(userID)){
				state="已取消";
			}else{
				state="已激活";
				remainder = service2.getRemainder(userID);
				validDate = service3.getValidDateByID(userID);
				if(service3.isPaused(userID)){
					valid = false;
				}else{
					valid = true;
				}
			}
		}else{
			state="未激活";
		}
		System.out.println(valid);
		return SUCCESS;
	}
}
