package dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import model.Ticket;
import dao.TicketDao;

public class TicketDaoImpl implements TicketDao{

	@Override
	public List<Ticket> getTicket(int sessionID) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql = "from Ticket where sessionID=?";
		@SuppressWarnings("unchecked")
		List<Ticket> l = sess.createQuery(hql)
				.setInteger(0, sessionID)
				.list();
		for(int i=0; i<l.size();i++){   
			Ticket t = l.get(i);   
			System.out.print(t.getRow());
			System.out.println(" "+t.getColumn());
		} 
		//sess.flush();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return l;
	}

	@Override
	public int insert(Ticket t) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		sess.save(t);
		String hql = "select ID from Ticket where sessionID=? and row=? and column=?";
		int ID = (int) sess.createQuery(hql)
			.setInteger(0, t.getSessionID())
		 	.setInteger(1, t.getRow())
		 	.setInteger(2, t.getColumn())
			.list().get(0);
		//sess.flush();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return ID;
	}

	@Override
	public int getCashPrice() {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql = "select sum(price) from Ticket where userID=''";
		Long l= (Long) sess.createQuery(hql)
				.list()
				.get(0);
		int p = l.intValue();
		System.out.println(p);
		//sess.flush();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return p;
	}

	@Override
	public int getTotalPrice() {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql = "select sum(price) from Ticket";
		Long l= (Long) sess.createQuery(hql)
				.list()
				.get(0);
		int p = l.intValue();
		System.out.println(p);
		//sess.flush();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return p;
	}
}
