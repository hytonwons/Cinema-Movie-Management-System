package action;

import service.ValidateService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Member_CancelAjaxAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String message;
	
	private ValidateService service;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public ValidateService getService() {
		return service;
	}

	public void setService(ValidateService service) {
		this.service = service;
	}
	
	public String execute()throws Exception{
		ActionContext ctx = ActionContext.getContext();
		String userID = (String)ctx.getSession().get("userID");
		service.cancel(userID);
		message = "您已取消会员资格！";
		return SUCCESS;
	}
	
}
