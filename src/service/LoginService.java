package service;

import model.User;

public interface LoginService {
	public boolean isSalesman(User user);
	public boolean isManager(User user);
	public boolean findUser(User user);
	public boolean findByID(String ID);
	public void save(User user);
	public void modify(String ID,String password);
}
