package kr.spring.time.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.movie.vo.MovieVO;
import kr.spring.seat.vo.SeatVO;
import kr.spring.time.dao.TimeMapper;
import kr.spring.time.vo.TimeVO;

@Service
public class TimeServiceImpl implements TimeService{
	
	@Autowired
	private TimeMapper timeMapper;

	/*
	 * @Override public List<TimeVO> getTimeList(TimeVO timeVO) {
	 * 
	 * return timeMapper.selectList(timeVO); }
	 */

	@Override
	public MovieVO selectMovie2(Integer movie_num) {

		return timeMapper.selectMovie2(movie_num);
	}

	@Override
	public void insertTheater2(TimeVO timeVO) {
		timeMapper.insertTheater2(timeVO);	
	}

	@Override
	public List<TimeVO> selectList(Map<String, Object> map) {
		return timeMapper.selectList(map);
	}

	@Override
	public List<TimeVO> selectTimeList(Map<String, Object> map) {		
		return timeMapper.selectTimeList(map);
	}

	@Override
	public void insertSeat(SeatVO seatVO) {
		timeMapper.insertSeat(seatVO);
	}
}
