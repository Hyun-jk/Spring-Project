package kr.spring.movie.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.movie.dao.MovieMapper;
import kr.spring.movie.vo.MovieLikeVO;
import kr.spring.movie.vo.MovieVO;

@Service
public class MovieServiceImpl implements MovieService{
	
	@Autowired
	private MovieMapper movieMapper;

	@Override
	public List<MovieVO> selectList(Map<String, Object> map) {
		return movieMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return movieMapper.selectRowCount(map);
	}

	@Override
	public void insertMovie(MovieVO movie) {
		movieMapper.insertMovie(movie);
		
	}

	@Override
	public MovieVO selectMovie(int movie_num) {
		return movieMapper.selectMovie(movie_num);
	}

	@Override
	public void updateMovie(MovieVO movie) {
		movieMapper.updateMovie(movie);
		
	}

	@Override
	public void deleteMovie(Integer movie_num) {
		movieMapper.deleteMovie(movie_num);
	}

	@Override
	public void deleteFile(Integer movie_num) {
		movieMapper.deleteFile(movie_num);
		
	}
	

//	@Override
//	public List<MovieReviewVO> selectListReview(Map<String, Object> map) {
//		return movieMapper.selectListReview(map);
//	}
//
//	@Override
//	public int selectRowCountReview(Map<String, Object> map) {
//		return movieMapper.selectRowCountReview(map);
//	}
//
//	@Override
//	public MovieReviewVO selectReview(Integer review_num) {
//		return movieMapper.selectReview(review_num);
//	}
//
//	@Override
//	public void insertReview(MovieReviewVO movieReview) {
//		movieMapper.insertReview(movieReview);
//	}
//
//	@Override
//	public void updateReview(MovieReviewVO movieReview) {
//		movieMapper.updateReview(movieReview);
//	}
//
//	@Override
//	public void deleteReview(Integer review_num) {
//		movieMapper.deleteReview(review_num);
//	}

	 @Override 
	 public int checkLike(MovieLikeVO movielike) { 
	   return movieMapper.checkLike(movielike); 
	}

	@Override
	public void insertLike(MovieLikeVO movielike) {
		movieMapper.insertLike(movielike);
	}

	@Override
	public void deleteLike(MovieLikeVO movielike) {
		movieMapper.deleteLike(movielike);
	}

	@Override
	public int countLike(MovieLikeVO movielike) {
		return movieMapper.countLike(movielike);
	}
	
	@Override
	public int searchMovieCount(Map<String, Object> map) {
		return movieMapper.searchMovieCount(map);
	}

	@Override
	public List<MovieVO> searchMovieList(Map<String, Object> map) {
		return movieMapper.searchMovieList(map);
	}

	
	/*
	 * @Override public void insertTheater(MovieVO movie) {
	 * movieMapper.insertTheater(movie); }
	 */

}
	
