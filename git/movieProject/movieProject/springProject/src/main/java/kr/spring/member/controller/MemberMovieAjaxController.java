package kr.spring.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.member.service.MemberMovieService;
import kr.spring.member.vo.MemberVO;
import kr.spring.movie.vo.MovieReviewVO;
import kr.spring.reserve.vo.ReserveVO;

@Controller
public class MemberMovieAjaxController {
	private static final Logger logger = LoggerFactory.getLogger(MemberAjaxController.class);
	
	@Autowired
	private MemberMovieService memberMovieService;
	
	//나의 영화 삭제하기
	@RequestMapping("/user/deleteMyMovie.do")
	@ResponseBody
	public Map<String,String> deleteprocess(@RequestParam("mem_num") int mem_num,
											@RequestParam("reserve_num") int reserve_num,
											HttpSession session){
		
		logger.info("<<mem_num>> : " + mem_num);
		logger.info("<<reserve_num>> : " + reserve_num);
		ReserveVO reserveVO = memberMovieService.selectMyMovie(reserve_num);
		
		Map<String,String> map = new HashMap<String,String>();
		
		if(reserveVO.getMem_num() != mem_num) {
			map.put("result", "notMatchUser_num");
		}else {	
			memberMovieService.deleteMyMovie(reserve_num);
			map.put("result", "success");
		}
		
		return map;
	}
	
	// 내가 쓴 리뷰 삭제하기
	@RequestMapping("/user/deleteMyReview.do")
	@ResponseBody
	public Map<String, String> deleteReviewprocess(@RequestParam("review_num") int review_num,
												   @RequestParam("mem_num") int mem_num,
												   HttpSession session) {
		logger.info("<<mem_num>> : " + mem_num);
		logger.info("<<review_num>> : " + review_num);
		MovieReviewVO reviewVO = memberMovieService.selectReviewDetail(review_num);
		logger.info("<<reviewVO>> : " + reviewVO);

		Map<String, String> map = new HashMap<String, String>();
		
		if (reviewVO.getMem_num() != mem_num) {
			map.put("result", "notMatchUser_num");
		
		}else { 
			memberMovieService.deleteMyReview(reviewVO);
			map.put("result", "success");
		}
		return map;
	}
				
}






