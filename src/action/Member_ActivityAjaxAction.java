package action;

import model.ActivityAnswer;
import service.ActivityAnswerService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Member_ActivityAjaxAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String movieName;
	private int q1_Answer;
	private int q2_Answer;
	private ActivityAnswer a = new ActivityAnswer();
	
	private ActivityAnswerService service;
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public ActivityAnswerService getService() {
		return service;
	}
	public void setService(ActivityAnswerService service) {
		this.service = service;
	}
	
	public int getQ1_Answer() {
		return q1_Answer;
	}
	public void setQ1_Answer(int q1_Answer) {
		this.q1_Answer = q1_Answer;
	}
	public int getQ2_Answer() {
		return q2_Answer;
	}
	public void setQ2_Answer(int q2_Answer) {
		this.q2_Answer = q2_Answer;
	}
	
	public String execute() throws Exception{
		ActionContext ctx = ActionContext.getContext();
		String userID = (String)ctx.getSession().get("userID");
		a.setUserID(userID);
		a.setMovieName(movieName);
		System.out.println(q2_Answer);
		a.setQ1Answer(q1_Answer);
		a.setQ2Answer(q2_Answer);
		service.save(a);
		return SUCCESS;
	}
}
