package dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import model.Payment;
import dao.PaymentDao;

public class PaymentDaoImpl implements PaymentDao {

	@Override
	public List<Payment> getPayment(String ID) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql ="from Payment where userID=?";
		@SuppressWarnings("unchecked")
		List<Payment> l= sess.createQuery(hql)
				.setString(0, ID)
				.list();
		for(int i=0; i<l.size();i++){   
			Payment p = l.get(i);
			System.out.print(p.getMoney());
			System.out.println(" "+p.getDate());
        }
		//sess.flush();
		tx.commit(); 
		sess.clear();
		HibernateUtil.closeSession();
		return l;
	}

	@Override
	public void save(Payment p) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		sess.save(p);
		//sess.flush();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
	}

}
