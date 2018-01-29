package action;

import model.User;
import service.LoginService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private User user;
	private LoginService service;
	
	private String message;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public LoginService getService() {
		return service;
	}
	public void setService(LoginService service) {
		this.service = service;
	}
	
	public String execute()throws Exception{
		//System.out.println(service.findUser(user));
		if(service.findUser(user)){
			if(service.isSalesman(user)){
				return "salesman";
			}
			if(service.isManager(user)){
				return "manager";
			}
				//用户登录信息保存session里
				ActionContext ctx = ActionContext.getContext();
				ctx.getSession().put("userID", user.getID());  
				return "member";
		}
		message = "您输入的卡号或密码有误"; 
		return INPUT;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
