package action;

import service.MovieService;

import com.opensymphony.xwork2.ActionSupport;

public class Manager_RemoveMovieAjaxAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int ID;
	private String message;
	private MovieService service;
	
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
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
		service.offLineMovie(ID);
		message="您已将该影片下映！";
		return SUCCESS;
	}
}
