package action;

import service.PlanService;

import com.opensymphony.xwork2.ActionSupport;

public class Manager_ModifyAjaxAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int ID;
	private String time;
	private int price;
	
	private PlanService service;

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public PlanService getService() {
		return service;
	}

	public void setService(PlanService service) {
		this.service = service;
	}
	
	public String execute()throws Exception{
		service.updatePlan(ID, time, price);
		return SUCCESS;
	}
}
