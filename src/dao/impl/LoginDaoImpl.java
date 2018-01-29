package dao.impl;


import java.util.List;

import model.User;
import dao.LoginDao;

import org.hibernate.Transaction;
import org.hibernate.Session;

public class LoginDaoImpl implements LoginDao {

	@Override
	public boolean findUser(User user) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		@SuppressWarnings({ "unchecked" })
		List<User> l = sess.createQuery("from User where ID =? and password =?")
			.setString(0,user.getID()).setString(1, user.getPassword())
			.list();
		//sess.flush();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
		if(l!=null && !l.isEmpty()){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean findByID(String ID) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		int size = sess.createQuery("from User where ID =?")
			.setString(0,ID)
			.list().size();
		//sess.flush();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
		if(size==0){
			return false;
		}
		return true;
	}

	@Override
	public void save(User user) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		sess.save(user);
		//sess.flush();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
	}

	@Override
	public void update(String ID, String password) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		String hql="update User set password=? where ID=?";
		sess.createQuery(hql).setString(0, password).setString(1, ID).executeUpdate();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
	}

}
