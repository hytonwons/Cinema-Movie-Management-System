package dao;

import java.sql.Date;
import java.util.List;

import model.Plan;

public interface PlanDao {
	public List<Plan> getPlanByDateAndHallNum(Date date, int hallNum);
	public void insert(Plan p);
	public List<Plan> getPlan();
	public Plan getPlanByID(int id);
	public void removePlan(int ID);
	public void updatePlan(int id, String time, int price);
	public void updateState(int id);
}
