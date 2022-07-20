package kr.spring.movie.vo;

import java.io.IOException;

import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Range;
import org.springframework.web.multipart.MultipartFile;

public class MovieVO {
	private int movie_num; //영화번호
	@NotEmpty
	private String movie_name; //영화제목
	@NotEmpty
	private String movie_content; //영화 상세정보
	@NotEmpty
	private String movie_genre;//영화 장르
	private MultipartFile upload;
	private byte[] uploadfile;//파일
	private String filename;//파일명
	@Range(min=1,max=19)
	private int movie_pg;//영화 관람연령
	@Range(min=0,max=2)
	private int movie_auth;//영화 상영정보
	private int movie_showtm;//영화 상영시간
	private int movie_rate; //영화 평점
	private int mem_num; //회원번호
	private int likeCnt; // 좋아요수
	
	//찜한 영화를 위한 my_movie_num
	private int my_movie_num;

	//업로드 파일 처리
	public void setUpload(MultipartFile upload)throws IOException{
		this.upload = upload;
		//MultipartFile -> byte[] 변환
		setUploadfile(upload.getBytes());
		//파일명 구하기
		setFilename(upload.getOriginalFilename());
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

	public String getMovie_content() {
		return movie_content;
	}

	public void setMovie_content(String movie_content) {
		this.movie_content = movie_content;
	}

	public String getMovie_genre() {
		return movie_genre;
	}

	public void setMovie_genre(String movie_genre) {
		this.movie_genre = movie_genre;
	}

	public byte[] getUploadfile() {
		return uploadfile;
	}

	public void setUploadfile(byte[] uploadfile) {
		this.uploadfile = uploadfile;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
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

	public int getMovie_rate() {
		return movie_rate;
	}

	public void setMovie_rate(int movie_rate) {
		this.movie_rate = movie_rate;
	}
	
	public int getMovie_showtm() {
		return movie_showtm;
	}

	public void setMovie_showtm(int movie_showtm) {
		this.movie_showtm = movie_showtm;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public MultipartFile getUpload() {
		return upload;
	}
	
	public int getMy_movie_num() {
		return my_movie_num;
	}

	public void setMy_movie_num(int my_movie_num) {
		this.my_movie_num = my_movie_num;
	}

	public int getLikeCnt() {
		return likeCnt;
	}
	
	@Override
	public String toString() {
		return "MovieVO [movie_num=" + movie_num + ", movie_name=" + movie_name + ", movie_content=" + movie_content
				+ ", movie_genre=" + movie_genre + ", upload=" + upload + ", filename=" + filename + ", movie_pg="
				+ movie_pg + ", movie_auth=" + movie_auth + ", movie_rate=" + movie_rate + ", movie_showtm=" + movie_showtm
				+ ", mem_num=" + mem_num + ", my_movie_num=" + my_movie_num + "]";
	}
}
	
	

	