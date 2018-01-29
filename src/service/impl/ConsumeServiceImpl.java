package service.impl;

import java.util.Date;
import java.util.List;

import model.Consume;
import dao.ConsumeDao;
import service.ConsumeService;

public class ConsumeServiceImpl implements ConsumeService{
	private ConsumeDao dao;
	
	public ConsumeDao getDao() {
		return dao;
	}

	public void setDao(ConsumeDao dao) {
		this.dao = dao;
	}
	
	private ConsumeServiceImpl(){
		
	}
	
	@Override
	public void insertNewConsume(String userID, int money,String movieName) {
		// TODO Auto-generated method stub
		Consume c = new Consume();
		java.sql.Date date = GetCurSQLDate();
		c.setMovieName(movieName);
		c.setDate(date);
		c.setUserID(userID);
		c.setMoney(money);
		dao.insert(c);
	}
	
	private java.sql.Date GetCurSQLDate(){   
		Date curDate = new Date();
		java.sql.Date date=new java.sql.Date(curDate.getTime());
		return date;
	}

	@Override
	public List<Consume> getConsume(String userID) {
		// TODO Auto-generated method stub
		return dao.getConsume(userID);
	}

	@Override
	public int[] getConsumeByDate(java.sql.Date[] date) {
		// TODO Auto-generated method stub
		int[] consume = new int[30];
		for(int i=0;i<30;i++){
			int length = dao.whetherHaveConsumeByDate(date[i]);
			if(length==0){
				consume[i]=length;
			}else{
				consume[i] = dao.getConsumeByDate(date[i]);
			}
		}
		return consume;
	}
}
