package action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import service.MovieService;
import service.SessionService;
import model.Movie;

import com.opensymphony.xwork2.ActionSupport;

public class Member_BuyAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int MovieNum;
	private int sessionNum;
	private List<Movie> m = new ArrayList<Movie>();
	
	private SessionService service1;
	private MovieService service2;
	
	public int getMovieNum() {
		return MovieNum;
	}
	public void setMovieNum(int movieNum) {
		MovieNum = movieNum;
	}
	public int getSessionNum() {
		return sessionNum;
	}
	public void setSessionNum(int sessionNum) {
		this.sessionNum = sessionNum;
	}
	public List<Movie> getM() {
		return m;
	}
	public void setM(List<Movie> m) {
		this.m = m;
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
		Date curDate = new Date();
		java.sql.Date date=new java.sql.Date(curDate.getTime());
		
		List<String> movieName = service1.getMovieNameByDate(date);
		MovieNum = movieName.size();
		System.out.println(MovieNum);
//		System.out.println(movieName.get(0));
//		System.out.println(movieName.get(1));
//		System.out.println(movieName.get(2));
		
		sessionNum = service1.getSessionNumByDate(date);
		System.out.println(sessionNum);
		for(int i=0; i<MovieNum; i++){
			if(m.size()<MovieNum){
				m.add(service2.getMovieInfoByName(movieName.get(i)));
			}
		}
		return SUCCESS;
	}
}
