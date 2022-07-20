package kr.spring.board.vo;

import java.io.IOException;
import java.sql.Date;

import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	private int board_num; //게시판 번호
	private int board_auth; //게시판 구분
	private int mem_num; //회원 번호
	private int cate_num; //카테고리 번호
	private String cate_name; //카테고리 이름
	private int theater_choise; //영화관 선택 0:선택안함, 1:선택
	private int sel_regioncode; //지역 선택
	private int sel_theatercode; //영화관 선택
	private String board_title; //제목
	private String board_content; //내용
	private MultipartFile upload;
	private byte[] board_uploadfile;//파일
	private String board_filename;//파일명
	private int board_hit; //조회수
	private Date board_reg_date; //등록일
	private String id;//아이디
	private Integer replyState; // 답변 상태 
	
	//업로드 파일 처리
	public void setUpload(MultipartFile upload)throws IOException{
		this.upload = upload;
		//MultipartFile -> byte[] 변환
		setBoard_uploadfile(upload.getBytes());
		//파일명 구하기
		setBoard_filename(upload.getOriginalFilename());
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getBoard_auth() {
		return board_auth;
	}
	public void setBoard_auth(int board_auth) {
		this.board_auth = board_auth;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getCate_num() {
		return cate_num;
	}
	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public byte[] getBoard_uploadfile() {
		return board_uploadfile;
	}
	public void setBoard_uploadfile(byte[] board_uploadfile) {
		this.board_uploadfile = board_uploadfile;
	}
	public String getBoard_filename() {
		return board_filename;
	}
	public void setBoard_filename(String board_filename) {
		this.board_filename = board_filename;
	}
	public int getBoard_hit() {
		return board_hit;
	}
	public void setBoard_hit(int board_hit) {
		this.board_hit = board_hit;
	}
	public Date getBoard_reg_date() {
		return board_reg_date;
	}
	public void setBoard_reg_date(Date board_reg_date) {
		this.board_reg_date = board_reg_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getTheater_choise() {
		return theater_choise;
	}
	public void setTheater_choise(int theater_choise) {
		this.theater_choise = theater_choise;
	}
	public int getSel_regioncode() {
		return sel_regioncode;
	}
	public void setSel_regioncode(int sel_regioncode) {
		this.sel_regioncode = sel_regioncode;
	}
	public int getSel_theatercode() {
		return sel_theatercode;
	}
	public void setSel_theatercode(int sel_theatercode) {
		this.sel_theatercode = sel_theatercode;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	
	public Integer getReplyState() {
		return replyState;
	}
	public void setReplyState(Integer replyState) {
		this.replyState = replyState;
	}
	@Override
	public String toString() {
		return "BoardVO [board_num=" + board_num + ", board_auth=" + board_auth + ", mem_num=" + mem_num + ", cate_num="
				+ cate_num + ", cate_name=" + cate_name + ", theater_choise=" + theater_choise + ", sel_regioncode="
				+ sel_regioncode + ", sel_theatercode=" + sel_theatercode + ", board_title=" + board_title
				+ ", board_content=" + board_content + ", upload=" + upload + ", board_filename=" + board_filename
				+ ", board_hit=" + board_hit + ", board_reg_date=" + board_reg_date + ", id=" + id + "]";
	}
}
