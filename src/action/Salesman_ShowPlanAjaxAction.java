package action;

import java.util.List;

import service.PlanService;
import model.Plan;

import com.opensymphony.xwork2.ActionSupport;

public class Salesman_ShowPlanAjaxAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String year;
	private String month;
	private String day;
	private int hallNum;
	
	private PlanService service;
	
	private List<Plan> plan;

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public int getHallNum() {
		return hallNum;
	}

	public void setHallNum(int hallNum) {
		this.hallNum = hallNum;
	}

	public PlanService getService() {
		return service;
	}

	public void setService(PlanService service) {
		this.service = service;
	}

	public List<Plan> getPlan() {
		return plan;
	}

	public void setPlan(List<Plan> plan) {
		this.plan = plan;
	}
	
	public String execute()throws Exception{
		java.sql.Date date = java.sql.Date.valueOf(year+"-"+month+"-"+day);
		plan = service.findPlanByDateAndHallNum(date, hallNum);
		return SUCCESS;
	}
}
