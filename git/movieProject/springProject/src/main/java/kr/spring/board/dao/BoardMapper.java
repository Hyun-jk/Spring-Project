package kr.spring.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.board.vo.BoardReplyVO;
import kr.spring.board.vo.BoardVO;
import kr.spring.member.vo.MemberVO;

public interface BoardMapper {
	//부모글
	public List<BoardVO> selectList(Map<String,Object> map); //목록 생성(0) //
	public int selectRowCount(Map<String,Object> map); //페이징 처리(0) //
	public BoardVO beforeView(BoardVO vboard); //이전글 보기
	public BoardVO afterView(BoardVO vboard); //다음글 보기
	public void updateHit(Integer board_num); //조회수 증가(0) //
	
	//관리자 부분
	public void adminInsertBoard(BoardVO board); //관리자 글 작성(0) //
	public BoardVO adminSelectBoard(Integer board_num); //관리자 상세보기(0) //
	public void adminUpdateBoard(BoardVO board); //관리자 글 수정(0) //
	public void adminDeleteBoard(Integer board_num); //관리자 글 삭제(0) //
	public List<BoardVO> selectListBy5(Map<String,Object> map); //고객센터 메인 뉴스 보기(0)
	
	// 권한 체크
	public Integer compareMemNumByBrdNum(Integer board_num);
	
	//회원부분
	public void insertBoard(BoardVO board); //회원 글 작성(0)
	public BoardVO selectBoard(Integer board_num); //회원글 상세보기(0)
	public void updateBoard(BoardVO board); //회원 글 수정(0)
	public List<BoardVO> userSelectList(Map<String,Object> map); //회원 작성글 보기
	
	//댓글
	public List<BoardReplyVO> selectListReply(Map<String,Object> map); //필요없을듯
	public int selectRowCountReply(Map<String,Object> map);
	public BoardReplyVO selectReply(Integer reply_num);
	public void insertReply(BoardReplyVO boardReply);
	public void updateReply(BoardReplyVO boardReply);
	public void deleteReply(Integer reply_num);
	//부모글 삭제시 댓글이 존재하면 부모글 삭제전 댓글 삭제
	public void deleteReplyByBoardNum(Integer board_num);
	
	
	public Integer selectRowCountByBoardNum(Integer board_num);
	public List<MemberVO> selectAdminMember();
	
	
}
