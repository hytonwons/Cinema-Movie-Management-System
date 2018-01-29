package service.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import dao.MovieDao;
import dao.PlanDao;
import model.Plan;
import service.PlanService;

public class PlanServiceImpl implements PlanService{
	private PlanDao dao;
	private MovieDao dao_;
	private List<Plan> plan  = new ArrayList<Plan>();
	
	private PlanServiceImpl(){
		
	}
	@Override
	public boolean canHavePlan(Plan p) {
		// TODO Auto-generated method stub
		int flag = 0;
		plan = dao.getPlanByDateAndHallNum(p.getDate(), p.getHallNum());
		if(plan.size()==0){
			return true;
		}else{
			for(int i = 0;i<plan.size();i++){
				Plan pl = plan.get(i);
				int timeFromDB = transferIntoMin(pl.getTime());
				int timeFromInput = transferIntoMin(p.getTime());
				int length = dao_.getLength(p.getMovieName());
				if(timeFromInput-timeFromDB>=(length+5) || timeFromDB-timeFromInput>=(length+5)){
					
				}else{
					flag = 1;//不能插入
				}
			}
		}
		if(flag==1){
			return false;
		}else{
			return true;
		}
	}

	@Override
	public void insert(Plan p) {
		// TODO Auto-generated method stub
		dao.insert(p);
	}
	public PlanDao getDao() {
		return dao;
	}
	public void setDao(PlanDao dao) {
		this.dao = dao;
	}
	
	private int transferIntoMin(String time){
		String[] result = time.split(":");
		String hour = result[0];
		int h = 0;
		String minute = result[1];
		int m = 0;
		if(hour.startsWith("0")){
			h = Integer.parseInt(hour.substring(1, 2));
		}else{
			h = Integer.parseInt(hour);
		}
		if(minute.startsWith("0")){
			m = Integer.parseInt(minute.substring(1, 2));
		}else{
			m = Integer.parseInt(minute);
		}
		m = h*60+m;
		return m;
	}
	@Override
	public List<Plan> findPlanByDateAndHallNum(Date date, int hallNum) {
		// TODO Auto-generated method stub
		return dao.getPlanByDateAndHallNum(date, hallNum);
	}

	@Override
	public List<Plan> getPlan() {
		// TODO Auto-generated method stub
		return dao.getPlan();
	}
	@Override
	public Plan getPlanByID(int id) {
		// TODO Auto-generated method stub
		return dao.getPlanByID(id);
	}
	@Override
	public void removePlan(int id) {
		// TODO Auto-generated method stub
		dao.removePlan(id);
	}
	@Override
	public void updatePlan(int id, String time, int price) {
		// TODO Auto-generated method stub
		dao.updatePlan(id, time, price);
	}
	@Override
	public void updateState(int id) {
		// TODO Auto-generated method stub
		dao.updateState(id);
	}
	public MovieDao getDao_() {
		return dao_;
	}
	public void setDao_(MovieDao dao_) {
		this.dao_ = dao_;
	}
}
