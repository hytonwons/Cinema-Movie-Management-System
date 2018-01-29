package dao;

import java.sql.Date;
import java.util.List;

import model.Consume;

public interface ConsumeDao {
	public void insert(Consume c);
	public List<Consume> getConsume(String userID);
	public int whetherHaveConsumeByDate(Date date);
	public int getConsumeByDate(Date date);
}
