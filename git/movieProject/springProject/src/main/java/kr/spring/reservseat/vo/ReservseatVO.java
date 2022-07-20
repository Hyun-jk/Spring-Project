package kr.spring.reservseat.vo;

public class ReservseatVO {
	private int revseat_num; //예약된 좌석번호
	private int time_num; //시간번호
	private int seat_num; //좌석번호
	
	//게터세터
	public int getRevseat_num() {
		return revseat_num;
	}
	public void setRevseat_num(int revseat_num) {
		this.revseat_num = revseat_num;
	}
	public int getTime_num() {
		return time_num;
	}
	public void setTime_num(int time_num) {
		this.time_num = time_num;
	}
	public int getSeat_num() {
		return seat_num;
	}
	public void setSeat_num(int seat_num) {
		this.seat_num = seat_num;
	}
	
	//투스트링
	@Override
	public String toString() {
		return "ReservseatVO [revseat_num=" + revseat_num + ", time_num=" + time_num + ", seat_num=" + seat_num + "]";
	}
	
}
