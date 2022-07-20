package kr.spring.seat.vo;

import javax.validation.constraints.NotEmpty;

public class SeatVO {
	private int seat_num; //좌석식별
	private int theater_num; //영화관 번호
	@NotEmpty
	private String seat_name; //좌석이름(1~50)
	
	private int mem_num;
	
	//게터세터
	public int getSeat_num() {
		return seat_num;
	}
	public void setSeat_num(int seat_num) {
		this.seat_num = seat_num;
	}
	public int getTheater_num() {
		return theater_num;
	}
	public void setTheater_num(int theater_num) {
		this.theater_num = theater_num;
	}
	public String getSeat_name() {
		return seat_name;
	}
	public void setSeat_name(String seat_name) {
		this.seat_name = seat_name;
	}
	
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	//투스트링
	@Override
	public String toString() {
		return "SeatVO [seat_num=" + seat_num + ", theater_num=" + theater_num + ", seat_name=" + seat_name
				+ ", mem_num=" + mem_num + "]";
	}
}
