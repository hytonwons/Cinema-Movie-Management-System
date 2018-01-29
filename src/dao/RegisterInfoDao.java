package dao;

import model.RegisterInfo;

public interface RegisterInfoDao {

	public boolean save(RegisterInfo info);
	

	public String createNewID();
	

	public void updateLevel(String userID,int level);
	

	public RegisterInfo findByID(String ID);
	
	public int getDiscount(String ID);
	
	public RegisterInfo findByTel(String tel);
	
	public boolean checkByTel(String tel);
	
	public void addPoint(String ID,int point);
	
	public void modify(String ID,String tel,String passwd,String bankCard);
	
	public void subPoint(String ID,int point);
	public int getTotalMan();
	public int getTotalWoman();
	public int getTotalAge(int age);
	public int getTotalLevel(int level);
}
