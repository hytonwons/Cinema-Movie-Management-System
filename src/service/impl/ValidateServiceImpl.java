package service.impl;

import java.math.BigDecimal;
import java.util.Date;

import model.Validate;
import model.ValidatePercentage;
import dao.ValidateDao;
import service.ValidateService;

public class ValidateServiceImpl implements ValidateService{
	private ValidateDao dao;
	 
	private ValidateServiceImpl(){
		
	}

	public ValidateDao getDao() {
		return dao;
	}

	public void setDao(ValidateDao dao) {
		this.dao = dao;
	}

	@Override
	public void save(Validate v) {
		// TODO Auto-generated method stub
		dao.save(v);
	}

	@Override
	public java.sql.Date getValidDateByID(String ID) {
		// TODO Auto-generated method stub
		return dao.getValidateByID(ID).getValidDate();
	}

	@Override
	public boolean isCancled(String ID) {
		// TODO Auto-generated method stub
		return dao.isCancled(ID);
	}

	@Override
	public boolean isPaused(String ID) {
		// TODO Auto-generated method stub
		java.sql.Date date = GetCurSQLDate();
		return dao.isPaused(ID,date);
	}

	@Override
	public boolean isStoped(String ID) {
		// TODO Auto-generated method stub
		java.sql.Date date = GetCurSQLDate();
		return dao.isStoped(ID,date);
	}
	
	private java.sql.Date GetCurSQLDate(){   
		Date curDate = new Date();
		java.sql.Date date=new java.sql.Date(curDate.getTime());
		return date;
	}

	@Override
	public void cancel(String ID) {
		// TODO Auto-generated method stub
		dao.cancel(ID);
	}

	@Override
	public void update(String ID, java.sql.Date date) {
		// TODO Auto-generated method stub
		dao.update(ID, date);
	}

	@Override
	public ValidatePercentage getValidatePercentage() {
		// TODO Auto-generated method stub
		Date curDate = new Date();
		java.sql.Date date=new java.sql.Date(curDate.getTime());
		int state[] = new int[4];
		state[0] = dao.getValidNum(date);
		state[1] = dao.getCancelNum();
		state[2] = dao.getPauseNum(date);
		state[3] = dao.getStopNum(date);
		int total = state[0]+state[1]+state[2]+state[3];
		double[] per = new double[4];
		for(int i=0;i<4;i++){
			BigDecimal b = new BigDecimal((double)state[i]*100/total);
			per[i] = b.setScale(3, BigDecimal.ROUND_HALF_UP).doubleValue();
		}
		ValidatePercentage v = new ValidatePercentage();
		v.setValid(per[0]);
		v.setCancel(per[1]);
		v.setPause(per[2]);
		v.setStop(per[3]);
		return v;
	}
}
