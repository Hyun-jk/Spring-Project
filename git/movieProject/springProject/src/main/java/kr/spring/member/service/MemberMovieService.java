package kr.spring.member.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.movie.vo.MovieReviewVO;
import kr.spring.movie.vo.MovieVO;
import kr.spring.reserve.vo.ReserveVO;

public interface MemberMovieService {
	//내가 본 영화 리스트 카운트
			public int selectMyWatchedMovieCount(Map<String,Object> map);
			
			//내가 본 영화 리스트
			public List<ReserveVO> selectMyWatchedMovie(Map<String,Object> map);
			
			//내가 예매한 영화 리스트 카운트
			public int selectMyReserveMovieCount(Map<String,Object> map);
			
			//내가 예매한 영화 리스트
			public List<ReserveVO> selectMyReserveMovie(Map<String,Object> map);
			
			//내가 본 영화,예매한 영화 삭제하기
			public void deleteMyMovie(int reserve_num);
			
			//내가 관심 있는 영화 리스트 카운트
			public int selectMyInterestedMovieCount(Map<String,Object> map);
			
			//내가 관심 있는 영화 리스트
			public List<MovieVO> selectMyInterestedMovie(Map<String,Object> map);
			
			//예매 리스트 뽑아오기
			public ReserveVO selectMyMovie(int reserve_num);
			
			//리뷰 평가 입력하기
			public void insertReview(MovieReviewVO review);
			
			//내가 리뷰 평가한 리스트 카운트
			public int selectMyReviewListCount(Map<String,Object> map);
			
			//내가 리뷰 평가 한 리스트
			public List<MovieReviewVO> selectMyReviewList(Map<String,Object> map);

			//리뷰 디테일 리스트
			public MovieReviewVO selectReviewDetail(int review_num);
			
			//리뷰 수정하기
			public void updateMyReview(MovieReviewVO review);
			
			//리뷰 삭제하기
			public void deleteMyReview(MovieReviewVO review);
			
}
