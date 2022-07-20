package kr.spring.reserve.vo;

import java.sql.Date;
import java.util.List;

import kr.spring.movie.vo.MovieVO;

public class ReserveVO {
	private int reserve_num; // 예매번호
	private int time_num; // 상영시간 번호 (외래키)
	private int mem_num; // 회원번호 (외래키)
	private int movie_num; // 영화번호 (외래키)
	private int theater_num; // 영화관번호(외래키)
	private String reserve_people; // 연령대 및 인원 (일반 1명,청소년1명,경로우대 1명 ...문자열로 보관)
	private String reserve_paymethod; // 결제수단 (1:카드 결제 / 2:현금 결제 / 3:카카오페이 결제)
	private int reserve_paytotal; // 결제 금액
	
	private String mem_id; //회원 id
	private String movie_name; //영화 제목
	private String theater_name; //영화관명
	private String movie_date; //상영날짜
	private String movie_time; //상영시간
	
	//step1 -> step2로 보내기 위해 필요한 프로퍼티 추가
	private int reserve_adult;
	private int reserve_youth;
	private int reserve_old;
	private int reserve_people_total;
	private int reserve_price_total;
	
	//step2에서 사용하기 위한 프로퍼티
	private int seat_num;
	private String seat_name;
	private int revseat_num;
	private int reserve_time_num;
	private int reserve_seat_num;
	
	//step3에서 사용하기 위한 프로퍼티
	private String reserve_seat; // 선택한 좌석명들을 담은 배열 
	private List<String> seat_num_array; // 선택한 좌석 좌석번호들을 담은 배열
	
	//결제완료 페이지에서 사용하기 위한 프로퍼티
	private int sale_price;
	private int final_price;

	//나의 예매 내역확인을 위한 MovieVO추가
	private MovieVO movieVO;
	
	public MovieVO getMovieVO() {
		return movieVO;
	}
	public void setMovieVO(MovieVO movieVO) {
		this.movieVO = movieVO;
	}
	
	public int getReserve_num() {
		return reserve_num;
	}
	public void setReserve_num(int reserve_num) {
		this.reserve_num = reserve_num;
	}
	public int getTime_num() {
		return time_num;
	}
	public void setTime_num(int time_num) {
		this.time_num = time_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}
	public int getTheater_num() {
		return theater_num;
	}
	public void setTheater_num(int theater_num) {
		this.theater_num = theater_num;
	}
	public String getReserve_people() {
		return reserve_people;
	}
	public void setReserve_people(String reserve_people) {
		this.reserve_people = reserve_people;
	}
	public String getReserve_paymethod() {
		return reserve_paymethod;
	}
	public void setReserve_paymethod(String reserve_paymethod) {
		this.reserve_paymethod = reserve_paymethod;
	}
	public int getReserve_paytotal() {
		return reserve_paytotal;
	}
	public void setReserve_paytotal(int reserve_paytotal) {
		this.reserve_paytotal = reserve_paytotal;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
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
	public int getReserve_adult() {
		return reserve_adult;
	}
	public void setReserve_adult(int reserve_adult) {
		this.reserve_adult = reserve_adult;
	}
	public int getReserve_youth() {
		return reserve_youth;
	}
	public void setReserve_youth(int reserve_youth) {
		this.reserve_youth = reserve_youth;
	}
	public int getReserve_old() {
		return reserve_old;
	}
	public void setReserve_old(int reserve_old) {
		this.reserve_old = reserve_old;
	}
	public int getReserve_people_total() {
		return reserve_people_total;
	}
	public void setReserve_people_total(int reserve_people_total) {
		this.reserve_people_total = reserve_people_total;
	}
	public int getReserve_price_total() {
		return reserve_price_total;
	}
	public void setReserve_price_total(int reserve_price_total) {
		this.reserve_price_total = reserve_price_total;
	}
	public int getSeat_num() {
		return seat_num;
	}
	public void setSeat_num(int seat_num) {
		this.seat_num = seat_num;
	}
	public String getSeat_name() {
		return seat_name;
	}
	public void setSeat_name(String seat_name) {
		this.seat_name = seat_name;
	}
	public int getRevseat_num() {
		return revseat_num;
	}
	public void setRevseat_num(int revseat_num) {
		this.revseat_num = revseat_num;
	}
	public int getReserve_time_num() {
		return reserve_time_num;
	}
	public void setReserve_time_num(int reserve_time_num) {
		this.reserve_time_num = reserve_time_num;
	}
	public int getReserve_seat_num() {
		return reserve_seat_num;
	}
	public void setReserve_seat_num(int reserve_seat_num) {
		this.reserve_seat_num = reserve_seat_num;
	}
	public String getReserve_seat() {
		return reserve_seat;
	}
	public void setReserve_seat(String reserve_seat) {
		this.reserve_seat = reserve_seat;
	}
	public List<String> getSeat_num_array() {
		return seat_num_array;
	}
	public void setSeat_num_array(List<String> seat_num_array) {
		this.seat_num_array = seat_num_array;
	}
	public int getSale_price() {
		return sale_price;
	}
	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}
	public int getFinal_price() {
		return final_price;
	}
	public void setFinal_price(int final_price) {
		this.final_price = final_price;
	}
	@Override
	public String toString() {
		return "ReserveVO [reserve_num=" + reserve_num + ", time_num=" + time_num + ", mem_num=" + mem_num
				+ ", movie_num=" + movie_num + ", theater_num=" + theater_num + ", reserve_people=" + reserve_people
				+ ", reserve_paymethod=" + reserve_paymethod + ", reserve_paytotal=" + reserve_paytotal + ", mem_id="
				+ mem_id + ", movie_name=" + movie_name + ", theater_name=" + theater_name + ", movie_date="
				+ movie_date + ", movie_time=" + movie_time + ", reserve_adult=" + reserve_adult + ", reserve_youth="
				+ reserve_youth + ", reserve_old=" + reserve_old + ", reserve_people_total=" + reserve_people_total
				+ ", reserve_price_total=" + reserve_price_total + ", seat_num=" + seat_num + ", seat_name=" + seat_name
				+ ", revseat_num=" + revseat_num + ", reserve_time_num=" + reserve_time_num + ", reserve_seat_num="
				+ reserve_seat_num + ", reserve_seat=" + reserve_seat + ", seat_num_array=" + seat_num_array
				+ ", sale_price=" + sale_price + ", final_price=" + final_price + "]";
	}
}