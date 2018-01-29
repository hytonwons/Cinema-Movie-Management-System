package action;

import java.util.List;

import service.MovieService;
import service.SessionService;
import model.Movie;
import model.MovieSession;

import com.opensymphony.xwork2.ActionSupport;

public class Member_ShowSessionAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String MovieName;
	
	private Movie m;
	private List<MovieSession> s;
	private int SessionNum;
	
	private SessionService service1;
	private MovieService service2;
	public String getMovieName() {
		return MovieName;
	}
	public void setMovieName(String movieName) {
		MovieName = movieName;
	}
	public Movie getM() {
		return m;
	}
	public void setM(Movie m) {
		this.m = m;
	}
	public List<MovieSession> getS() {
		return s;
	}
	public void setS(List<MovieSession> s) {
		this.s = s;
	}
	public int getSessionNum() {
		return SessionNum;
	}
	public void setSessionNum(int sessionNum) {
		SessionNum = sessionNum;
	}
	public SessionService getService1() {
		return service1;
	}
	public void setService1(SessionService service1) {
		this.service1 = service1;
	}
	public MovieService getService2() {
		return service2;
	}
	public void setService2(MovieService service2) {
		this.service2 = service2;
	}
	
	public String execute()throws Exception{
		m = service2.getMovieInfoByName(MovieName);
		s = service1.getTodaySessionByMovie(MovieName);
		SessionNum = service1.getTodaySessionNumByMovie(MovieName);
		return SUCCESS;
	}
	
	
}
