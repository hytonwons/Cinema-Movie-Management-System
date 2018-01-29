package action;

import service.ActivityService;
import model.Activity;

import com.opensymphony.xwork2.ActionSupport;

public class Member_ChangeActivityAjaxAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String movieName;
	private Activity a;
	
	private String message;
	private ActivityService service;

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public Activity getA() {
		return a;
	}

	public void setA(Activity a) {
		this.a = a;
	}

	public ActivityService getService() {
		return service;
	}

	public void setService(ActivityService service) {
		this.service = service;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	public String execute()throws Exception{
		message="";
//		ActionContext ctx = ActionContext.getContext();
//		String userID = (String)ctx.getSession().get("userID");
		if(service.hasAnActivity(movieName)){
			a = service.getActivityByName(movieName);
		}else{
			message="很抱歉，您选择的影片暂未制定活动！";
		}
		return SUCCESS;
	}
}
