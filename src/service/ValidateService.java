package service;

import java.sql.Date;

import model.Validate;
import model.ValidatePercentage;

public interface ValidateService {
	public void save(Validate v);
	public Date getValidDateByID(String ID);
	public boolean isCancled(String ID);
	public boolean isPaused(String ID);
	public boolean isStoped(String ID);
	public void cancel(String ID);
	public void update(String ID,Date date);
	public ValidatePercentage getValidatePercentage();
}
