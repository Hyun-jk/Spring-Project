package kr.spring.reserve.vo;

public class ReserveseatVO {
	private int revseat_num;
	private int time_num;
	private int seat_num;
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
	@Override
	public String toString() {
		return "ReserveseatVO [revseat_num=" + revseat_num + ", time_num=" + time_num + ", seat_num=" + seat_num + "]";
	}
	
	
}
