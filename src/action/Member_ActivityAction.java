package action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import service.ActivityService;
import model.Activity;

public class Member_ActivityAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<String> movieName;
	
	private Activity a;
	
	private String message;
	
	private ActivityService service;

	public List<String> getMovieName() {
		return movieName;
	}

	public void setMovieName(List<String> movieName) {
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
	
	public String execute() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		String userID = (String)ctx.getSession().get("userID");
		System.out.println(userID);
		movieName = service.getUndoneActivityByUserID(userID);
		int movieNum = movieName.size();
		System.out.println(movieNum);
		if(movieNum!=0){
			String firstMovie = movieName.get(0);
			System.out.println(firstMovie);
			if(service.hasAnActivity(firstMovie)){
				a = service.getActivityByName(firstMovie);
				return SUCCESS;
			}else{
				return "firstnone";
			}
		}else{
			message="抱歉，暂时还没有可供选择的活动参加！";
			return "none";
		}	
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
