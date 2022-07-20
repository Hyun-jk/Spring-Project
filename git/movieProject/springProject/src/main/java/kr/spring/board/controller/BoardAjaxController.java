package kr.spring.board.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.board.service.BoardService;
import kr.spring.board.vo.BoardReplyVO;
import kr.spring.util.PagingUtil;

@Controller
public class BoardAjaxController {

	private static final Logger logger = 
			       LoggerFactory.getLogger(BoardAjaxController.class);
	
	private int rowCount = 10;
	
	@Autowired
	private BoardService boardService;
	
	
	/*
	 * //부모글 업로드된 파일 삭제
	 * 
	 * @RequestMapping("/board/deleteFile.do")
	 * 
	 * @ResponseBody public Map<String,String> processFile(int board_num,
	 * HttpSession session){ Map<String,String> map = new HashMap<String,String>();
	 * 
	 * Integer user_num = (Integer)session.getAttribute("user_num");
	 * if(user_num==null) { map.put("result", "logout"); }else {
	 * boardService.deleteFile(board_num); map.put("result","success"); } return
	 * map; }
	 */
	 
	
	//댓글 등록
	@RequestMapping("/board/writeReply.do")
	@ResponseBody
	public Map<String,String> writeReply(BoardReplyVO boardReplyVO,
			                             HttpSession session,
			                             HttpServletRequest request){
		
		logger.info("<<댓글 등록>> : " + boardReplyVO);
		
		Map<String,String> map = new HashMap<String,String>();
		
		Integer user_num = (Integer)session.getAttribute("user_num");
		if(user_num==null) {//로그인이 되지 않은 경우
			map.put("result","logout");
		}else {//로그인 된 경우
			//회원번호 등록
			boardReplyVO.setMem_num(user_num);
			//댓글 등록
			boardService.insertReply(boardReplyVO);
			map.put("result", "success");
		}
		return map;
	}
	
	//댓글 목록
	@RequestMapping("/board/listReply.do")
	@ResponseBody
	public Map<String,Object> getList(
			@RequestParam(value="pageNum",defaultValue="1")
			int currentPage,
			@RequestParam int board_num,
			HttpSession session){
		logger.info("<<목록 호출>> currentPage : " + currentPage);
		logger.info("<<목록 호출>> board_num : " + board_num);
		
		Map<String,Object> map = new HashMap<String,Object>(); 
		map.put("board_num", board_num);
		
		//총 글의 갯수
		int count = boardService.selectRowCountReply(map);
		
		//페이지 처리
		PagingUtil page = new PagingUtil(currentPage,count,rowCount,10,null);
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<BoardReplyVO> list = null;
		if(count > 0) {
			list = boardService.selectListReply(map);
		}else {
			//데이터가 없으면 비어있는 배열 넘김
			list = Collections.emptyList();
		}
		
		Integer user_num = (Integer)session.getAttribute("user_num");
		Integer user_auth = (Integer)session.getAttribute("user_auth");
		
		Map<String,Object> mapJson = new HashMap<String,Object>();
		mapJson.put("count", count);
		mapJson.put("rowCount", rowCount);
		mapJson.put("list", list);
		mapJson.put("user_num", user_num);
		mapJson.put("user_auth", user_auth);
		
		return mapJson;
	}
	
	//댓글 수정
	@RequestMapping("/board/updateReply.do")
	@ResponseBody
	public Map<String,String> modifyReply(BoardReplyVO boardReplyVO,
			                     HttpSession session,
			                     HttpServletRequest request){
		System.out.println("~~~~~~~~~~~~~~~~~~~");
		logger.info("<<댓글 수정>> : " + boardReplyVO);
		 
		Map<String,String> map = new HashMap<String,String>();
		
		Integer user_num = (Integer)session.getAttribute("user_num");
		BoardReplyVO db_reply = 
				boardService.selectReply(boardReplyVO.getReply_num());
		if(user_num==null) {
			//로그인 안 되어 있는 경우
			map.put("result", "logout");
		}else if(user_num !=null && user_num == db_reply.getMem_num()) {
			//로그인 회원번호와 작성자 회원번호 일치
			
			//댓글 수정
			boardService.updateReply(boardReplyVO);
			map.put("result", "success");
		}else {
			//로그인 회원번호와 작성자 회원번호 불일치
			map.put("result","wrongAccess");
		}
		return map;
	}
	
	//댓글 삭제
	@RequestMapping("/board/deleteReply.do")
	@ResponseBody
	public Map<String,String> deleteReply(
			@RequestParam int reply_num, HttpSession session){
		
		Map<String,String> map = new HashMap<String,String>();
		
		Integer user_num = (Integer)session.getAttribute("user_num");
		BoardReplyVO db_reply = boardService.selectReply(reply_num);
		if(user_num==null) {//로그인이 되지 않은 경우
			map.put("result", "logout");
		}else if(user_num!=null && user_num == db_reply.getMem_num()) {
			//로그인 되어 있고 로그인한 회원번호와 작성자 회원번호 일치
			boardService.deleteReply(reply_num);
			map.put("result", "success");
		}else {
			//로그인한 회원번호와 작성자 회원번호 불일치
			map.put("result","wrongAccess");
		}
		
		return map;
	}
	
}




