package action;

import service.MovieService;
import model.Movie;

import com.opensymphony.xwork2.ActionSupport;

public class Manager_AddMovieAjaxAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String name;
	private String director;
	private String actor;
	private String type;
	private int length;
	
	private Movie m = new Movie();
	
	private String message;
	
	private MovieService service;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Movie getM() {
		return m;
	}

	public void setM(Movie m) {
		this.m = m;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public MovieService getService() {
		return service;
	}

	public void setService(MovieService service) {
		this.service = service;
	}
	
	public String execute()throws Exception{
		m.setActor(actor);
		m.setDirector(director);
		m.setLength(length);
		m.setName(name);
		m.setType(type);
		service.insert(m);
		message="您已将该影片上映！";
		return SUCCESS;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}
}
