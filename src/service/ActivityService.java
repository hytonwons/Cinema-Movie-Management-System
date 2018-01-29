package service;

import java.util.List;

import model.Activity;

public interface ActivityService {
	public boolean hasAnActivity(String movieName);
	public void insert(String movieName, String q1, String q1_A,
			String q1_B, String q1_C, String q2, String q2_A, String q2_B,
			String q2_C);
	public List<String> getUndoneActivityByUserID(String ID);
	public Activity getActivityByName(String name);
}
