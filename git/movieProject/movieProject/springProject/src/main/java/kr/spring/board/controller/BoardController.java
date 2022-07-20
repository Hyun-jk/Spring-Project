package kr.spring.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.board.service.BoardService;
import kr.spring.board.vo.BoardVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PagingUtil;
import kr.spring.util.StringUtil;

@Controller
public class BoardController {
	
	private static final Logger logger = 
		LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public BoardVO initCommand() {
		return new BoardVO();
	}
	
	//고객센터 메인
	@RequestMapping("/board/boardMain.do")
	public ModelAndView process3(
		@RequestParam(value="pageNum",defaultValue="1")int currentPage,
		@RequestParam(value="keyfield",defaultValue="")String keyfield,
		@RequestParam(value="keyword",defaultValue="")String keyword) {
				
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
				
		//글의 총갯수 또는 검색된 글의 갯수
		int count = boardService.selectRowCount(map);
		System.out.println(count);
				
		//페이지 처리
		PagingUtil page = new PagingUtil(keyfield,keyword,
						                currentPage,count,20,10,"qnaList.do");
				
		map.put("start",page.getStartCount());
		map.put("end", page.getEndCount());
			
		//리스트
		List<BoardVO> list = null;
		if(count > 0) {
			list = boardService.selectListBy5(map);
		}
						
		ModelAndView mav = new ModelAndView();
				       //타일스 설정
		mav.setViewName("boardMain");
			mav.addObject("count", count);
			mav.addObject("list",list);
			mav.addObject("pagingHtml", page.getPagingHtml());
				
			return mav;
			}
	
	
	//관리자 글 등록 폼
	@GetMapping("/board/adminBoardWrite.do")
	public String form() {
		return "adminBoardWrite";
	}
		
	//관리자 글 등록 폼에서 전송된 데이터 처리
	@PostMapping("/board/adminBoardWrite.do")
	public String submit(BoardVO boardVO,
				         HttpSession session,
				         HttpServletRequest request) {
			
		logger.info("<<관리자 게시판 글 저장>> : " + boardVO);
			
		Integer user_num = (Integer)session.getAttribute("user_num");
		//회원 번호 셋팅
		boardVO.setMem_num(user_num);
		//글쓰기
		boardService.adminInsertBoard(boardVO);
			
		return "redirect:/board/boardMain.do";
		}
	
	//관리자 질문  목록
	@RequestMapping("/board/adminBoardList.do")
	public ModelAndView process4(
			@RequestParam(value="pageNum",defaultValue="1")int currentPage,
			@RequestParam(value="keyfield",defaultValue="")String keyfield,
			@RequestParam(value="keyword",defaultValue="")String keyword,
			@RequestParam(value="cate_num",defaultValue="31")String cate_num) {
					
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("keyfield", keyfield);
			map.put("keyword", keyword);
			map.put("cate_num", cate_num);
					
			//글의 총갯수 또는 검색된 글의 갯수
			int count = boardService.selectRowCount(map);
					
			//페이지 처리
			PagingUtil page = new PagingUtil(keyfield,keyword,
							                currentPage,count,20,10,"qnaList.do");
					
			map.put("start",page.getStartCount());
			map.put("end", page.getEndCount());
				
			//리스트
			List<BoardVO> list = null;
			if(count > 0) {
				list = boardService.selectList(map);
			}
							
			ModelAndView mav = new ModelAndView();
					        //타일스 설정
			mav.setViewName("adminBoardList");
			mav.addObject("count", count);
			mav.addObject("list",list);
			mav.addObject("pagingHtml", page.getPagingHtml());
					
			return mav;
			}
	
	//자주찾는 질문  목록
	@RequestMapping("/board/qnaList.do")
	public ModelAndView process(
			@RequestParam(value="pageNum",defaultValue="1")int currentPage,
			@RequestParam(value="keyfield",defaultValue="")String keyfield,
			@RequestParam(value="keyword",defaultValue="")String keyword,
			@RequestParam(value="cate_num",defaultValue="0")String cate_num) {
				
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("keyfield", keyfield);
			map.put("keyword", keyword);
			map.put("cate_num", cate_num);
				
			//글의 총갯수 또는 검색된 글의 갯수
			int count = boardService.selectRowCount(map);
				
			//페이지 처리
			PagingUtil page = new PagingUtil(keyfield,keyword,
						                currentPage,count,20,10,"qnaList.do");
				
			map.put("start",page.getStartCount());
			map.put("end", page.getEndCount());
			
			//리스트
			List<BoardVO> list = null;
			if(count > 0) {
				list = boardService.selectList(map);
			}
						
			ModelAndView mav = new ModelAndView();
				            //타일스 설정
			mav.setViewName("qnaList");
			mav.addObject("count", count);
			mav.addObject("list",list);
			mav.addObject("pagingHtml", page.getPagingHtml());
				
			return mav;
			}
	//자주찾는 질문  글상세 
	@RequestMapping("/board/qnaDetail.do")
	public ModelAndView process(@RequestParam int board_num) {
		logger.info("<<자주찾는 질문 글 상세 - 글 번호>> : " + board_num);
		
		//해당 글의 조회수 증가
		boardService.updateHit(board_num);
			
		BoardVO board = boardService.adminSelectBoard(board_num);
		//타이틀 HTML 불허
		board.setBoard_title(StringUtil.useNoHtml(board.getBoard_title()));
			                    //타일스 설정      속성명      속성값
		return new ModelAndView("qnaBoardView","board",board);
		}
		
	//이미지 출력
	@RequestMapping("/board/imageView.do")
	public ModelAndView viewImage(@RequestParam int board_num) {
		BoardVO board = boardService.adminSelectBoard(board_num);
			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile",board.getBoard_uploadfile());
		mav.addObject("filename", board.getBoard_filename());
		return mav;
	}
		
	//파일 다운로드
	@RequestMapping("/board/file.do")
	public ModelAndView download(@RequestParam int board_num) {
		BoardVO board = boardService.adminSelectBoard(board_num);
			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("downloadView");
		mav.addObject("downloadFile", board.getBoard_uploadfile());
		mav.addObject("filename", board.getBoard_filename());
			
		return mav;
	}
	
	//공지/뉴스 목록
	@RequestMapping("/board/newsList.do")
	public ModelAndView process1(
			@RequestParam(value="pageNum",defaultValue="1")int currentPage,
			@RequestParam(value="keyfield",defaultValue="")String keyfield,
			@RequestParam(value="keyword",defaultValue="")String keyword,
			@RequestParam(value="cate_num",defaultValue="20")String cate_num) {
				
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("keyfield", keyfield);
			map.put("keyword", keyword);
			map.put("cate_num", cate_num);
				
			//글의 총갯수 또는 검색된 글의 갯수
			int count = boardService.selectRowCount(map);
				
			//페이지 처리
			PagingUtil page = new PagingUtil(keyfield,keyword,
						                currentPage,count,20,10,"newsList.do");
				
			map.put("start",page.getStartCount());
			map.put("end", page.getEndCount());
			
			//리스트
			List<BoardVO> list = null;
			if(count > 0) {
				list = boardService.selectList(map);
			}
						
			ModelAndView mav = new ModelAndView();
				            //타일스 설정
			mav.setViewName("newsList");
			mav.addObject("count", count);
			mav.addObject("list",list);
			mav.addObject("pagingHtml", page.getPagingHtml());
				
			return mav;
			}
	
	
	//수정 폼
	@GetMapping("/board/adminUpdate.do")
	public String formUpdate(@RequestParam int board_num,
				                 Model model) {
	BoardVO boardVO = boardService.adminSelectBoard(board_num);
			
	model.addAttribute("boardVO", boardVO);		
			
	return "adminUpdate";
	}
	
	//수정 폼에서 전송된 데이터 처리
	@PostMapping("/board/adminUpdate.do")
	public String submitUpdate(BoardVO boardVO,
				               HttpServletRequest request,
				                Model model) {
			
		System.out.println("수정 실제"+boardVO.toString());
		logger.info("<<관리자 글 정보 수정>> : " + boardVO);
			
			
		//글 수정
		boardService.adminUpdateBoard(boardVO);
		
		model.addAttribute("boardVO", boardVO);	
			
		/*
		 * //view에 표시할 메시지 model.addAttribute("message", "글 수정 완료");
		 * model.addAttribute("url", request.getContextPath() + "/board/qnaList.do");
		 */
			
			return "redirect:/board/adminBoardList.do";
		}
	
	//회원 글 등록 폼 
	@GetMapping("/board/userBoardWrite.do")
	public String userBoardMain() {
		return "userBoardWrite";
	}
	
	//회원 글 등록 폼에서 전송된 데이터 처리
	@PostMapping("/board/userBoardWrite.do")
	public String submit1(BoardVO boardVO,
					      HttpSession session,
					      HttpServletRequest request) {
				
		logger.info("1<<사용자 게시판 글 저장>> : " + boardVO);
				
		Integer user_num = (Integer)session.getAttribute("user_num");
		//회원 번호 셋팅
		boardVO.setMem_num(user_num);
		//글쓰기
		boardService.insertBoard(boardVO);
				
		return "redirect:/board/boardMain.do";
		}
	
	//회원 수정 폼
	@GetMapping("/board/userUpdate.do")
	public String formUpdate2(@RequestParam int board_num,
					                 Model model) {
		
	logger.info("1<<회원 게시판 글 수정>> : " + board_num);
		
	BoardVO boardVO = boardService.selectBoard(board_num);
				
	model.addAttribute("boardVO", boardVO);		
				
	return "userUpdate";
	}
	
	//수정 폼에서 전송된 데이터 처리
	@PostMapping("/board/userUpdate.do")
	public String submitUpdate2(BoardVO boardVO,
					               HttpServletRequest request,
					                Model model) {
				
		System.out.println("수정 실제"+boardVO.toString());
		logger.info("<<회원 글 정보 수정>> : " + boardVO);
				
				
		//글 수정
		boardService.updateBoard(boardVO);
			
		model.addAttribute("boardVO", boardVO);	
	
				
		return "redirect:/board/userQnaList.do";
		}
		
	//문의/건의 목록
	@RequestMapping("/board/userQnaList.do")
		public ModelAndView process2(
			@RequestParam(value="pageNum",defaultValue="1")int currentPage,
			@RequestParam(value="keyfield",defaultValue="")String keyfield,
			@RequestParam(value="keyword",defaultValue="")String keyword,
			@RequestParam(value="cate_num",defaultValue="31")String cate_num) {
					
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("keyfield", keyfield);
			map.put("keyword", keyword);
			map.put("cate_num", cate_num);
					
			//글의 총갯수 또는 검색된 글의 갯수
			int count = boardService.selectRowCount(map);
					
			//페이지 처리
			PagingUtil page = new PagingUtil(keyfield,keyword,
							                currentPage,count,20,10,"userQnaList.do");
					
			map.put("start",page.getStartCount());
			map.put("end", page.getEndCount());
			map.put("cate_num", cate_num);
			
			//리스트
			List<BoardVO> list = null;
			if(count > 0) {
			list = boardService.selectList(map);
			}
							
			ModelAndView mav = new ModelAndView();
					            //타일스 설정
			mav.setViewName("userQnaList");
			mav.addObject("count", count);
			mav.addObject("list",list);
			mav.addObject("pagingHtml", page.getPagingHtml());
					
			return mav;
			}
	
	//내 상담내역
	@RequestMapping("/board/myList.do")
		public ModelAndView process5(
			@RequestParam(value="pageNum",defaultValue="1")int currentPage,
			@RequestParam(value="keyfield",defaultValue="")String keyfield,
			@RequestParam(value="keyword",defaultValue="")String keyword,
			@RequestParam(value="cate_num",defaultValue="31")String cate_num,
			HttpServletRequest request) {
						
		
			HttpSession session = request.getSession();
			int userNum = (int) session.getAttribute("user_num");
			System.out.println(userNum);
		
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("keyfield", keyfield);
			map.put("keyword", keyword);
			map.put("cate_num", cate_num);
			map.put("mem_num", userNum);
						
			//글의 총갯수 또는 검색된 글의 갯수
			int count = boardService.selectRowCount(map);
						
			//페이지 처리
			PagingUtil page = new PagingUtil(keyfield,keyword,
								                currentPage,count,20,10,"myList.do");
						
			map.put("start",page.getStartCount());
			map.put("end", page.getEndCount());
			map.put("cate_num", cate_num);
			map.put("mem_num", userNum);
				
			//리스트
			List<BoardVO> list = null;
			if(count > 0) {
//			list = boardService.selectList(map);	
			list = boardService.userSelectList(map);
			}
								
			ModelAndView mav = new ModelAndView();
						            //타일스 설정
			mav.setViewName("myList");
			mav.addObject("count", count);
			mav.addObject("list",list);
			mav.addObject("pagingHtml", page.getPagingHtml());
						
			return mav;
			}
	
	//회원 질문  글상세 
	@RequestMapping("/board/userQnaView.do")
		public ModelAndView process4(@RequestParam int board_num, HttpServletRequest request) {
			logger.info("<<회원 질문 글 상세 - 글 번호>> : " + board_num);
				
			HttpSession session = request.getSession();
			Integer memNum = 0;
			
		
			if (session.getAttribute("user_num") != null ) {
				memNum = (Integer) session.getAttribute("user_num");
			}
			int memNum2 = 0;
			
			try {
				memNum2 = boardService.compareBrdAuthority(board_num);
			} catch (Exception e) {
				System.out.println("관련 게시물이 없음");
			}
			
			boolean isOk = false;
			
			
			List<MemberVO> memberList = boardService.selectAdminUsers();
			
			for (MemberVO member : memberList) {
				if (memNum == member.getMem_num()) {
					isOk = true;
				}
			}
			
			//작성자, 관리자
			if (memNum == memNum2 || isOk == true) {
				//해당 글의 조회수 증가
				boardService.updateHit(board_num);
					
				BoardVO board = boardService.selectBoard(board_num);
				//타이틀 HTML 불허
				board.setBoard_title(StringUtil.useNoHtml(board.getBoard_title()));
					                    //타일스 설정            속성명      속성값
				return new ModelAndView("userQnaView","board",board);
				//로그아웃된 경우
			} else if (memNum == null){
				int alert = 1;
				return new ModelAndView("userQnaList","alert",alert);
			} else {
				//작성자가 아닌 경우
				int alert = 1;
				return new ModelAndView("userQnaList","alert",alert);
			}
			
			
			
			
			}
	
	//qna게시판 글 삭제
	@RequestMapping("/board/qnaDelete.do")
	public String submitDelete(@RequestParam int board_num) {
		boardService.adminDeleteBoard(board_num);
		return "redirect:/board/qnaList.do";
	}

	//news게시판 글 삭제
	@RequestMapping("/board/newsDelete.do")
	public String submitDelete2(@RequestParam int board_num) {
		boardService.adminDeleteBoard(board_num);
		return "redirect:/board/newsList.do";
	}
	
	//회원 글 삭제
	@RequestMapping("/board/userDelete.do")
	public String submitDelete3(@RequestParam int board_num) {
		boardService.adminDeleteBoard(board_num);
		return "redirect:/board/userQnaList.do";
	}
	
	
}
