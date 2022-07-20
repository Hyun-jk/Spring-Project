package kr.spring.member.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.board.controller.BoardController;
import kr.spring.member.service.MemberMovieService;
import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.movie.service.MovieService;
import kr.spring.movie.vo.MovieReviewVO;
import kr.spring.movie.vo.MovieVO;
import kr.spring.reserve.vo.ReserveVO;
import kr.spring.util.PagingUtil;

@Controller
public class MemberMovieController {
	private static final Logger logger = LoggerFactory.getLogger(MemberMovieController.class);
	
	@Autowired
	private MemberMovieService MemberMovieService;
	@Autowired
	private MemberService memberService;
	
	// 자바빈(VO)초기화
	@ModelAttribute
	public MovieReviewVO initCommand() {
		return new MovieReviewVO();
	}
	
	//예매 조건 체크를 위해서 날짜 데이터
	Date date = new Date();
	SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd hh:mm");
	String str = format.format(date);
	String movieDate = str.substring(0, 8);
	String movieHour = str.substring(9,11)+"시";
	
	//내가 본 영화 리스트처리
	@RequestMapping("/user/myWatchedMovie.do")
	public ModelAndView viewMyWatchedMovie(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage, HttpSession session) {
		
		Integer user_num = (Integer)session.getAttribute("user_num");
		MemberVO member = memberService.selectMember(user_num);
		
		logger.info("<user_num>> : " + user_num);
		logger.info("<영화날짜>> : " + movieDate);
		logger.info("<영화시간>> : " + movieHour);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_num",user_num);
		map.put("movieDate", movieDate);
		map.put("movieHour", movieHour);
		logger.info("<map>> : " + map);
		
		int count = MemberMovieService.selectMyWatchedMovieCount(map);
		logger.info("<count>> : " + count);
		
		//페이지 처리
		PagingUtil page = new PagingUtil(currentPage, count, 10, 10, "myWatchedMovie.do");
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		logger.info("<map222>> : " + map);
		
		List<ReserveVO> list = null;
		if (count > 0) {
			list = MemberMovieService.selectMyWatchedMovie(map);
		}
		logger.info("<list>> : " + list);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("myWatchedMovie");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());
		mav.addObject("member",member);
		
		return mav;
	}
	
	//나의 예매 내역
	@RequestMapping("/user/myReserveMovie.do")
	public ModelAndView viewMyReserveMovie(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage, HttpSession session) {
		
		Integer user_num = (Integer)session.getAttribute("user_num");
		MemberVO member = memberService.selectMember(user_num);
		
		logger.info("<user_num>> : " + user_num);
		logger.info("<영화날짜>> : " + movieDate);
		logger.info("<영화시간>> : " + movieHour);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_num",user_num);
		map.put("movieDate", movieDate);
		map.put("movieHour", movieHour);
		logger.info("<map>> : " + map);
		
		int count = MemberMovieService.selectMyReserveMovieCount(map);
		logger.info("<count>> : " + count);
		
		//페이지 처리
		PagingUtil page = new PagingUtil(currentPage, count, 10, 10, "myReserveMovie.do");
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		logger.info("<map222>> : " + map);
		
		List<ReserveVO> list = null;
		if (count > 0) {
			list = MemberMovieService.selectMyReserveMovie(map);
		}
		logger.info("<list>> : " + list);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("myReserveMovie");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());
		mav.addObject("member",member);
		
		return mav;
	}
	//내가 관심 있는 영화
		@RequestMapping("/user/myInterestedMovie.do")
		public ModelAndView viewMyInterestedMovie(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage, HttpSession session) {
			
			Integer user_num = (Integer)session.getAttribute("user_num");
			MemberVO member = memberService.selectMember(user_num);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mem_num",user_num);
			
			int count = MemberMovieService.selectMyInterestedMovieCount(map);
			logger.info("<count>> : " + count);
			
			//페이지 처리
			PagingUtil page = new PagingUtil(currentPage, count, 10, 10, "myInterestedMovie.do");
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			logger.info("<map222>> : " + map);
			
			List<MovieVO> list = null;
			if (count > 0) {
				list = MemberMovieService.selectMyInterestedMovie(map);
			}
			logger.info("<내가 관심있는 영화>> : " + list);

			ModelAndView mav = new ModelAndView();
			mav.setViewName("myInterestedMovie");
			mav.addObject("count", count);
			mav.addObject("list", list);
			mav.addObject("pagingHtml", page.getPagingHtml());
			mav.addObject("member",member);
			
			return mav;
		}
	//리뷰평가 등록 폼
	@GetMapping("/user/writeReviewForm.do")
	public String writeReviewform(@RequestParam("movie_num") int movie_num, HttpSession session) {
		
		Integer user_num = (Integer)session.getAttribute("user_num");
		
		session.setAttribute("mem_num",user_num);
		session.setAttribute("movie_num", movie_num);
		
		// 타일스 설정
		return "writeReviewForm";
	}	

	// 리뷰평가 등록
	@PostMapping("/user/writeReview.do")
	public String writeReview(@Valid MovieReviewVO movieReviewVO, BindingResult result,HttpSession session) {
		
		Integer mem_num = (Integer)session.getAttribute("user_num");
		Integer movie_num = (Integer)session.getAttribute("movie_num");
		movieReviewVO.setMem_num(mem_num);
		movieReviewVO.setMovie_num(movie_num);
		logger.info("<<리뷰평가>> :" + movieReviewVO);

		// 유효성 체크 결과 오류가 있으면 폼 호출
		/*
		 * if(result.hasErrors()) { return form(); }
		 */

		// 리뷰등록
		MemberMovieService.insertReview(movieReviewVO);
		return "redirect:/main/main.do";
	}
	
		//내가 남긴 리뷰평가
		@RequestMapping("/user/myReview.do")
		public ModelAndView viewMyReview(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage, HttpSession session) {
			Integer user_num = (Integer)session.getAttribute("user_num");
			MemberVO member = memberService.selectMember(user_num);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mem_num",user_num);
			
			int count = MemberMovieService.selectMyReviewListCount(map);
			logger.info("<count>> : " + count);
			
			//페이지 처리
			PagingUtil page = new PagingUtil(currentPage, count, 10, 10, "myReview.do");
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			
			List<MovieReviewVO> list = null;
			if (count > 0) {
				list = MemberMovieService.selectMyReviewList(map);
			}
			logger.info("<나의 리뷰>> : " + list);

			ModelAndView mav = new ModelAndView();
			mav.setViewName("myReview");
			mav.addObject("count", count);
			mav.addObject("list", list);
			mav.addObject("pagingHtml", page.getPagingHtml());
			mav.addObject("member",member);
			return mav;
		}
		// 리뷰평가 수정폼
		@GetMapping("/user/modifyReviewForm.do")
		public String formUpdate(@RequestParam("review_num") int review_num, HttpSession session, Model model) {
			logger.info("<review>> : " + review_num);

			MovieReviewVO movieReviewVO = MemberMovieService.selectReviewDetail(review_num);
			model.addAttribute("movieReviewVO", movieReviewVO);

			return "modifyReviewForm";
		}

		// 리뷰수정폼에서 전송된 데이터 처리
		@PostMapping("/user/modifyReview.do")
		public String submitUpdate(@Valid MovieReviewVO movieReviewVO, BindingResult result, HttpSession session) {

			Integer mem_num = (Integer)session.getAttribute("user_num");
			logger.info("<<리뷰평가111>> :" + movieReviewVO);
			
			MemberMovieService.updateMyReview(movieReviewVO);
			
			// 유효성 체크 결과 오류가 있으면 폼 호출
			/*
			 * if(result.hasErrors()) { return form(); }
			 */
			return "redirect:/user/myReview.do";
		}
		
}
