package action;

import service.PlanService;

import com.opensymphony.xwork2.ActionSupport;

public class Manager_RemoveAjaxAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int ID;
	
	private String message;
	
	private PlanService service;

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public PlanService getService() {
		return service;
	}

	public void setService(PlanService service) {
		this.service = service;
	}

	public String execute()throws Exception{
		service.removePlan(ID);
		message="您已删除该条排映计划";
		return SUCCESS;
	}
}
