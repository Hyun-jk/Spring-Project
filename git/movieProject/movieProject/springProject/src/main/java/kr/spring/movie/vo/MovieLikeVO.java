package kr.spring.movie.vo;

public class MovieLikeVO {
	private int my_movie_num;	
	private int movie_num;
	private int mem_num;
	
	public int getMy_movie_num() {
		return my_movie_num;
	}
	public void setMy_movie_num(int my_movie_num) {
		this.my_movie_num = my_movie_num;
	}
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	
	@Override
	public String toString() {
		return "MovieLikeVO [my_movie_num=" + my_movie_num + ", movie_num=" + movie_num + ", mem_num=" + mem_num + "]";
	}

}
