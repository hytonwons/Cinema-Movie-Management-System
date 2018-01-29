package action;

import service.PlanService;
import model.Plan;

import com.opensymphony.xwork2.ActionSupport;

public class Salesman_PlanAjaxAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String movieName;
	private int hallNum;
	private String year;
	private String month;
	private String day;
	private String time;
	private int price;
	Plan plan = new Plan();
	
	private PlanService service;
	
	private String message;
	
	
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
	
	public PlanService getService() {
		return service;
	}
	public void setService(PlanService service) {
		this.service = service;
	}
	
	public String execute()throws Exception{
		message="";
		plan.setDate(java.sql.Date.valueOf(year+"-"+month+"-"+day));
		plan.setMovieName(movieName);
		plan.setHallNum(hallNum);
		plan.setTime(time);
		plan.setPrice(price);
//		System.out.println(plan.getDate());
//		System.out.println(time);
//		System.out.println(hallNum);
		if(service.canHavePlan(plan)){
			service.insert(plan);
			return SUCCESS;
		}else{
			message="该时段已有排映计划！";
			System.out.println(message);
			return SUCCESS;
		}
	}
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public int getHallNum() {
		return hallNum;
	}
	public void setHallNum(int hallNum) {
		this.hallNum = hallNum;
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
	
}
