package kr.spring.theater.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.movie.vo.MovieVO;
import kr.spring.theater.dao.TheaterMapper;
import kr.spring.theater.vo.TheaterVO;

@Service
public class TheaterServiceImpl implements TheaterService{
	
	@Autowired
	private TheaterMapper theaterMapper;
	
	@Override
	public void insertTheater(TheaterVO theater) {
		theaterMapper.insertTheater(theater);
	}

	@Override
	public List<TheaterVO> listLocal(String local) {
		return theaterMapper.listLocal(local);
	}

	@Override
	public TheaterVO selectTheater(Integer theater_num) {

		return theaterMapper.selectTheater(theater_num);
	}

	@Override
	public List<TheaterVO> listName(String name) {
		
		return theaterMapper.listName(name);
	}

	@Override
	public List<TheaterVO> selectAllTheater() {
		return theaterMapper.selectAllTheater();
	}
 
	@Override
	public List<MovieVO> selectAllMovie() {
		return theaterMapper.selectAllMovie();
	}

}
