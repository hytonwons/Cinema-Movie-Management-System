package action;

import java.util.ArrayList;
import java.util.List;

import service.MovieService;
import model.Movie;

import com.opensymphony.xwork2.ActionSupport;

public class Salesman_PlanActivityAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private List<Movie> mp = new ArrayList<Movie>();
	private List<Movie> ma = new ArrayList<Movie>();
	
	private MovieService service;
	
	public String plan()throws Exception{
		mp = service.getActiveMovie();
		return "plan";
	}
	
	public String activity()throws Exception{
		ma = service.getActiveMovie();
		return "activity";
	}

	public MovieService getService() {
		return service;
	}

	public void setService(MovieService service) {
		this.service = service;
	}

	public List<Movie> getMp() {
		return mp;
	}

	public void setMp(List<Movie> mp) {
		this.mp = mp;
	}

	public List<Movie> getMa() {
		return ma;
	}

	public void setMa(List<Movie> ma) {
		this.ma = ma;
	}
}
