package dao.impl;

import org.hibernate.Session;
import org.hibernate.Transaction;

import model.ActivityAnswer;
import dao.ActivityAnswerDao;

public class ActivityAnswerDaoImpl implements ActivityAnswerDao{

	@Override
	public void save(ActivityAnswer a) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		sess.save(a);
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
	}

}
