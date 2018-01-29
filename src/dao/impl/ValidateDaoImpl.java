package dao.impl;


import java.sql.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import model.Validate;
import dao.ValidateDao;

public class ValidateDaoImpl implements ValidateDao{

	@Override
	public void save(Validate v) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		sess.save(v);
		//sess.flush();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
	}

	@Override
	public Validate getValidateByID(String ID) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		String hql ="from Validate where userID=?";
		Validate v = (Validate)sess.createQuery(hql)
		.setString(0, ID)
		.list().get(0);
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return v;
	}

	@Override
	public boolean isCancled(String ID) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		String hql ="from Validate where userID=? and cancel=1";
		int length = sess.createQuery(hql)
		.setString(0, ID)
		.list().size();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
		if(length==0){
			return false;
		}else{
			return true;
		}
	}

	@Override
	public boolean isPaused(String ID,Date date) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		String hql ="from Validate where userID=? and validDate<?";
		int length = sess.createQuery(hql)
		.setString(0, ID)
		.setDate(1,date)
		.list().size();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
		if(length==0){
			return false;
		}else{
			return true;
		}
	}

	@Override
	public boolean isStoped(String ID,Date date) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		//hql不支持date_add
		String sql ="select v.* from Validate v where v.userID=? and DATE_ADD(v.validDate,INTERVAL 1 YEAR)<?";
		int length = sess.createSQLQuery(sql)
		.setString(0, ID)
		.setDate(1,date)
		.list().size();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
		if(length==0){
			return false;
		}else{
			return true;
		}
	}

	@Override
	public void cancel(String ID) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		String hql="update Validate set cancel = 1 where userID =?";
		sess.createQuery(hql)
		.setString(0, ID)
		.executeUpdate();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
	}

	@Override
	public void update(String ID, Date date) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		String hql="update Validate set validDate = ? where userID =?";
		sess.createQuery(hql)
		.setDate(0, date)
		.setString(1, ID)
		.executeUpdate();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
	}

	@Override
	public int getValidNum(Date date) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		String hql ="from Validate where validDate>?";
		int length = sess.createQuery(hql)
		.setDate(0,date)
		.list().size();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return length;
	}

	@Override
	public int getCancelNum() {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		String hql ="from Validate where cancel=1";
		int length = sess.createQuery(hql)
		.list().size();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return length;
	}

	@Override
	public int getPauseNum(Date date) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		String hql ="from Validate where validDate<?";
		int length = sess.createQuery(hql)
		.setDate(0,date)
		.list().size();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return length;
	}

	@Override
	public int getStopNum(Date date) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		//hql不支持date_add
		String sql ="select v.* from Validate v where DATE_ADD(v.validDate,INTERVAL 1 YEAR)<?";
		int length = sess.createSQLQuery(sql)
		.setDate(0,date)
		.list().size();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return length;
	}
	
}
