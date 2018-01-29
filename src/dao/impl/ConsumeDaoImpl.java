package dao.impl;

import java.sql.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import model.Consume;
import dao.ConsumeDao;

public class ConsumeDaoImpl implements ConsumeDao{

	@Override
	public void insert(Consume c) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		sess.save(c);        
		//sess.flush();
		tx.commit();  
		sess.clear();
		HibernateUtil.closeSession();
	}

	@Override
	public List<Consume> getConsume(String userID) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql ="from Consume where userID=? order by date desc";
		@SuppressWarnings("unchecked")
		List<Consume> l= sess.createQuery(hql)
				.setString(0, userID)
				.list();
		for(int i=0; i<l.size();i++){   
			Consume c = l.get(i);
			System.out.print(c.getMoney());
			System.out.println(" "+c.getDate());
        }
		//sess.flush();
		tx.commit(); 
		sess.clear();
		HibernateUtil.closeSession();
		return l;
	}

	@Override
	public int whetherHaveConsumeByDate(Date date) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql ="from Consume where date=?";
		int length= sess.createQuery(hql)
				.setDate(0,date)
				.list()
				.size();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return length;
	}

	@Override
	public int getConsumeByDate(Date date) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql ="select sum(money) from Consume where date=?";
		Long l= (Long)sess.createQuery(hql)
				.setDate(0,date)
				.list()
				.get(0);
		int money = l.intValue();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return money;
	}

}
