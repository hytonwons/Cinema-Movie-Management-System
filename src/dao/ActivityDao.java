package dao;

import java.util.List;

import model.Activity;

public interface ActivityDao {
	public boolean hasAnActivity(String movieName);
	public void insert(Activity a);
	public List<String> getUndoneActivityByUserID(String ID);
	public Activity getActivityByName(String name);
}
