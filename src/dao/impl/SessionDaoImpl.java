package dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import model.MovieSession;
import dao.SessionDao;

public class SessionDaoImpl implements SessionDao {

	@Override
	public List<MovieSession> getTodaySessionByPopularity() {
		// TODO Auto-generated method stub
		java.sql.Date date = GetCurSQLDate();
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String sql = "select m1.* from MovieSession m1 left join (select movieName,count(*) c from MovieSession where date=? group by movieName) m2 on m1.movieName=m2.movieName where m1.date=? order by m2.c desc,m1.movieName,m1.startTime";
		//addEntity cannot cast to model.MovieSession
		@SuppressWarnings("unchecked")
		List<MovieSession> l = sess.createSQLQuery(sql)
				.addEntity("m1", MovieSession.class)
				.setDate(0,date)
				.setDate(1,date)
				.list();
		System.out.println(l.size());
		for(int i=0; i<l.size();i++){   
			MovieSession ms = l.get(i);
			System.out.print(ms.getMovieName());
			System.out.println(" "+ms.getStartTime());
        }
		//sess.flush();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return l;
	}

	@Override
	public List<MovieSession> getTodaySeessionByTime() {
		// TODO Auto-generated method stub
		java.sql.Date date = GetCurSQLDate();
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql = "from MovieSession where date=? order by startTime";
		@SuppressWarnings("unchecked")
		List<MovieSession> l = sess.createQuery(hql)
				.setDate(0,date)
				.list();
		for(int i=0; i<l.size();i++){   
		   MovieSession ms = l.get(i);   
		   System.out.print(ms.getMovieName());
		   System.out.println(" "+ms.getStartTime());
		} 
		//sess.flush();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return l;
	}

	private java.sql.Date GetCurSQLDate(){   
		Date curDate = new Date();
		java.sql.Date date=new java.sql.Date(curDate.getTime());
		return date;
	}

	@Override
	public MovieSession getSessionByID(int sessionID) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql = "from MovieSession where ID=?";
		@SuppressWarnings("unchecked")
		List<MovieSession> l = sess.createQuery(hql)
				.setInteger(0, sessionID)
				.list();
		MovieSession ms = l.get(0);   
		System.out.print(ms.getMovieName());
		System.out.println(" "+ms.getStartTime());
		//sess.flush();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return ms;
	}

	@Override
	public void updateLeftSeat(int sessionID) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql = "update MovieSession ms set ms.leftSeat=ms.leftSeat-1 where ms.ID =?";
		sess.createQuery(hql)
		.setInteger(0,sessionID)
		.executeUpdate();
		//sess.flush();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
	}

	@Override
	public List<String> getMovieNameByDate(java.sql.Date date) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		String sql ="select distinct m.MovieName from MovieSession m where m.date=?";
		@SuppressWarnings("unchecked")
		List<String> m = sess.createSQLQuery(sql)
		.setDate(0, date)
		.list();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return m;
	}

	@Override
	public int getSessionNumByDate(java.sql.Date date) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		String hql ="select count(*) from MovieSession where date=?";
		Long l = (Long)sess.createQuery(hql)
		.setDate(0, date)
		.list().get(0);
		int num = l.intValue();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return num;
	}

	@Override
	public List<MovieSession> getTodaySeessionByMovie(String name) {
		// TODO Auto-generated method stub
		java.sql.Date date = GetCurSQLDate();
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql = "from MovieSession where date=? and movieName=? order by startTime";
		@SuppressWarnings("unchecked")
		List<MovieSession> l = sess.createQuery(hql)
				.setDate(0,date)
				.setString(1, name)
				.list();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return l;
	}

	@Override
	public int getTodaySessionNumByMovie(String name) {
		// TODO Auto-generated method stub
		java.sql.Date date = GetCurSQLDate();
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		String hql ="select count(*) from MovieSession where date=? and movieName=?";
		Long l = (Long)sess.createQuery(hql)
		.setDate(0, date)
		.setString(1,name)
		.list().get(0);
		int num = l.intValue();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return num;
	}

	@Override
	public void insert(MovieSession ms) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		sess.save(ms);
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
	}

	@Override
	public int whetherHaveSessionByDate(java.sql.Date date) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql ="from MovieSession where date=?";
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
	public int getLeftSeatByDate(java.sql.Date date) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql ="select sum(leftSeat) from MovieSession where date=?";
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

	@Override
	public int whetherHaveSessionByDateAndHallNum(java.sql.Date date,
			int hallNum) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql ="from MovieSession where date=? and hallNum=?";
		int length= sess.createQuery(hql)
				.setDate(0,date)
				.setInteger(1, hallNum)
				.list()
				.size();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return length;
	}

	@Override
	public int getLeftSeatByDateAndHallNum(java.sql.Date date, int hallNum) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql ="select sum(leftSeat) from MovieSession where date=? and hallNum=?";
		Long l= (Long)sess.createQuery(hql)
				.setDate(0,date)
				.setInteger(1, hallNum)
				.list()
				.get(0);
		int money = l.intValue();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return money;
	}

	@Override
	public int whetherHaveSessionByDateAndMovieName(java.sql.Date date,
			String movieName) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql ="from MovieSession where date=? and movieName=?";
		int length= sess.createQuery(hql)
				.setDate(0,date)
				.setString(1, movieName)
				.list()
				.size();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return length;
	}

	@Override
	public int getLeftSeatByDateAndMovieName(java.sql.Date date,
			String movieName) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tx = sess.beginTransaction();
		String hql ="select sum(leftSeat) from MovieSession where date=? and movieName=?";
		Long l= (Long)sess.createQuery(hql)
				.setDate(0,date)
				.setString(1, movieName)
				.list()
				.get(0);
		int money = l.intValue();
		tx.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return money;
	} 
}
