package action;

import service.LoginService;
import service.RegisterInfoService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Member_ModifyAjaxAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String phoneNum;
	private String passwd;
	private String bankCard;
	
	private String message;
	
	private RegisterInfoService service;
	private LoginService service_;

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getBankCard() {
		return bankCard;
	}

	public void setBankCard(String bankCard) {
		this.bankCard = bankCard;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public RegisterInfoService getService() {
		return service;
	}

	public void setService(RegisterInfoService service) {
		this.service = service;
	}
	
	public String execute()throws Exception{
		ActionContext ctx = ActionContext.getContext();
		String ID = (String)ctx.getSession().get("userID");
		service.modify(ID, phoneNum, passwd, bankCard);
		service_.modify(ID, passwd);
		message="您已修改成功！";
		return SUCCESS;
	}

	public LoginService getService_() {
		return service_;
	}

	public void setService_(LoginService service_) {
		this.service_ = service_;
	}
}
