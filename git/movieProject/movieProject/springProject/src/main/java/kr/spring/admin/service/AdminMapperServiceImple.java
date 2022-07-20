package kr.spring.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.spring.admin.dao.AdminMapper;
import kr.spring.member.vo.MemberVO;
import kr.spring.reserve.vo.ReserveVO;

public class AdminMapperServiceImple implements AdminMapperService{

	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public int adminMemberRowCount(Map<String, Object> map) {
		return adminMapper.adminMemberRowCount(map);
	}

	@Override
	public List<MemberVO> adminSelectList(Map<String,Object> map) {
		return adminMapper.adminSelectList(map);
	}

	@Override
	public MemberVO adminUpdateMember(MemberVO member) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectAdminReserveMovieListCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ReserveVO> selectAdminReserveMovieList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	
	

}
