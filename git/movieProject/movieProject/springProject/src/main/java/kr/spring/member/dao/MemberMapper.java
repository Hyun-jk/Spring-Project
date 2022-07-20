package kr.spring.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.member.vo.MemberVO;

public interface MemberMapper {
	
	//사용자
	@Select("SELECT M_member_seq.nextval FROM dual")
	public int selectMem_num();
	
	@Insert("INSERT INTO M_member(mem_num,id) VALUES(#{mem_num},#{id})")
	public void insertMember(MemberVO member);
	
	public void insertMember_detail(MemberVO member);
	
	@Select("SELECT * FROM M_member m LEFT OUTER JOIN M_member_detail d ON m.mem_num = d.mem_num WHERE m.id=#{id}")
	public MemberVO selectCheckMember(String id);
	
	@Select("SELECT * FROM M_member m LEFT OUTER JOIN M_member_detail d ON m.mem_num = d.mem_num WHERE m.mem_num=#{mem_num}")
	public MemberVO selectMember(Integer mem_num);
	
	@Update("UPDATE M_member_detail SET mem_phone=#{mem_phone},mem_email=#{mem_email},mem_zipcode=#{mem_zipcode},mem_address=#{mem_address} WHERE mem_num=#{mem_num}")
	public void updateMember(MemberVO member);
	
	@Update("UPDATE M_member_detail SET mem_pw=#{mem_pw} WHERE mem_num=#{mem_num}")
	public void updatePassword(MemberVO member);
	
	@Update("UPDATE M_member SET auth=2 WHERE mem_num=#{mem_num}")
	public void deleteMember(Integer mem_num);
	
	@Delete("DELETE FROM M_member_detail WHERE mem_num=#{mem_num}")
	public void deleteMember_detail(Integer mem_num);
		
	//blob타입의 이미지(bytes배열형태는 db에 넣을 때 별도에 처리 없어도 가능),파일명
	@Update("UPDATE M_member_detail SET mem_photo=#{mem_photo},photo_name=#{photo_name} WHERE mem_num=#{mem_num}")
	public void updateProfile(MemberVO member);
	
}






