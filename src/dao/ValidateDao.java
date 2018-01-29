package dao;

import java.sql.Date;

import model.Validate;

public interface ValidateDao {
	public void save(Validate v);
	public Validate getValidateByID(String ID);
	public boolean isCancled(String ID);
	public boolean isPaused(String ID,Date date);
	public boolean isStoped(String ID,Date date);
	public void cancel(String ID);
	public void update(String ID,Date date);
	public int getValidNum(Date date);
	public int getCancelNum();
	public int getPauseNum(Date date);
	public int getStopNum(Date date);
}
