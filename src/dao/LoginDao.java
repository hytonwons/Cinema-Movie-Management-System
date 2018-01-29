package dao;

import model.User;

public interface LoginDao {
	public boolean findUser(User user);
	public boolean findByID(String ID);
	public void save(User user);
	public void update(String ID,String password);
}
