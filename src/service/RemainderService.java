package service;

import model.Remainder;

public interface RemainderService {
	public int getRemainder(String userID);
	public void subRemainder(String userID,int money);
	public void addRemainder(String userID,int money);
	public void save(Remainder r);
}
