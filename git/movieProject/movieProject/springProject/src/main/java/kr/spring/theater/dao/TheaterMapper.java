package kr.spring.theater.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.movie.vo.MovieVO;
import kr.spring.theater.vo.TheaterVO;

public interface TheaterMapper {
	
	//1.관리자 - 극장지역정보 등록
	@Insert("INSERT INTO M_theater (theater_num,theater_local,theater_addr,theater_name,theater_image,theater_imagename) VALUES (M_theater_seq.nextval,#{theater_local},#{theater_addr},#{theater_name},#{theater_image},#{theater_imagename})")
	public void insertTheater(TheaterVO theater);
	
	//2. 극장지역 리스트출력
	@Select("SELECT * FROM M_theater WHERE theater_local = #{local} ORDER BY theater_name ASC")
	public List<TheaterVO> listLocal(String local);
	
	//3. 극장번호 구하기
	@Select("SELECT * FROM M_theater WHERE theater_num=#{theater_num}")
	public TheaterVO selectTheater(Integer theater_num);
	
	//4. 극장 제목 변경
	@Select("SELECT * FROM M_theater WHERE theater_name = #{name}")
	public List<TheaterVO> listName(String name);
	
	@Select("SELECT * FROM M_theater")
	public List<TheaterVO> selectAllTheater();
	
	@Select("SELECT * FROM M_movie")
	public List<MovieVO> selectAllMovie(); 
}