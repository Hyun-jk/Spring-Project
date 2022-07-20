package kr.spring.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.movie.vo.MovieReviewVO;
import kr.spring.movie.vo.MovieVO;
import kr.spring.reserve.vo.ReserveVO;

public interface MemberMovieMapper {
	

		//내가 본 영화 리스트 카운트
		public int selectMyWatchedMovieCount(Map<String,Object> map);
		
		//내가 본 영화 리스트
		public List<ReserveVO> selectMyWatchedMovie(Map<String,Object> map);
		
		//내가 예매한 영화 리스트 카운트
		public int selectMyReserveMovieCount(Map<String,Object> map);
		
		//내가 예매한 영화 리스트
		public List<ReserveVO> selectMyReserveMovie(Map<String,Object> map);
		
		//내가 관심 있는 영화 리스트 카운트
		@Select("SELECT COUNT(*) FROM My_Movie my JOIN M_movie m ON my.movie_num = m.movie_num WHERE mem_num = #{mem_num}")
		public int selectMyInterestedMovieCount(Map<String,Object> map);
		
		//내가 관심 있는 영화 리스트
		public List<MovieVO> selectMyInterestedMovie(Map<String,Object> map);
		
		//내가 본 영화,예매한 영화 삭제하기
		@Delete("DELETE FROM M_reserve WHERE reserve_num = #{reserve_num}")
		public void deleteMyMovie(int reserve_num);
		
		//예매 리스트 뽑아오기
		@Select("Select * FROM m_reserve WHERE reserve_num = #{reserve_num}")
		public ReserveVO selectMyMovie(int reserve_num);
		
		//리뷰 평가 reveiw num 구하기
		@Select("SELECT M_review_seq.nextval FROM dual")
		public int selectReview_num();
		
		//리뷰 평가 입력하기
		@Insert("INSERT INTO M_review(review_num,review_content,review_rate,movie_num,mem_num) VALUES(#{review_num},#{review_content},#{review_rate},#{movie_num},#{mem_num})")
		public void insertReview(MovieReviewVO review);
		
		//리뷰평가 총 카운트 계산하기
		@Select("SELECT SUM(review_rate)/count(review_rate) FROM M_review WHERE movie_num = #{movie_num}")
		public int countTotalMovieRate(MovieReviewVO review);
		
		//리뷰평가 계산한 후에 무비에 업데이트 하기
		@Update("UPDATE m_movie SET movie_rate = #{total_rate} WHERE movie_num = #{movie_num}")
		public void updateMovieRate(MovieReviewVO review);
		
		//내가 리뷰 평가한 리스트 카운트
		@Select("SELECT COUNT(*) FROM M_review r JOIN M_movie m ON r.movie_num = m.movie_num WHERE mem_num = #{mem_num}")
		public int selectMyReviewListCount(Map<String,Object> map);
		
		//내가 리뷰 평가 한 리스트
		public List<MovieReviewVO> selectMyReviewList(Map<String,Object> map);

		//리뷰 디테일 리스트
		@Select("SELECT * FROM M_review WHERE review_num = #{review_num}")
		public MovieReviewVO selectReviewDetail(int review_num);
		
		//리뷰 수정하기
		@Update("UPDATE M_review SET review_rate =#{review_rate},review_content=#{review_content} WHERE review_num = #{review_num}")
		public void updateMyReview(MovieReviewVO review);
		
		//리뷰 삭제하기
		@Select("Delete M_review WHERE review_num = #{review_num}")
		public void deleteMyReview(MovieReviewVO review);
		
}
