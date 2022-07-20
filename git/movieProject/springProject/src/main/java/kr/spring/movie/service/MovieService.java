package kr.spring.movie.service;

import java.util.List;
import java.util.Map;

import kr.spring.movie.vo.MovieLikeVO;
import kr.spring.movie.vo.MovieReviewVO;
import kr.spring.movie.vo.MovieVO;

public interface MovieService {
	public List<MovieVO> selectList(Map<String,Object> map); //목록 생성
	public int selectRowCount(Map<String,Object> map); //페이징 처리
	public void insertMovie(MovieVO movie); //글 작성
	public MovieVO selectMovie(int movie); //상세보기
	public void updateMovie(MovieVO movie); //글 수정
	public void deleteMovie(Integer movie_num); //글 삭제
	public void deleteFile(Integer movie_num); //글 파일 삭제
	
//	//public void insertTheater(MovieVO movie); //극장등록
//	public List<MovieReviewVO> selectListReview(Map<String,Object> map); //목록생성
//	public int selectRowCountReview(Map<String,Object> map); //페이징처리
//	public MovieReviewVO selectReview(Integer review_num); //리뷰 목록
//	public void insertReview(MovieReviewVO movieReview); //리뷰 작성
//	public void updateReview(MovieReviewVO movieReview); //리뷰 수정
//	public void deleteReview(Integer review_num); //리뷰 삭제
	
	//좋아요
	public int checkLike(MovieLikeVO movielike); //좋아요 여부 체크
	public void insertLike(MovieLikeVO movielike); //좋아요 추가
	public void deleteLike(MovieLikeVO movielike); //좋아요 취소
	public int countLike(MovieLikeVO movielike); //좋아요 갯수
	
	//영화검색
	public int searchMovieCount(Map<String,Object> map);
	public List<MovieVO> searchMovieList(Map<String,Object> map);
}
