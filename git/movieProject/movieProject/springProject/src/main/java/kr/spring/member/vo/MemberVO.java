                                                                                       package kr.spring.member.vo;

import java.io.IOException;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private int mem_num; //회원번호
	
	@Pattern(regexp="^[A-Za-z0-9]{6,10}$")
	private String id; //회원 아이디 (아이디 최대 6~10자)/ 영(대/소문자)+ 숫자조합
	private int auth; //0: 정지회원 /1:일반회원(default)2:탈퇴회원/ 3:관리자
	
	@NotEmpty
	private String mem_name; //회원 이름
	
	@Pattern(regexp="^[A-Za-z0-9]{6,10}$")
	private String mem_pw; //비밀번호(최대 10자/ 영문(대/소문자) + 숫자 조합
	
	@NotNull
	private int mem_birth; //최대6자 ex:2203016 형식
	
	@NotEmpty
	@Size(max=11)
	private String mem_phone;
	private MultipartFile upload;
	private byte[] mem_photo;
	private String Photo_name; //파일명
	
	@NotEmpty
	private String mem_address; //회원주소 + 상세주소
	
	@NotEmpty
	@Size(min=5,max=5)
	private String mem_zipcode;
	
	@Email
	@NotEmpty
	private String mem_email;
	private int mem_grade; //3회미만 브론즈, 3회이상 실버, 5회이상 골드
	
	@Pattern(regexp="^[A-Za-z0-9]{6,10}$")
	private String now_mem_pw;
	//비밀번호 일치 여부 체크
	public boolean isCheckPassword(String userPasswd) {
		if(auth == 1 && mem_pw.equals(userPasswd) ) {
			return true;
		}else if(auth == 3 && mem_pw.equals(userPasswd)) {
			return true;
		}
		return false;
	}
	
	private String mem_address1;
	
	
	
	public String getMem_address1() {
		return mem_address1;
	}

	public void setMem_address1(String mem_address1) {
		this.mem_address1 = mem_address1;
	}

	public void setUpload(MultipartFile upload) throws IOException{
		this.upload = upload;
		setMem_photo(upload.getBytes());
		setPhoto_name(upload.getOriginalFilename());
	}
	
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public int getMem_birth() {
		return mem_birth;
	}
	public void setMem_birth(int mem_birth) {
		this.mem_birth = mem_birth;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	
	public byte[] getMem_photo() {
		return mem_photo;
	}
	public void setMem_photo(byte[] mem_photo) {
		this.mem_photo = mem_photo;
	}
	
	public String getPhoto_name() {
		return Photo_name;
	}

	public void setPhoto_name(String photo_name) {
		Photo_name = photo_name;
	}

	public String getMem_address() {
		return mem_address;
	}
	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}
	public String getMem_zipcode() {
		return mem_zipcode;
	}
	public void setMem_zipcode(String mem_zipcode) {
		this.mem_zipcode = mem_zipcode;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public int getMem_grade() {
		return mem_grade;
	}
	public void setMem_grade(int mem_grade) {
		this.mem_grade = mem_grade;
	}

	public String getNow_mem_pw() {
		return now_mem_pw;
	}

	public void setNow_mem_pw(String now_mem_pw) {
		this.now_mem_pw = now_mem_pw;
	}

	@Override
	public String toString() {
		return "MemberVO [mem_num=" + mem_num + ", id=" + id + ", mem_auth=" + auth + ", mem_name="
				+ mem_name + ", mem_pw=" + mem_pw + ", mem_birth=" + mem_birth + ", mem_phone=" + mem_phone
				+ ", upload=" + upload + ", Photo_name=" + Photo_name + ", mem_address=" + mem_address
				+ ", mem_zipcode=" + mem_zipcode + ", mem_email=" + mem_email + ", mem_grade=" + mem_grade
				+ ", now_mem_pw=" + now_mem_pw + "]";
	}
	
	
}
