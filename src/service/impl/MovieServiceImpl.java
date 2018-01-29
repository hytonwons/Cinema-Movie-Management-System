package service.impl;

import java.util.List;

import model.Movie;
import dao.MovieDao;
import service.MovieService;

public class MovieServiceImpl implements MovieService {
	private MovieDao dao;
	
	private MovieServiceImpl(){
		
	}

	public MovieDao getDao() {
		return dao;
	}

	public void setDao(MovieDao dao) {
		this.dao = dao;
	}

	@Override
	public Movie getMovieInfoByName(String name) {
		// TODO Auto-generated method stub
		return dao.getMovieInfoByName(name);
	}

	@Override
	public List<Movie> getActiveMovie() {
		// TODO Auto-generated method stub
		return dao.getActiveMovie();
	}

	@Override
	public void insert(Movie m) {
		// TODO Auto-generated method stub
		dao.insert(m);
	}

	@Override
	public void offLineMovie(int ID) {
		// TODO Auto-generated method stub
		dao.offLineMovie(ID);
	}
}
