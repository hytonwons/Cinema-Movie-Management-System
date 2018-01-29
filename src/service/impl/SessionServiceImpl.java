package service.impl;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

import dao.SessionDao;
import model.MovieSession;
import service.SessionService;

public class SessionServiceImpl implements SessionService {
	
	private SessionDao dao;
	
	private SessionServiceImpl(){
		
	}
	
	public SessionDao getDao() {
		return dao;
	}

	public void setDao(SessionDao dao) {
		this.dao = dao;
	}
	
	@Override
	public List<MovieSession> getTodaySessionByPopularity() {
		// TODO Auto-generated method stub
		return dao.getTodaySessionByPopularity();
	}

	@Override
	public List<MovieSession> getTodaySessionByTime() {
		// TODO Auto-generated method stub
		return dao.getTodaySeessionByTime();
	}

	@Override
	public MovieSession getSessionByID(int sessionID) {
		// TODO Auto-generated method stub
		return dao.getSessionByID(sessionID);
	}

	@Override
	public void updateLeftSeat(int sessionID) {
		// TODO Auto-generated method stub
		dao.updateLeftSeat(sessionID);
	}

	@Override
	public List<String> getMovieNameByDate(Date date) {
		// TODO Auto-generated method stub
		return dao.getMovieNameByDate(date);
	}

	@Override
	public int getSessionNumByDate(Date date) {
		// TODO Auto-generated method stub
		return dao.getSessionNumByDate(date);
	}

	@Override
	public List<MovieSession> getTodaySessionByMovie(String name) {
		// TODO Auto-generated method stub
		return dao.getTodaySeessionByMovie(name);
	}

	@Override
	public int getTodaySessionNumByMovie(String name) {
		// TODO Auto-generated method stub
		return dao.getTodaySessionNumByMovie(name);
	}

	@Override
	public void insert(MovieSession ms) {
		// TODO Auto-generated method stub
		dao.insert(ms);
	}

	@Override
	public int[] getTotalPeople(Date[] date) {
		// TODO Auto-generated method stub
		int[] sessionTotal = new int[30];
		int[] leftSeat = new int[30];
		int[] people = new int[30];
		for(int i=0;i<date.length;i++){
			sessionTotal[i] = dao.whetherHaveSessionByDate(date[i]);
			if(sessionTotal[i]==0){
				people[i]=0;
			}else{
				leftSeat[i]=dao.getLeftSeatByDate(date[i]);
				people[i]=80*sessionTotal[i]-leftSeat[i];
			}
		}
//		System.out.println(leftSeat[23]);
//		System.out.println(sessionTotal[23]);
		return people;
	}

	@Override
	public double[] getHallRate(Date[] date, int hallNum) {
		// TODO Auto-generated method stub
		int[] sessionTotal = new int[7];
		int[] leftSeat = new int[7];
		double[] rate = new double[7];
		for(int i=0;i<date.length;i++){
			sessionTotal[i] = dao.whetherHaveSessionByDateAndHallNum(date[i], hallNum);
			if(sessionTotal[i]==0){
				rate[i]=0.0;
			}else{
				leftSeat[i]=dao.getLeftSeatByDateAndHallNum(date[i], hallNum);
				BigDecimal b = new BigDecimal((double)100*(sessionTotal[i]*80-leftSeat[i])/(sessionTotal[i]*80));
				rate[i] = b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
			}
		}
		return rate;
	}

	@Override
	public double[] getMovieRate(Date[] date, String movieName) {
		// TODO Auto-generated method stub
		int[] sessionTotal = new int[7];
		int[] leftSeat = new int[7];
		double[] rate = new double[7];
		for(int i=0;i<date.length;i++){
			sessionTotal[i] = dao.whetherHaveSessionByDateAndMovieName(date[i], movieName);
			if(sessionTotal[i]==0){
				rate[i]=0.0;
			}else{
				leftSeat[i]=dao.getLeftSeatByDateAndMovieName(date[i], movieName);
				BigDecimal b = new BigDecimal((double)100*(sessionTotal[i]*80-leftSeat[i])/(sessionTotal[i]*80));
				rate[i] = b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
			}
		}
		return rate;
	}

}
