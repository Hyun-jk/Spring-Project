package kr.spring.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.board.dao.BoardMapper;
import kr.spring.board.vo.BoardReplyVO;
import kr.spring.board.vo.BoardVO;
import kr.spring.member.vo.MemberVO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public List<BoardVO> selectList(Map<String, Object> map) {
		List <BoardVO> list = boardMapper.selectList(map);
		
		for (BoardVO li : list ) {
			Integer replyState = boardMapper.selectRowCountByBoardNum(li.getBoard_num());
			li.setReplyState(replyState);
		}
		return list;
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return boardMapper.selectRowCount(map);
	}

	@Override
	public BoardVO beforeView(BoardVO vboard) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardVO afterView(BoardVO vboard) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateHit(Integer board_num) {
		boardMapper.updateHit(board_num);
		
	}

	@Override
	public void adminInsertBoard(BoardVO board) {
		boardMapper.adminInsertBoard(board);
		
	}

	@Override
	public BoardVO adminSelectBoard(Integer board_num) {
		return boardMapper.adminSelectBoard(board_num);
	}

	@Override
	public void adminUpdateBoard(BoardVO board) {
		System.out.println(board.toString());
		boardMapper.adminUpdateBoard(board);
		
	}

	@Override
	public void adminDeleteBoard(Integer board_num) {
		//댓글이 존재하면 댓글 우선 삭제 후 부모글 삭제
		boardMapper.deleteReplyByBoardNum(board_num);
		boardMapper.adminDeleteBoard(board_num);
	}


	@Override
	public void insertBoard(BoardVO board) {
		boardMapper.insertBoard(board);

	}

	@Override
	public BoardVO selectBoard(Integer board_num) {
		return boardMapper.selectBoard(board_num);
	}

	@Override
	public void updateBoard(BoardVO board) {
		boardMapper.updateBoard(board);
		
	}
	@Override
	public List<BoardVO> selectListBy5(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.selectListBy5(map);
	}

	
	
	//댓글 부분
	@Override
	public List<BoardReplyVO> selectListReply(Map<String, Object> map) {
		return boardMapper.selectListReply(map);
	}

	@Override
	public int selectRowCountReply(Map<String, Object> map) {
		return boardMapper.selectRowCountReply(map);
	}

	@Override
	public BoardReplyVO selectReply(Integer reply_num) {
		return boardMapper.selectReply(reply_num);
	}

	@Override
	public void insertReply(BoardReplyVO boardReply) {
		boardMapper.insertReply(boardReply);
		
	}

	@Override
	public void updateReply(BoardReplyVO boardReply) {
		boardMapper.updateReply(boardReply);
		
	}

	@Override
	public void deleteReply(Integer reply_num) {
		boardMapper.deleteReply(reply_num);
		
	}

	@Override
	public Integer compareBrdAuthority(Integer board_num) {
			return boardMapper.compareMemNumByBrdNum(board_num);
	}


	@Override
	public List<BoardVO> userSelectList(Map<String, Object> map) {
		map.put("keyfield", 0);
		map.put("keyword", 0);
		System.out.println(map);
		return boardMapper.userSelectList(map);
	}

	@Override
	public List<MemberVO> selectAdminUsers() {
	
		return boardMapper.selectAdminMember();
	}

	
}
