package action;

import service.RegisterInfoService;
import service.RemainderService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Member_ExchangeAjaxAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int point;
	private int money;
	
	private RegisterInfoService service1;
	private RemainderService service2;
	
	private String message;

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
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
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
	public String execute()throws Exception{
		ActionContext ctx = ActionContext.getContext();
		String userID = (String)ctx.getSession().get("userID");
		service1.subPoint(userID, point);
		service2.addRemainder(userID, money);
		//System.out.println("here");
		setMessage("您已兑换成功！");
		//System.out.println(message);
		return SUCCESS;
	}
}
