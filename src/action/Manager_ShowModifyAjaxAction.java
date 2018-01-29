package action;

import service.PlanService;
import model.Plan;

import com.opensymphony.xwork2.ActionSupport;

public class Manager_ShowModifyAjaxAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int ID;
	private Plan plan;
	
	private PlanService service;

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public Plan getPlan() {
		return plan;
	}

	public void setPlan(Plan plan) {
		this.plan = plan;
	}

	public PlanService getService() {
		return service;
	}

	public void setService(PlanService service) {
		this.service = service;
	}
	
	public String execute()throws Exception{
		plan = service.getPlanByID(ID);
		return SUCCESS;
	}

}
