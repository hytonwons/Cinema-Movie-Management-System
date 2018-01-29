package service.impl;

import java.util.List;

import dao.ActivityDao;
import model.Activity;
import service.ActivityService;

public class ActivityServiceImpl implements ActivityService{
	private ActivityDao dao;
	//private Activity a;
	Activity a = new Activity();
	
	private ActivityServiceImpl(){
		
	}
	
	@Override
	public boolean hasAnActivity(String movieName) {
		// TODO Auto-generated method stub
		return dao.hasAnActivity(movieName);
	}


	public ActivityDao getDao() {
		return dao;
	}

	public void setDao(ActivityDao dao) {
		this.dao = dao;
	}

	@Override
	public void insert(String movieName, String q1, String q1_A, String q1_B,
			String q1_C, String q2, String q2_A, String q2_B, String q2_C) {
		// TODO Auto-generated method stub
		setActivity(movieName, q1, q1_A, q1_B,
				q1_C, q2, q2_A, q2_B, q2_C);
		dao.insert(a);
	}

	private Activity setActivity(String movieName, String q1, String q1_A,
			String q1_B, String q1_C, String q2, String q2_A, String q2_B,
			String q2_C) {
		System.out.println(q1);
		a.setMovieName(movieName);
		a.setQ1(setQuestion(q1));
		a.setQ1_A(q1_A);
		a.setQ1_B(q1_B);
		a.setQ1_C(q1_C);
		a.setQ2(setQuestion(q2));
		a.setQ2_A(q2_A);
		a.setQ2_B(q2_B);
		a.setQ2_C(q2_C);
		return a;
	}
	
	private String setQuestion(String q){
		String question = "";
		if(q.equals("1")){
			question="您怎样评价这部影片？";
		}
		if(q.equals("2")){
			question="您觉得未来几天应该对这部影片的排片做怎样的调整？";
		}
		if(q.equals("3")){
			question="您觉得这部影片适合什么时段排映？";
		}
		return question;
	}

	@Override
	public List<String> getUndoneActivityByUserID(String ID) {
		// TODO Auto-generated method stub
		return dao.getUndoneActivityByUserID(ID);
	}

	@Override
	public Activity getActivityByName(String name) {
		// TODO Auto-generated method stub
		return dao.getActivityByName(name);
	}
	
}
