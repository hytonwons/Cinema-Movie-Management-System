package service.impl;

import model.User;
import dao.LoginDao;
import service.LoginService;

public class LoginServiceImpl implements LoginService{
	private LoginDao dao;
	
	private LoginServiceImpl(){
		
	}

	public LoginDao getDao() {
		return dao;
	}

	public void setDao(LoginDao dao) {
		this.dao = dao;
	}

	@Override
	public boolean isSalesman(User user) {
		// TODO Auto-generated method stub
		if(user.getID().startsWith("s")){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean isManager(User user) {
		// TODO Auto-generated method stub
		//System.out.println(user.getID().substring(0, 1));
		if(user.getID().startsWith("m")){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean findUser(User user) {
		// TODO Auto-generated method stub
		return dao.findUser(user);
	}

	@Override
	public boolean findByID(String ID) {
		// TODO Auto-generated method stub
		return dao.findByID(ID);
	}

	@Override
	public void save(User user) {
		// TODO Auto-generated method stub
		dao.save(user);
	}

	@Override
	public void modify(String ID, String password) {
		// TODO Auto-generated method stub
		dao.update(ID, password);
	}	
}
