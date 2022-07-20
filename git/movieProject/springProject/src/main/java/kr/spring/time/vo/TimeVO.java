package kr.spring.time.vo;

import java.util.Date; //date에서 sql.date를 못불러와서 일단 이렇게 처리

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class TimeVO {
	private int time_num; //상영시간 번호
	private int theater_num; //영화관 번호
	private int movie_num; //영화번호 //moive(무비테이블 프라이머리 키),time테이블
	private String movie_date; //상영일
	private String movie_time; //상영시간
	
	private String movie_name; //영화제목
	//극장정보 등록을 위해 movie테이블에서 가져온 데이터
	private String movie_genre; //장르
	private int movie_pg; //관람연령(12/15/19)
	private int movie_auth; //영화 상영정보 0:상영중/1:상영예정/2:상영종료
	private int movie_showtm; //영화 시간 길이?
	
	private int mem_num;
	
	//좌석
	private int revseat_num;
	private int seat_num;
	private String seat_name;
	private int total_count;
	private int reserv_count;
	private int rest_count;
	
	//게터세터
	public int getTime_num() {
		return time_num;
	}

	public void setTime_num(int time_num) {
		this.time_num = time_num;
	}

	public int getTheater_num() {
		return theater_num;
	}

	public void setTheater_num(int theater_num) {
		this.theater_num = theater_num;
	}

	public int getMovie_num() {
		return movie_num;
	}

	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}

	public String getMovie_name() {
		return movie_name;
	}

	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}

	public String getMovie_date() {
		return movie_date;
	}

	public void setMovie_date(String movie_date) {
		this.movie_date = movie_date;
	}

	public String getMovie_time() {
		return movie_time;
	}

	public void setMovie_time(String movie_time) {
		this.movie_time = movie_time;
	}

	public String getMovie_genre() {
		return movie_genre;
	}

	public void setMovie_genre(String movie_genre) {
		this.movie_genre = movie_genre;
	}

	public int getMovie_pg() {
		return movie_pg;
	}

	public void setMovie_pg(int movie_pg) {
		this.movie_pg = movie_pg;
	}

	public int getMovie_auth() {
		return movie_auth;
	}

	public void setMovie_auth(int movie_auth) {
		this.movie_auth = movie_auth;
	}
	
	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	
	public int getMovie_showtm() {
		return movie_showtm;
	}

	public void setMovie_showtm(int movie_showtm) {
		this.movie_showtm = movie_showtm;
	}
	
	public int getRevseat_num() {
		return revseat_num;
	}

	public void setRevseat_num(int revseat_num) {
		this.revseat_num = revseat_num;
	}

	public int getSeat_num() {
		return seat_num;
	}

	public void setSeat_num(int seat_num) {
		this.seat_num = seat_num;
	}
	
	public int getTotal_count() {
		return total_count;
	}

	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}

	public int getReserv_count() {
		return reserv_count;
	}

	public void setReserv_count(int reserv_count) {
		this.reserv_count = reserv_count;
	}

	public int getRest_count() {
		return rest_count;
	}

	public void setRest_count(int rest_count) {
		this.rest_count = rest_count;
	}
	public String getSeat_name() {
		return seat_name;
	}

	public void setSeat_name(String seat_name) {
		this.seat_name = seat_name;
	}
	
	//투스트링
	@Override
	public String toString() {
		return "TimeVO [time_num=" + time_num + ", theater_num=" + theater_num + ", movie_num=" + movie_num
				+ ", movie_date=" + movie_date + ", movie_time=" + movie_time + ", movie_name=" + movie_name
				+ ", movie_genre=" + movie_genre + ", movie_pg=" + movie_pg + ", movie_auth=" + movie_auth
				+ ", movie_showtm=" + movie_showtm + ", mem_num=" + mem_num + ", revseat_num=" + revseat_num
				+ ", seat_num=" + seat_num + ", seat_name=" + seat_name + ", total_count=" + total_count
				+ ", reserv_count=" + reserv_count + ", rest_count=" + rest_count + "]";
	}
}
