package kr.spring.theater.vo;

import java.io.IOException;

import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

public class TheaterVO {
	private int theater_num; //영화관 번호
	@NotEmpty
	private String theater_name; //영화관 명
	@NotEmpty
	private String theater_addr; //영화관주소
	private String theater_local; //영화관 카테고리 (동윤 추가)
	private MultipartFile upload; //파일업로드할때 파라미터네임으로 넘어올 프로퍼티
	private byte[] theater_image; //바이트형태 파일->파일업로드할수있게
	private String theater_imagename; //파일명
	
	private int mem_num;
	
	//업로드 파일 처리
	public void setUpload(MultipartFile upload) throws IOException{
		this.upload = upload;
		//MultipartFile -> byte[] 형태로 변환 -> 작업시 예외발생가능성 있으므로 메서드에 IO익셉션 명시
		setTheater_image(upload.getBytes());
				
		//파일명 구하기
		setTheater_imagename(upload.getOriginalFilename());
	}
	
	//게터세터
	public int getTheater_num() {
		return theater_num;
	}
	public void setTheater_num(int theater_num) {
		this.theater_num = theater_num;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public String getTheater_addr() {
		return theater_addr;
	}
	public void setTheater_addr(String theater_addr) {
		this.theater_addr = theater_addr;
	}
	public String getTheater_local() {
		return theater_local;
	}
	public void setTheater_local(String theater_local) {
		this.theater_local = theater_local;
	}
	
	
	public MultipartFile getUpload() {
		return upload;
	}
	
	public byte[] getTheater_image() {
		return theater_image;
	}

	public void setTheater_image(byte[] theater_image) {
		this.theater_image = theater_image;
	}

	public String getTheater_imagename() {
		return theater_imagename;
	}

	public void setTheater_imagename(String theater_imagename) {
		this.theater_imagename = theater_imagename;
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
		return "TheaterVO [theater_num=" + theater_num + ", theater_name=" + theater_name + ", theater_addr="
				+ theater_addr + ", theater_local=" + theater_local + ", upload=" + upload + ", theater_imagename="
				+ theater_imagename + ", mem_num=" + mem_num + "]";
	}
}
