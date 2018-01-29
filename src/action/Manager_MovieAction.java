package action;

import java.util.ArrayList;
import java.util.List;

import service.MovieService;
import model.Movie;

import com.opensymphony.xwork2.ActionSupport;

public class Manager_MovieAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<Movie> m = new ArrayList<Movie>();
	private MovieService service;
	public List<Movie> getM() {
		return m;
	}
	public void setM(List<Movie> m) {
		this.m = m;
	}
	public MovieService getService() {
		return service;
	}
	public void setService(MovieService service) {
		this.service = service;
	}
	
	public String execute()throws Exception{
		m = service.getActiveMovie();
		return SUCCESS;
	}
}
