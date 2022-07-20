package kr.spring.theater.service;

import java.util.List;

import kr.spring.movie.vo.MovieVO;
import kr.spring.theater.vo.TheaterVO;

public interface TheaterService {
	//극장지역정보 등록
	public void insertTheater(TheaterVO theater);
	
	//극장지역정보 목록
	public List<TheaterVO> listLocal(String local);
	
	//극장 인포사진 호출하기 위한 프라이머리 키 구하기
	public TheaterVO selectTheater(Integer theater_num);
	
	//극장 제목 변경 에이젝스
	public List<TheaterVO> listName(String name);
	
	public List<TheaterVO> selectAllTheater();
	
	public List<MovieVO> selectAllMovie(); 
}
