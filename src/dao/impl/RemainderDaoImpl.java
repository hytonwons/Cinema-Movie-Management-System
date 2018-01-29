package dao.impl;

import model.Remainder;

import org.hibernate.Session;
import org.hibernate.Transaction;

import dao.RemainderDao;

public class RemainderDaoImpl implements RemainderDao{

	@Override
	public int getRemainder(String userID) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql = "select money from Remainder where userID=?";
		int money= (int) sess.createQuery(hql)
				.setString(0, userID)
				.list()
				.get(0);
		System.out.println(money);
		//sess.flush();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return money;
	}

	@Override
	public void subRemainder(String userID, int money) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql = "update Remainder r set r.money=r.money-? where r.userID =?";
		sess.createQuery(hql)
		.setInteger(0,money)
		.setString(1,userID)
		.executeUpdate();
		//sess.flush();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
	}

	@Override
	public void addRemainder(String userID, int money) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql = "update Remainder r set r.money=r.money+? where r.userID =?";
		sess.createQuery(hql)
		.setInteger(0,money)
		.setString(1,userID)
		.executeUpdate();
		//sess.flush();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
	}

	@Override
	public void save(Remainder r) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		sess.save(r);
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
	}
	
}
