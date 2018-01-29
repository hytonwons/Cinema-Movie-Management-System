package service;

import java.sql.Date;
import java.util.List;

import model.MovieSession;

public interface SessionService {
	public List<MovieSession> getTodaySessionByPopularity();
	public List<MovieSession> getTodaySessionByTime();
	public List<MovieSession> getTodaySessionByMovie(String name);
	public MovieSession getSessionByID(int sessionID);
	public void updateLeftSeat(int sessionID);
	public List<String> getMovieNameByDate(Date date);
	public int getSessionNumByDate(Date date);
	public int getTodaySessionNumByMovie(String name);
	public void insert(MovieSession ms);
	public int[] getTotalPeople(Date[] date);
	public double[] getHallRate(Date[] date,int hallNum);
	public double[] getMovieRate(Date[] date,String movieName);
}
