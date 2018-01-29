package dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import model.Activity;
import dao.ActivityDao;

public class ActivityDaoImpl implements ActivityDao {

	@Override
	public boolean hasAnActivity(String movieName) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql ="from Activity where movieName=?";
		int length = sess.createQuery(hql)
				.setString(0, movieName)
				.list()
				.size();
		//sess.flush();
		tx.commit(); 
		sess.clear();
		HibernateUtil.closeSession();
		if(length==1){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public void insert(Activity a) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		//sess.flush();
		sess.save(a);
		tx.commit();  
		sess.clear();
		HibernateUtil.closeSession();
	}

	@Override
	public List<String> getUndoneActivityByUserID(String ID) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String sql = "select distinct m.movieName from MovieSession m, Ticket t "
				+ "where m.ID = t.sessionID and t.userID=? "
				+ "and m.movieName not in"
				+ "(select a.movieName from ActivityAnswer a where a.userID=?)";
		@SuppressWarnings("unchecked")
		List<String> l = sess.createSQLQuery(sql)
//		.addEntity("m", MovieSession.class)
//		.addEntity("t", Ticket.class)
//		.addEntity("a", ActivityAnswer.class)
		.setString(0, ID)
		.setString(1, ID)
		.list();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return l;
	}

	@Override
	public Activity getActivityByName(String name) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql ="from Activity where movieName=?";
		Activity a  = (Activity)sess.createQuery(hql)
				.setString(0, name)
				.list().get(0);
		//sess.flush();
		tx.commit(); 
		sess.clear();
		HibernateUtil.closeSession();
		return a;
	}

}
