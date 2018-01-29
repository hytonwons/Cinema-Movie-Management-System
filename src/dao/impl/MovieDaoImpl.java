package dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import model.Movie;
import dao.MovieDao;

public class MovieDaoImpl implements MovieDao {

	@Override
	public Movie getMovieInfoByName(String name) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		String hql="from Movie where name=?";
		Movie m = (Movie)sess.createQuery(hql)
		.setString(0, name)
		.list().get(0);
		System.out.println(m.getActor());
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return m;
	}

	@Override
	public List<Movie> getActiveMovie() {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		String hql="from Movie where active=0";
		@SuppressWarnings("unchecked")
		List<Movie> m =sess.createQuery(hql).list();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return m;
	}

	@Override
	public void insert(Movie m) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		sess.save(m);
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
	}

	@Override
	public void offLineMovie(int ID) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		String hql="update Movie set active=1 where ID=?";
		sess.createQuery(hql).setInteger(0, ID).executeUpdate();
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
	}

	@Override
	public int getLength(String name) {
		// TODO Auto-generated method stub
		Session sess = HibernateUtil.currentSession();
		Transaction tr = sess.beginTransaction();
		String hql="select length from Movie where name=?";
		int length = (int)sess.createQuery(hql).setString(0, name).list().get(0);
		tr.commit();
		sess.clear();
		HibernateUtil.closeSession();
		return length;
	}

}
