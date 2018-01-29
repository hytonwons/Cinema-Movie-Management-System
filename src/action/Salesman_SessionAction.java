package action;

import java.util.ArrayList;
import java.util.List;

import service.SessionService;
import model.MovieSession;

import com.opensymphony.xwork2.ActionSupport;

public class Salesman_SessionAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private MovieSession session;
	private SessionService service;
	private List<MovieSession> listByPopularity = new ArrayList<MovieSession>();
	private List<MovieSession> listByTime = new ArrayList<MovieSession>();
	
	public MovieSession getSession() {
		return session;
	}

	public void setSession(MovieSession session) {
		this.session = session;
	}

	public SessionService getService() {
		return service;
	}

	public void setService(SessionService service) {
		this.service = service;
	}
	
	public List<MovieSession> getListByTime() {
		return listByTime;
	}

	public void setListByTime(List<MovieSession> listByTime) {
		this.listByTime = listByTime;
	}
	
	public List<MovieSession> getListByPopularity() {
		return listByPopularity;
	}

	public void setListByPopularity(List<MovieSession> listByPopularity) {
		this.listByPopularity = listByPopularity;
	}
	
	public String execute()throws Exception{
		setListByPopularity(service.getTodaySessionByPopularity());
		setListByTime(service.getTodaySessionByTime());
		return SUCCESS;
	}
}
