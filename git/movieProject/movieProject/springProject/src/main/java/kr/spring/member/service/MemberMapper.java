package kr.spring.member.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.member.vo.MemberVO;

public interface MemberMapper {
	
	//사용자
	@Select("SELECT spmember_seq.nextval FROM dual")
	public int selectMem_num();
	
	@Insert("INSERT INTO spmember(mem_num,id) VALUES(#{mem_num},#{id})")
	public void insertMember(MemberVO member);
	
	@Insert("INSERT INTO spmember_detail(mem_num,name,passwd,phone,email,zipcode,address1,address2) VALUES(#{mem_num},#{name},#{passwd},#{phone},#{email},#{zipcode},#{address1},#{address2})")
	public void insertMember_detail(MemberVO member);
	
	@Select("SELECT m.mem_num,m.id,m.auth,d.passwd,d.photo FROM spmember m LEFT OUTER JOIN spmember_detail d ON m.mem_num = d.mem_num WHERE m.id=#{id}")
	public MemberVO selectCheckMember(String id);
	
	@Select("SELECT * FROM spmember m JOIN spmember_detail d ON m.mem_num = d.mem_num WHERE m.mem_num = #{mem_num}")
	public MemberVO selectMember(Integer mem_num);
	
	@Update("UPDATE spmember_detail SET name=#{name},phone=#{phone},email=#{email},zipcode=#{zipcode},address1=#{address1},address2=#{address2},modify_date=SYSDATE WHERE mem_num=#{mem_num}")
	public void updateMember(MemberVO member);
	
	@Update("UPDATE spmember_detail SET passwd=#{passwd} WHERE mem_num=#{mem_num}")
	public void updatePassword(MemberVO member);
	
	@Update("UPDATE spmember SET auth=0 WHERE mem_num=#{mem_num}")
	public void deleteMember(Integer mem_num);
	
	@Delete("DELETE FROM spmember_detail WHERE mem_num=#{mem_num}")
	public void deleteMember_detail(Integer mem_num);
		
	//blob타입의 이미지(bytes배열형태는 db에 넣을 때 별도에 처리 없어도 가능),파일명
	@Update("UPDATE spmember_detail SET photo=#{photo},photo_name=#{photo_name} WHERE mem_num=#{mem_num}")
	public void updateProfile(MemberVO member);
	
	//관리자
	public List<MemberVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	
	@Update("UPDATE spmember set auth=#{auth} WHERE mem_num=#{mem_num}")
	public void updateByAdmin(MemberVO member);
	@Update("UPDATE spmember_detail SET name=#{name},phone=#{phone},email=#{email},zipcode=#{zipcode},address1=#{address1},address2=#{address2} WHERE mem_num=#{mem_num}")
	public void updateDetailByAdmin(MemberVO member);
}






