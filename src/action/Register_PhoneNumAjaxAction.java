package action;

import service.RegisterInfoService;

import com.opensymphony.xwork2.ActionSupport;

public class Register_PhoneNumAjaxAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String phoneNum;
	
	private boolean flag;
	
	private RegisterInfoService service;

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public RegisterInfoService getService() {
		return service;
	}

	public void setService(RegisterInfoService service) {
		this.service = service;
	}
	
	public String execute() throws Exception{
		flag = service.checkByTel(phoneNum);
		return SUCCESS;
	}

}
