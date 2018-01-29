package service;

import java.sql.Date;
import java.util.List;

import model.Plan;

public interface PlanService {
	public boolean canHavePlan(Plan p);
	public void insert(Plan p);
	public List<Plan> findPlanByDateAndHallNum(Date date,int hallNum);
	public List<Plan> getPlan();
	public Plan getPlanByID(int id);
	public void removePlan(int id);
	public void updatePlan(int id,String time,int price);
	public void updateState(int id);
}
