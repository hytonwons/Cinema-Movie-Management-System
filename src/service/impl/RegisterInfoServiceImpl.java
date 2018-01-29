package service.impl;

import java.math.BigDecimal;

import dao.RegisterInfoDao;
import model.Age;
import model.AgePercentage;
import model.CardType;
import model.Discount;
import model.GenderPercentage;
import model.RegisterInfo;
import model.VIPPercentage;
import service.RegisterInfoService;

public class RegisterInfoServiceImpl implements RegisterInfoService{
	private RegisterInfoDao dao;
	
	public RegisterInfoDao getDao() {
		return dao;
	}

	public void setDao(RegisterInfoDao dao) {
		this.dao = dao;
	}
	
	private RegisterInfoServiceImpl(){
		
	}

	@Override
	public String createNewID() {
		// TODO Auto-generated method stub
		return dao.createNewID();
	}

	@Override
	public boolean save(RegisterInfo info) {
		// TODO Auto-generated method stub
		System.out.println(dao);
		return dao.save(info);
	}

	@Override
	public RegisterInfo findByID(String ID) {
		// TODO Auto-generated method stub
		return dao.findByID(ID);
	}

	@Override
	public double getDiscount(String ID) {
		// TODO Auto-generated method stub
		int level = dao.getDiscount(ID);
		Discount d = new Discount();
		if(level==1){
			return d.getSilverDiscount();
		}
		if(level==2){
			return d.getGoldDiscount();
		}
		if(level==3){
			return d.getDiamondDiscount();
		}
		return 1.0;
	}

	@Override
	public String transferLevel(int level) {
		// TODO Auto-generated method stub
		String cardType = "未激活";
		CardType ct = new CardType();
		switch(level){
			case 1:
				cardType=ct.getSilver();
				break;
			case 2:
				cardType=ct.getGold();
				break;
			case 3:
				cardType=ct.getDiamond();
				break;
		}
		return cardType;
	}

	@Override
	public String transferGender(int gender) {
		// TODO Auto-generated method stub
		String g = null;
		if(gender==1){
			g="先生";
		}else{
			g="女士";
		}
		return g;
	}

	@Override
	public RegisterInfo findByTel(String tel) {
		// TODO Auto-generated method stub
		return dao.findByTel(tel);
	}

	@Override
	public boolean checkByTel(String tel) {
		// TODO Auto-generated method stub
		return dao.checkByTel(tel);
	}

	@Override
	public void updateLevel(String ID, int level) {
		// TODO Auto-generated method stub
		dao.updateLevel(ID, level);
	}

	@Override
	public int transferMoneyIntoLevel(int money) {
		// TODO Auto-generated method stub
		int level = 0;
		if(money==200){
			level = 1;
		}
		if(money==500){
			level = 2;
		}
		if(money==1000){
			level = 3;
		}
		return level;
	}

	@Override
	public void addPoint(String ID, int point) {
		// TODO Auto-generated method stub
		dao.addPoint(ID, point);
	}

	@Override
	public String transferAge(int age) {
		// TODO Auto-generated method stub
		String interval = null;
		Age a = new Age();
		switch(age){
		case 1:
			interval=a.getTeens();
			break;
		case 2:
			interval=a.getTwenties();
			break;
		case 3:
			interval=a.getThirties();
			break;
		case 4:
			interval=a.getForties();
			break;
		case 5:
			interval=a.getFifties();
			break;
		case 6:
			interval=a.getElderly();
			break;
		}
		return interval;
	}

	@Override
	public void modify(String ID, String tel, String passwd, String bankCard) {
		// TODO Auto-generated method stub
		dao.modify(ID, tel, passwd, bankCard);
		
	}

	@Override
	public void subPoint(String ID, int point) {
		// TODO Auto-generated method stub
		dao.subPoint(ID, point);
	}

	@Override
	public GenderPercentage getGenderPercentage() {
		// TODO Auto-generated method stub
		GenderPercentage genderPercentage = new GenderPercentage();
		int man = dao.getTotalMan();
		int woman = dao.getTotalWoman();
		
		BigDecimal bm = new BigDecimal((double)man*100/(man+woman));
		double mp = bm.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		
		BigDecimal bw = new BigDecimal((double)woman*100/(man+woman));
		double wp = bw.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		
		genderPercentage.setMan(mp);
		genderPercentage.setWoman(wp);;
		return genderPercentage;
	}

	@Override
	public AgePercentage getAgePercentage() {
		// TODO Auto-generated method stub
		int[] age = new int[6];
		for(int i=0;i<6;i++){
			age[i] = dao.getTotalAge(i+1);
		}
		int sum = 0;
		for(int i=0;i<age.length;i++){
			sum = sum+age[i];
		}
		double[] per = new double[6];
		for(int i=0;i<6;i++){
			BigDecimal b = new BigDecimal((double)age[i]*100/sum);
			per[i] = b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		}
		AgePercentage ap = new AgePercentage();
		ap.setTeens(per[0]);
		ap.setTwenties(per[1]);
		ap.setThirties(per[2]);
		ap.setForties(per[3]);
		ap.setFifties(per[4]);
		ap.setElderly(per[5]);
		return ap;
	}

	@Override
	public VIPPercentage getVIPPercentage() {
		// TODO Auto-generated method stub
		int[] level = new int[3];
		for(int i=0;i<3;i++){
			level[i] = dao.getTotalLevel(i+1);
		}
		int sum = 0;
		for(int i=0;i<level.length;i++){
			sum = sum+level[i];
		}
		double[] per = new double[3];
		for(int i=0;i<3;i++){
			BigDecimal b = new BigDecimal((double)level[i]*100/sum);
			per[i] = b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		}
		VIPPercentage v = new VIPPercentage();
		v.setDiamond(per[2]);
		v.setGold(per[1]);
		v.setSilver(per[0]);
		return v;
	}
}
