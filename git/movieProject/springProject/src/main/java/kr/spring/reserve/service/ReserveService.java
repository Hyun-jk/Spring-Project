package kr.spring.reserve.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.movie.vo.MovieVO;
import kr.spring.reserve.vo.ReserveVO;
import kr.spring.reserve.vo.ReserveseatVO;
import kr.spring.theater.vo.TheaterVO;
import kr.spring.time.vo.TimeVO;

public interface ReserveService {
	//예매하기 1단계
	public List<MovieVO> selectMovieList();
	public List<TheaterVO> selectTheaterList();
	public MovieVO pickmoviedetail(Integer movie_num);
	public List<TheaterVO> pickmoviedetail_get_theater_local(Integer movie_num);
	public List<Integer> pickmoviedetail_get_theater_localcount(Integer movie_num);
	public List<TheaterVO> pickmoviedetail_get_theater_cgv(Map<String,Object> map);
	public List<TimeVO> pickmoviedetail_get_date(Map<String,Object> map);
	public List<TimeVO> pickmoviedetail_get_time(Map<String,Object> map);
	
	//예매하기2단계
	public TheaterVO picktheaterdetail(Integer theater_num);
	public TimeVO picktimedetail(Integer time_num);
	public List<ReserveVO> seatlist(Integer time_num);
	public List<ReserveseatVO> reservseatlist(Integer time_num);
	public int seat_total_count(Integer time_num);
	public int reservseat_total_count(Integer time_num);
	
	//예매완료
	public void insertreserveseat(List<Map<String,Object>> list);
	public void insertreserve(ReserveVO reserveVO);
}
