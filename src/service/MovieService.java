package service;

import java.util.List;

import model.Movie;

public interface MovieService {
	public Movie getMovieInfoByName(String name);
	public List<Movie> getActiveMovie();
	public void insert(Movie m);
	public void offLineMovie(int ID);
}
