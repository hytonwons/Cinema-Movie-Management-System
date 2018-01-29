package dao;

import model.Remainder;

public interface RemainderDao {
	public int getRemainder(String userID);
	public void subRemainder(String userID, int money);
	public void addRemainder(String userID, int money);
	public void save(Remainder r);
}
