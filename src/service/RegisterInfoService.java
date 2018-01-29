package service;

import model.AgePercentage;
import model.GenderPercentage;
import model.RegisterInfo;
import model.VIPPercentage;

public interface RegisterInfoService {
	public String createNewID();
	public boolean save(RegisterInfo info);
	public RegisterInfo findByID(String ID);
	public boolean checkByTel(String tel);
	public RegisterInfo findByTel(String tel);
	public void updateLevel(String ID, int level);
	public double getDiscount(String ID);
	public String transferLevel(int level);
	public String transferGender(int gender);
	public int transferMoneyIntoLevel(int money);
	public void addPoint(String ID,int point);
	public String transferAge(int age);
	public void modify(String ID,String tel,String passwd,String bankCard);
	public void subPoint(String ID,int point);
	public GenderPercentage getGenderPercentage();
	public AgePercentage getAgePercentage();
	public VIPPercentage getVIPPercentage();
}
