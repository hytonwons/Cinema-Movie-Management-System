package service.impl;

import model.Remainder;
import dao.RemainderDao;
import service.RemainderService;

public class RemainderServiceImpl implements RemainderService {

	private RemainderDao dao;
	
	private RemainderServiceImpl(){
		
	}
	
	public RemainderDao getDao() {
		return dao;
	}

	public void setDao(RemainderDao dao) {
		this.dao = dao;
	}
	
	@Override
	public int getRemainder(String userID) {
		// TODO Auto-generated method stub
		return dao.getRemainder(userID);
	}

	@Override
	public void subRemainder(String userID, int money) {
		// TODO Auto-generated method stub
		dao.subRemainder(userID, money);
	}

	@Override
	public void addRemainder(String userID, int money) {
		// TODO Auto-generated method stub
		dao.addRemainder(userID, money);
	}

	@Override
	public void save(Remainder r) {
		// TODO Auto-generated method stub
		dao.save(r);
	}
}
