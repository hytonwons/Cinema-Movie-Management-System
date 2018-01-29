package dao.impl;

import java.sql.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import model.Plan;
import dao.PlanDao;

public class PlanDaoImpl implements PlanDao{

	@Override
	public List<Plan> getPlanByDateAndHallNum(Date date, int hallNum) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		String hql = "from Plan where date=? and hallNum=? order by time";
		@SuppressWarnings("unchecked")
		List<Plan> p = sess.createQuery(hql)
		.setDate(0, date)
		.setInteger(1, hallNum)
		.list();
		//sess.flush();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return p;
	}

	@Override
	public void insert(Plan p) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		sess.save(p);
		//sess.flush();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
	}

	@Override
	public List<Plan> getPlan() {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		String hql ="from Plan where state = 0 order by date,hallNum,time";
		@SuppressWarnings("unchecked")
		List<Plan> p = sess.createQuery(hql).list();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return p;
	}

	@Override
	public Plan getPlanByID(int id) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		String hql ="from Plan where ID=?";
		Plan p= (Plan)sess.createQuery(hql).setInteger(0,id).list().get(0);
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return p;
	}

	@Override
	public void removePlan(int ID) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		String hql ="delete Plan p where p.ID=?";
		sess.createQuery(hql).setInteger(0,ID).executeUpdate();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
	}

	@Override
	public void updatePlan(int id, String time, int price) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		String hql = "update Plan set time=?,price=? where ID=?";
		sess.createQuery(hql)
			.setString(0, time)
			.setInteger(1, price)
			.setInteger(2, id)
			.executeUpdate();
		//sess.flush();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
	}

	@Override
	public void updateState(int id) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		String hql = "update Plan set state=1 where ID=?";
		sess.createQuery(hql)
			.setInteger(0, id)
			.executeUpdate();
		//sess.flush();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
	}

}
