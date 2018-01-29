package service.impl;

import dao.ActivityAnswerDao;
import model.ActivityAnswer;
import service.ActivityAnswerService;

public class ActivityAnswerServiceImpl implements ActivityAnswerService{
	private ActivityAnswerDao dao;
	
	private ActivityAnswerServiceImpl(){
		
	}
	@Override
	public void save(ActivityAnswer a) {
		// TODO Auto-generated method stub
		dao.save(a);
	}
	public ActivityAnswerDao getDao() {
		return dao;
	}
	public void setDao(ActivityAnswerDao dao) {
		this.dao = dao;
	}

}
