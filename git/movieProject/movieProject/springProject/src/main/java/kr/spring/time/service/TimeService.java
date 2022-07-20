package kr.spring.time.service;

import java.util.List;
import java.util.Map;

import kr.spring.movie.vo.MovieVO;
import kr.spring.seat.vo.SeatVO;
import kr.spring.time.vo.TimeVO;

public interface TimeService {
	//public List<TimeVO> getTimeList(TimeVO timeVO);
	
	//극장등록
	public MovieVO selectMovie2(Integer movie_num);
	
	public void insertTheater2(TimeVO timeVO);
	
	//좌석 등록
	public void insertSeat(SeatVO seatVO);
	
	//목록
	public List<TimeVO> selectList(Map<String,Object> map);
	
	public List<TimeVO> selectTimeList(Map<String,Object> map);
}
