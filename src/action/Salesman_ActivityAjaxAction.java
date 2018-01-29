package action;

import service.ActivityService;

import com.opensymphony.xwork2.ActionSupport;

public class Salesman_ActivityAjaxAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String movieName;
	private String q1;
	private String q1_A;
	private String q1_B;
	private String q1_C;
	private String q2;
	private String q2_A;
	private String q2_B;
	private String q2_C;
	
	private ActivityService service;
	
	private String message;
	
	public String getQ1() {
		return q1;
	}
	public void setQ1(String q1) {
		this.q1 = q1;
	}
	public String getQ1_A() {
		return q1_A;
	}
	public void setQ1_A(String q1_A) {
		this.q1_A = q1_A;
	}
	public String getQ1_B() {
		return q1_B;
	}
	public void setQ1_B(String q1_B) {
		this.q1_B = q1_B;
	}
	public String getQ1_C() {
		return q1_C;
	}
	public void setQ1_C(String q1_C) {
		this.q1_C = q1_C;
	}
	public String getQ2() {
		return q2;
	}
	public void setQ2(String q2) {
		this.q2 = q2;
	}
	public String getQ2_A() {
		return q2_A;
	}
	public void setQ2_A(String q2_A) {
		this.q2_A = q2_A;
	}
	public String getQ2_B() {
		return q2_B;
	}
	public void setQ2_B(String q2_B) {
		this.q2_B = q2_B;
	}
	public String getQ2_C() {
		return q2_C;
	}
	public void setQ2_C(String q2_C) {
		this.q2_C = q2_C;
	}
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public String execute() throws Exception{
		message="";
		if(service.hasAnActivity(movieName)){
			setMessage("您已为这部影片制定过活动！");
			return SUCCESS;
		}else{
			service.insert(movieName, q1, q1_A, q1_B,
					q1_C, q2, q2_A, q2_B, q2_C);
			return SUCCESS;
		}
		
	}
	
	public ActivityService getService() {
		return service;
	}
	public void setService(ActivityService service) {
		this.service = service;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

}
