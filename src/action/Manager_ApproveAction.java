package action;

import model.Plan;
import service.PlanService;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

public class Manager_ApproveAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private PlanService service;
	
	private List<Plan> plan = new ArrayList<Plan>();
	
	private int length;
	
	public PlanService getService() {
		return service;
	}

	public void setService(PlanService service) {
		this.service = service;
	}
	
	public String execute()throws Exception{
		plan = service.getPlan();
		length = plan.size();
		if(length==0){
			return "none";
		}else{
			return SUCCESS;
		}
	}

	public List<Plan> getPlan() {
		return plan;
	}

	public void setPlan(List<Plan> plan) {
		this.plan = plan;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}
}
