package dao.impl;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import model.RegisterInfo;
import dao.RegisterInfoDao;

public class RegisterInfoDaoImpl implements RegisterInfoDao {
		
	private RegisterInfoDaoImpl(){
		
	}
	
	@Override
	public boolean save(RegisterInfo info) {
		// TODO Auto-generated method stub
		try{
			Configuration config = new Configuration().configure();
			@SuppressWarnings("deprecation")
			SessionFactory sessionFactory = config.buildSessionFactory();
			Session session=sessionFactory.openSession();
			Transaction tx=session.beginTransaction();
			session.save(info);
			//session.flush();
			tx.commit();
			session.clear();
			session.close();
			sessionFactory.close();
			System.out.println("注册成功");
			return true;
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public String createNewID() {
		// TODO Auto-generated method stub
		Session session=HibernateUtil.currentSession();
		Transaction tx=session.beginTransaction();
		String hql = "from RegisterInfo";
		Query query = session.createQuery(hql);
		int ID =query.list().size()+1000000;  
		//session.flush();
		tx.commit();
		session.clear();
		HibernateUtil.closeSession();
		System.out.println("生成码"+ID);
		return String.valueOf(ID); 
	}

	@Override
	public RegisterInfo findByID(String ID) {
		// TODO Auto-generated method stub
		RegisterInfo ri = null;
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		ri = (RegisterInfo)sess.createQuery("from RegisterInfo where ID =?")
			.setString(0,ID)
			.list().get(0);
		//sess.flush();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return ri;
	}

	@Override
	public int getDiscount(String ID) {
		// TODO Auto-generated method stub
		//System.out.println("i am here");
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql = "select level from RegisterInfo where ID=?";
		int level= (int) sess.createQuery(hql)
				.setString(0, ID)
				.list()
				.get(0);
		System.out.println(level);
		//sess.flush();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return level;
	}

	@Override
	public RegisterInfo findByTel(String tel) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		RegisterInfo ri = (RegisterInfo)sess.createQuery("from RegisterInfo where telephone =?")
			.setString(0,tel)
			.list().get(0);
		//sess.flush();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return ri;
	}

	@Override
	public boolean checkByTel(String tel) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		int size = sess.createQuery("from RegisterInfo where telephone =?")
			.setString(0,tel)
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
	public void updateLevel(String userID, int level) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		String hql = "update RegisterInfo set level=? where ID=?";
		sess.createQuery(hql)
			.setInteger(0, level)
			.setString(1, userID)
			.executeUpdate();
		//sess.flush();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
	}

	@Override
	public void addPoint(String ID, int point) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		String hql = "update RegisterInfo set point=point+? where ID=?";
		sess.createQuery(hql)
			.setInteger(0, point)
			.setString(1, ID)
			.executeUpdate();
		//sess.flush();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
	}

	@Override
	public void modify(String ID, String tel, String passwd, String bankCard) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		String hql = "update RegisterInfo set telephone=?,password=?,bankCardNum=? where ID=?";
		sess.createQuery(hql)
			.setString(0, tel)
			.setString(1, passwd)
			.setString(2, bankCard)
			.setString(3, ID)
			.executeUpdate();
		//sess.flush();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
	}

	@Override
	public void subPoint(String ID, int point) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		String hql = "update RegisterInfo set point=point-? where ID=?";
		sess.createQuery(hql)
			.setInteger(0, point)
			.setString(1, ID)
			.executeUpdate();
		//sess.flush();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
	}

	@Override
	public int getTotalMan() {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql = "select count(*) from RegisterInfo where gender=1";
		Long l= (Long) sess.createQuery(hql)
				.list()
				.get(0);
		int man = l.intValue();
		System.out.println(man);
		//sess.flush();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return man;
	}

	@Override
	public int getTotalWoman() {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql = "select count(*) from RegisterInfo where gender=2";
		Long l= (Long) sess.createQuery(hql)
				.list()
				.get(0);
		int woman = l.intValue();
		System.out.println(woman);
		//sess.flush();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return woman;
	}

	@Override
	public int getTotalAge(int age) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql = "select count(*) from RegisterInfo where age=?";
		Long l= (Long) sess.createQuery(hql)
				.setInteger(0, age)
				.list()
				.get(0);
		int a = l.intValue();
		System.out.println(a);
		//sess.flush();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return a;
	}

	@Override
	public int getTotalLevel(int level) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql = "select count(*) from RegisterInfo where level=?";
		Long l= (Long) sess.createQuery(hql)
				.setInteger(0, level)
				.list()
				.get(0);
		int v = l.intValue();
		System.out.println(v);
		//sess.flush();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return v;
	}

}
