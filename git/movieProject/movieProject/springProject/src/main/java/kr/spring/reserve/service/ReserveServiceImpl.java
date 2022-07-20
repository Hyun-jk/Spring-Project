package kr.spring.reserve.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.reserve.dao.ReserveMapper;
import kr.spring.reserve.vo.ReserveVO;
import kr.spring.reserve.vo.ReserveseatVO;
import kr.spring.movie.vo.MovieVO;
import kr.spring.theater.vo.TheaterVO;
import kr.spring.time.vo.TimeVO;

@Service
public class ReserveServiceImpl implements ReserveService{

	@Autowired
	private ReserveMapper reserveMapper;
	
	@Override
	public List<MovieVO> selectMovieList() {
		return reserveMapper.selectMovieList();
	}

	@Override
	public List<TheaterVO> selectTheaterList() {
		return reserveMapper.selectTheaterList();
	}

	@Override
	public MovieVO pickmoviedetail(Integer movie_num) {
		return reserveMapper.pickmoviedetail(movie_num);
	}


	@Override
	public List<TheaterVO> pickmoviedetail_get_theater_local(Integer movie_num) {
		return reserveMapper.pickmoviedetail_get_theater_local(movie_num);
	}

	@Override
	public List<Integer> pickmoviedetail_get_theater_localcount(Integer movie_num) {
		return reserveMapper.pickmoviedetail_get_theater_localcount(movie_num);
	}

	@Override
	public List<TheaterVO> pickmoviedetail_get_theater_cgv(Map<String, Object> map) {
		return reserveMapper.pickmoviedetail_get_theater_cgv(map);
	}

	@Override
	public List<TimeVO> pickmoviedetail_get_date(Map<String, Object> map) {
		return reserveMapper.pickmoviedetail_get_date(map);
	}

	@Override
	public List<TimeVO> pickmoviedetail_get_time(Map<String, Object> map) {
		return reserveMapper.pickmoviedetail_get_time(map);
	}

	@Override
	public TheaterVO picktheaterdetail(Integer theater_num) {
		return reserveMapper.picktheaterdetail(theater_num);
	}

	@Override
	public TimeVO picktimedetail(Integer time_num) {
		return reserveMapper.picktimedetail(time_num);
	}

	@Override
	public List<ReserveVO> seatlist(Integer time_num) {
		return reserveMapper.seatlist(time_num);
	}

	@Override
	public List<ReserveseatVO> reservseatlist(Integer time_num) {
		return reserveMapper.reservseatlist(time_num);
	}

	@Override
	public int seat_total_count(Integer time_num) {
		return reserveMapper.seat_total_count(time_num);
	}

	@Override
	public int reservseat_total_count(Integer time_num) {
		return reserveMapper.reservseat_total_count(time_num);
	}

	@Override
	public void insertreserveseat(List<Map<String,Object>> list) {
		for(Map<String,Object> map : list) {
			reserveMapper.insertreserveseat(map);
		}
	}	

	@Override
	public void insertreserve(ReserveVO reserveVO) {
		reserveMapper.insertreserve(reserveVO);
	}


}
