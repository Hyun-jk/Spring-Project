package kr.spring.movie.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.movie.vo.MovieLikeVO;
import kr.spring.movie.vo.MovieReviewVO;
import kr.spring.movie.vo.MovieVO;



public interface MovieMapper {
	//부모글
	public List<MovieVO> selectList(Map<String,Object> map); //목록 생성
	public int selectRowCount(Map<String,Object> map); //페이징 처리
	@Insert("INSERT INTO M_movie (movie_num,movie_name,movie_content,uploadfile,filename,movie_genre,movie_auth,movie_pg,movie_showtm) "
			+ "VALUES (M_movie_seq.nextval,#{movie_name},#{movie_content},#{uploadfile},#{filename},#{movie_genre},#{movie_auth},#{movie_pg},#{movie_showtm})")
	public void insertMovie(MovieVO movie); //글 작성
	public MovieVO selectMovie(int movie_num); //상세보기
	public void updateMovie(MovieVO movie); //글 수정
	@Delete("DELETE FROM M_movie WHERE movie_num=#{movie_num}")
	public void deleteMovie(Integer movie_num); //글 삭제
	@Update("UPDATE M_movie SET uploadfile='',filename='' "
			+ "WHERE movie_num=#{movie_num}")
	public void deleteFile(Integer movie_num); //글 파일 삭제
	
	/*
	 * @Insert("INSERT INTO M_movie (movie_num,movie_name,movie_genre,movie_auth,movie_pg,movie_date,movie_time) "
	 * +
	 * "VALUES (M_movie_seq.nextval,#{movie_name},#{movie_genre},#{movie_auth},#{movie_pg},#{movie_date},#{movie_time})"
	 * ) public void insertTheater(MovieVO movie); //극장 등록 - 찬미
	 */	
	//리뷰
//	public List<MovieReviewVO> selectListReview(Map<String,Object> map); //목록생성
//	@Select("SELECT COUNT(*) FROM M_review r JOIN M_member m "
//			+ "ON r.mem_num=m.mem_num WHERE r.movie_num=#{movie_num}")
//	public int selectRowCountReview(Map<String,Object> map); //페이징처리
//	@Select("SELECT * FROM M_review WHERE review_num=#{review_num}")
//	public MovieReviewVO selectReview(Integer review_num); //리뷰 목록
//	@Insert("INSERT INTO M_review (review_num,movie_num,"
//			+ "review_content,review_rate,mem_num) VALUES (M_review_seq.nextval,"
//			+ "#{movie_num},#{review_content},#{review_rate},#{mem_num})")
//	public void insertReview(MovieReviewVO movieReview); //리뷰 작성
//	@Update("UPDATE M_review SET review_content=#{review_content},"
//			+ "review_reg_date=SYSDATE WHERE review_num=#{review_num}")
//	public void updateReview(MovieReviewVO movieReview); //리뷰 수정
//	@Delete("DELETE FROM M_review WHERE review_num=#{review_num}")
//	public void deleteReview(Integer review_num); //리뷰 삭제
//	//부모글 삭제시 댓글이 존재하면 부모글 삭제전 댓글 삭제
//	@Delete("DELETE FROM M_review WHERE movie_num=#{movie_num}")
//	public void deleteReviewByMovieNum(Integer movie_num);
	
	//좋아요
	@Insert("INSERT INTO My_movie (my_movie_num,movie_num,mem_num) VALUES (My_movie_seq.nextval,#{movie_num},#{mem_num} )")
	public void insertLike(MovieLikeVO movielike); //좋아요 추가
	@Delete("DELETE FROM My_movie WHERE movie_num = #{movie_num} AND mem_num = #{mem_num}")
	public void deleteLike(MovieLikeVO movielike); //좋아요 취소
	@Select("SELECT COUNT(*) FROM My_movie WHERE movie_num = #{movie_num} AND mem_num = #{mem_num}" )
	public int checkLike(MovieLikeVO movielike); 	
	@Select("SELECT COUNT(*) FROM My_movie m WHERE m.movie_num=#{movie_num}")
	public int countLike(MovieLikeVO movielike); //좋아요 갯수
	
	//영화검색
	public int searchMovieCount(Map<String,Object> map);
	public List<MovieVO> searchMovieList(Map<String,Object> map);
}
