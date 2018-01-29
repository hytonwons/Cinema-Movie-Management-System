package test;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import model.RegisterInfo;

public class Test {
	public static void main(String[] args){
		RegisterInfo info = new RegisterInfo();
		info.setBankCardNum("1234567891234567891");
		info.setID("1000000");
		info.setPassword("123");
		info.setTelephone("15950562958");
		
		Configuration config = new Configuration().configure();
		@SuppressWarnings("deprecation")
		SessionFactory sessionFactory = config.buildSessionFactory();
		Session session=sessionFactory.openSession();
		Transaction tx=session.beginTransaction();
		session.save(info);
		tx.commit();
		session.close();
		sessionFactory.close();
	}
}
