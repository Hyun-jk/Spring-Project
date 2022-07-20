package kr.spring.movie.vo;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author jaehy
 *
 */
public class MovieReviewVO {
	private int review_num;
	private String review_content;
	private String review_reg_date;
	private int review_rate;
	private int movie_num;//부모 글번호
	private int mem_num;//작성자 회원번호
	private MultipartFile upload;
	private byte[] uploadfile;//파일
	private String filename;//파일명
	private int total_rate;
	private String movie_name;
	
	
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_reg_date() {
		return review_reg_date;
	}
	public void setReview_reg_date(String review_reg_date) {
		this.review_reg_date = review_reg_date;
	}
	public int getReview_rate() {
		return review_rate;
	}
	public void setReview_rate(int review_rate) {
		this.review_rate = review_rate;
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
	
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
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
	
	public int getTotal_rate() {
		return total_rate;
	}
	public void setTotal_rate(int total_rate) {
		this.total_rate = total_rate;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	@Override
	public String toString() {
		return "MovieReviewVO [review_num=" + review_num + ", review_content=" + review_content + ", review_reg_date="
				+ review_reg_date + ", review_rate=" + review_rate + ", movie_num=" + movie_num + ", mem_num=" + mem_num
				+ ", upload=" + upload + ", filename=" + filename + ", total_rate=" + total_rate + ", movie_name="
				+ movie_name + "]";
	}
	
	
	
}