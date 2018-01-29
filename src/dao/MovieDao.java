package dao;

import java.util.List;

import model.Movie;

public interface MovieDao {
	public Movie getMovieInfoByName(String name);
	public List<Movie> getActiveMovie();
	public void insert(Movie m);
	public void offLineMovie(int ID);
	public int getLength(String name);
}
