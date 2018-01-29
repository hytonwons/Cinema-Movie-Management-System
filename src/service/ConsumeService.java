package service;

import java.util.List;

import model.Consume;

public interface ConsumeService {
	public void insertNewConsume(String userID,int money,String movieName);
	public List<Consume> getConsume(String userID);
	public int[] getConsumeByDate(java.sql.Date[] date);
}
