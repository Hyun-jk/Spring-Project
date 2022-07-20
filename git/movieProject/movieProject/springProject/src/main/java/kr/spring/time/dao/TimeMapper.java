package kr.spring.time.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.movie.vo.MovieVO;
import kr.spring.reserve.vo.ReserveVO;
import kr.spring.reserve.vo.ReserveseatVO;
import kr.spring.seat.vo.SeatVO;
import kr.spring.theater.vo.TheaterVO;
import kr.spring.time.vo.TimeVO;

public interface TimeMapper {

	//1.극장등록
	//무비번호 구하기
	@Select("SELECT * FROM M_movie m WHERE m.movie_num=#{movie_num}")
	public MovieVO selectMovie2(Integer movie_num);

	//극장 등록
	@Insert("INSERT INTO M_time (time_num,theater_num,movie_num,movie_name,movie_date,movie_time) "
			+ "VALUES (M_time_seq.nextval,#{theater_num},#{movie_num},#{movie_name},#{movie_date},#{movie_time})")
	public void insertTheater2(TimeVO timeVO);
	
	//2. 좌석 등록
	@Insert("INSERT INTO M_seat (seat_num,theater_num,seat_name) VALUES (M_seat_seq.nextval,#{theater_num},#{seat_name})")
	public void insertSeat(SeatVO seatVO);
	
	//3.리스트
	@Select("select time_num,movie_num,theater_num,t.movie_name,movie_genre,movie_pg,movie_auth,to_char(movie_date,'YYYY/MM/DD') movie_date,movie_time,movie_showtm,theater_name from m_time t JOIN m_theater h using(theater_num) JOIN m_movie USING(movie_num) where movie_date=#{movie_date} and theater_num=#{theater_num}") 
	public List<TimeVO> selectList(Map<String,Object> map);
	@Select("select movie_time, total_count, reserv_count, total_count-reserv_count rest_count FROM (select movie_time, (select count(*) from m_seat where theater_num=#{theater_num}) total_count, count(revseat_num) reserv_count from m_reservseat r right outer join m_time using(time_num) where theater_num=#{theater_num} and to_char(movie_date,'YYYY/MM/DD')=#{movie_date} group by movie_time) order by movie_time")
	public List<TimeVO> selectTimeList(Map<String,Object> map);
	
}
