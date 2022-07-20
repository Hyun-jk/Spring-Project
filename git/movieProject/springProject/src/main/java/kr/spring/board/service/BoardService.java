package kr.spring.board.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;

import kr.spring.board.vo.BoardReplyVO;
import kr.spring.board.vo.BoardVO;
import kr.spring.member.vo.MemberVO;

public interface BoardService {
	//부모글
	public List<BoardVO> selectList(Map<String,Object> map); //목록 생성
	public int selectRowCount(Map<String,Object> map); //페이징 처리
	public BoardVO beforeView(BoardVO vboard); //이전글 보기
	public BoardVO afterView(BoardVO vboard); //다음글 보기
	public void updateHit(Integer board_num); //조회수 증가
	
	//관리자 부분
	public void adminInsertBoard(BoardVO board); //관리자 글 작성
	public BoardVO adminSelectBoard(Integer board_num); //관리자 상세보기
	public void adminUpdateBoard(BoardVO board); //관리자 글 수정
	public void adminDeleteBoard(Integer board_num); //관리자 글 삭제
	public List<BoardVO> selectListBy5(Map<String,Object> map);
	
	
	//회원부분
	public void insertBoard(BoardVO board); //회원 글 작성
	public BoardVO selectBoard(Integer board_num); //회원글 상세보기
	public void updateBoard(BoardVO board); //회원 글 수정
	public List<BoardVO> userSelectList(Map<String,Object> map); //회원 작성글 보기
	
	//댓글
	public List<BoardReplyVO> selectListReply(Map<String,Object> map); //필요없을듯
	public int selectRowCountReply(Map<String,Object> map);
	public BoardReplyVO selectReply(Integer reply_num);
	public void insertReply(BoardReplyVO boardReply);
	public void updateReply(BoardReplyVO boardReply);
	public void deleteReply(Integer reply_num);
	
	// 권한 체크
	public Integer compareBrdAuthority(Integer board_num);
	
	public List<MemberVO> selectAdminUsers();
	
}
