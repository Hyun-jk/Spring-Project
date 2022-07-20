package kr.spring.reserve.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.reserve.service.ReserveService;
import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.movie.vo.MovieVO;
import kr.spring.theater.vo.TheaterVO;
import kr.spring.time.vo.TimeVO;


@Controller
public class ReserveAjaxController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReserveAjaxController.class);
	
	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	private MemberService memberService;
	
	//선택한 영화 목록
	@RequestMapping("/reserve/pickmovie.do")
	@ResponseBody
	public Map<String,Object> pickmoviedetail(@RequestParam(value="movie_num") int movie_num,HttpSession session){
		
		logger.info("<<전달받은 영화 번호>> movie_num : " + movie_num);
		
		MovieVO movie = reserveService.pickmoviedetail(movie_num);
		List<TheaterVO> theater_local_name = null;
		theater_local_name = reserveService.pickmoviedetail_get_theater_local(movie_num);
		List<Integer> theater_local_count = null;
		theater_local_count = reserveService.pickmoviedetail_get_theater_localcount(movie_num);
		
		logger.info("<<영화 클릭 시 전달된 영화 정보>> movie : " + movie);
		
		//연령제한 유효성 체크를 위한 날짜 정보 가져오기
		Date nowDate = new Date(); 
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yy");
		int date = Integer.parseInt(simpleDateFormat.format(nowDate));
		
		Integer user_num = (Integer)session.getAttribute("user_num");
		MemberVO member = memberService.selectMember(user_num);
		String str = Integer.toString(member.getMem_birth());
		int birth = Integer.parseInt(str.substring(0, 2));
		
		//로그인한 회원 나이
		int age = Math.abs(date-birth);
		
		Map<String,Object> mapJson = new HashMap<String,Object>();
		mapJson.put("movie", movie);
		mapJson.put("theater_local_name",theater_local_name);
		mapJson.put("theater_local_count",theater_local_count);
		mapJson.put("age",age);
		
		return mapJson;
	}
	
	//영화 선택 후 극장 지역(서울/인천...)선택 시 지역별 CGV 목록
	@RequestMapping("/reserve/picklocal.do")
	@ResponseBody
	public Map<String,Object> picklocaldetail(@RequestParam(value="pick_localname") String theater_local,@RequestParam(value="pick_movie_num") Integer movie_num){
		
		logger.info("<<전달받은 영화 번호>> movie_num : " + movie_num);
		logger.info("<<전달받은 CGV 지역>> theater_local : " + theater_local);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("movie_num",movie_num);
		map.put("theater_local",theater_local);
		
		List<TheaterVO> cgv_list = null;
		cgv_list = reserveService.pickmoviedetail_get_theater_cgv(map);
		
		Map<String,Object> mapJson = new HashMap<String,Object>();
		mapJson.put("cgv_list", cgv_list);
		
		return mapJson;
	}
	
	//cgv 선택
	@RequestMapping("/reserve/pickcgv.do")
	@ResponseBody
	public Map<String,Object> pickcgvdetail(@RequestParam(value="pick_theaternum") Integer theater_num,@RequestParam(value="pick_movie_num") Integer movie_num){
		
		logger.info("<<전달받은 영화 번호>> movie_num : " + movie_num);
		logger.info("<<전달받은 상영관 번호>> theater_num : " + theater_num);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("movie_num", movie_num);
		map.put("theater_num", theater_num);
				
		List<TimeVO> date_list = null;
		date_list = reserveService.pickmoviedetail_get_date(map);
		
		for(TimeVO time: date_list) {
			time.setMovie_date(time.getMovie_date().substring(2, 10).replace("-","/"));
		}	
		
		System.out.println("상영일자 조회 결과 : " + date_list);

		Map<String,Object> mapJson = new HashMap<String,Object>();
		mapJson.put("date_list", date_list);
		
		return mapJson;
	}
	
	//상영일자 선택
	@RequestMapping("/reserve/pickdate.do")
	@ResponseBody
	public Map<String,Object> pickdatedetail(@RequestParam(value="pick_theaternum") Integer theater_num,
											 @RequestParam(value="pick_movie_num") Integer movie_num,
											 @RequestParam(value="pick_moviedate") String movie_date){
		
		logger.info("<<전달받은 영화 번호>> movie_num : " + movie_num);
		logger.info("<<전달받은 상영관 번호>> theater_num : " + theater_num);
		logger.info("<<전달받은 상영일자>> movie_date : " + movie_date);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("movie_num", movie_num);
		map.put("theater_num", theater_num);
		map.put("movie_date", movie_date);
				
		List<TimeVO> time_list = null;
		time_list = reserveService.pickmoviedetail_get_time(map);
		System.out.println("메서드 실행후(time_list) : " + time_list);
		
		Map<String,Object> mapJson = new HashMap<String,Object>();
		mapJson.put("time_list", time_list);
		
		return mapJson;
	}
	
	//상영시간 선택
	@RequestMapping("/reserve/picktime.do")
	@ResponseBody
	public Map<String,Object> picktimedetail(@RequestParam(value="pick_time_num") Integer time_num){
		
		logger.info("<<전달받은 상영시간 번호>> time_num : " + time_num);
		
		int seat_total_count = reserveService.seat_total_count(time_num);
		int reserv_total_count = reserveService.reservseat_total_count(time_num);
		int seat_possable_count = seat_total_count-reserv_total_count;
		
		Map<String,Object> mapJson = new HashMap<String,Object>();
		mapJson.put("seat_total_count", seat_total_count);
		mapJson.put("reserv_total_count", reserv_total_count);
		mapJson.put("seat_possable_count", seat_possable_count);
		
		return mapJson;
	}
	
	//선택한 영화의 연령제한 정보 가져오기
	@RequestMapping("/reserve/pickmovie_pg.do")
	@ResponseBody
	public Map<String,Object> pickmoviedetail_pg(@RequestParam(value="pick_movie_num") int movie_num){
		
		logger.info("<<전달받은 영화 번호>> movie_num : " + movie_num);
		
		MovieVO movie = reserveService.pickmoviedetail(movie_num);
		
		Map<String,Object> mapJson = new HashMap<String,Object>();
		mapJson.put("movie", movie);
		
		return mapJson;
	}
	
}
