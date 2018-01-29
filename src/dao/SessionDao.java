package dao;

import java.sql.Date;
import java.util.List;

import model.MovieSession;
public interface SessionDao {
	public List<MovieSession> getTodaySessionByPopularity();
	public List<MovieSession> getTodaySeessionByTime();
	public List<MovieSession> getTodaySeessionByMovie(String name);
	public MovieSession getSessionByID(int sessionID);
	public void updateLeftSeat(int sessionID);
	public List<String> getMovieNameByDate(Date date);
	public int getSessionNumByDate(Date date);
	public int getTodaySessionNumByMovie(String name);
	public void insert(MovieSession ms);
	public int whetherHaveSessionByDate(Date date);
	public int getLeftSeatByDate(Date date);
	public int whetherHaveSessionByDateAndHallNum(Date date,int hallNum);
	public int getLeftSeatByDateAndHallNum(Date date,int hallNum);
	public int whetherHaveSessionByDateAndMovieName(Date date,String movieName);
	public int getLeftSeatByDateAndMovieName(Date date, String movieName);
}
