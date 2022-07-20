package kr.spring.time.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.movie.vo.MovieVO;
import kr.spring.seat.vo.SeatVO;
import kr.spring.theater.service.TheaterService;
import kr.spring.theater.vo.TheaterVO;
import kr.spring.time.service.TimeService;
import kr.spring.time.vo.TimeVO;

@Controller
public class TimeController {
	private static final Logger logger = LoggerFactory.getLogger(TimeController.class);
	
	@Autowired
	private TimeService timeService;
	
	@Autowired
	private TheaterService theaterService;
	
	//1. 목록
	@RequestMapping(value = "/time/selectList.do")
	public String timeList(TimeVO timeVO, Model model) {
		
		//List<TimeVO> list = timeService.getTimeList(timeVO);
		//model.addAttribute("list",list);
		
		return "selectList";
	}
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public TimeVO initCommand() {
		return new TimeVO();
	}
	  
	//2. 극장등록 
	//극장 등록 폼
	@GetMapping("/time/timeInsert.do")
	public ModelAndView form2() {
		
		List<TheaterVO> list = theaterService.selectAllTheater();
		List<MovieVO> movie_list = theaterService.selectAllMovie();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("theaterInsert2");
		mav.addObject("theater_list", list);
		mav.addObject("movie_list",movie_list);
		
		return mav;
	}

	//2-1. 극장 등록 폼에서 전송된 데이터 처리
	@PostMapping("/time/timeInsert.do")
	public ModelAndView submit2(@Valid TimeVO timeVO, BindingResult result, HttpSession session, HttpServletRequest request) {
		logger.info("<<극장 저장>> : " + timeVO);
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form2();
		}
		
		Integer user_num = (Integer)session.getAttribute("user_num");
		//회원 번호 셋팅
		timeVO.setMem_num(user_num);

		//극장 등록
		timeService.insertTheater2(timeVO);

		return new ModelAndView("redirect:/time/selectList.do");
	}
	
	//시트 자바빈(VO) 초기화
	@ModelAttribute
	public SeatVO initCommandSeat() {
		return new SeatVO();
	}

	//좌석 등록 폼
	@GetMapping("/time/insertSeat.do")
	public ModelAndView seatform() {
		
		List<TheaterVO> list = theaterService.selectAllTheater();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("insertSeat");
		mav.addObject("theater_list",list);
		
		return mav;
	}
	//좌석 등록 폼에서 전송된 데이터 처리
	@PostMapping("/time/insertSeat.do")
	public ModelAndView seatsubmit(@Valid SeatVO seatVO, BindingResult result, HttpSession session, HttpServletRequest request) {
		logger.info("<<좌석 저장>> : " + seatVO);

		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return seatform();
		}

		Integer user_num = (Integer)session.getAttribute("user_num");
		//회원 번호 셋팅
		seatVO.setMem_num(user_num);

		//좌석 등록
		timeService.insertSeat(seatVO);

		return new ModelAndView("redirect:/time/selectList.do");
	}
	
	
	//날짜별 상영 정보 얻기
	@RequestMapping("/time/selectTimeListAjax.do")
	@ResponseBody
	public Map<String,List<TimeVO>> selectTimeList(@RequestParam String movie_date,
			                           @RequestParam int theater_num){
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("movie_date",movie_date);
		map.put("theater_num",theater_num);
		
		System.out.println("~~~~~~"+map);
		
		Map<String,List<TimeVO>> mapAjax = new HashMap<String,List<TimeVO>>();
		
		List<TimeVO> list = timeService.selectList(map);
		List<TimeVO> timeList = timeService.selectTimeList(map);
		
		mapAjax.put("list", list);
		mapAjax.put("time_list", timeList);
		
		System.out.println(timeList);
	
		return mapAjax;
	}
	
	
	//2-2.영화번호 구하기
	@RequestMapping("/time/theaterWrite2.do")
	 public ModelAndView theaterWrite2(@RequestParam int movie_num) {
		
		logger.info("<<영화 번호>> : " + movie_num);
		
		 MovieVO movieVO = timeService.selectMovie2(movie_num);
		 
		 ModelAndView mav = new ModelAndView();
		 mav.setViewName("theaterWrite2");
		 mav.addObject("movie_num",movieVO.getMovie_num());
		 mav.addObject("movie_genre",movieVO.getMovie_genre());
		 mav.addObject("movie_pg",movieVO.getMovie_pg());
		 mav.addObject("movie_auth",movieVO.getMovie_auth());
	 
	 return mav;
	}
}
