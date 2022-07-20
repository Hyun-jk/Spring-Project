package kr.spring.theater.controller;

import java.util.Collections;
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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.theater.service.TheaterService;
import kr.spring.theater.vo.TheaterVO;

@Controller
public class TheaterController {
	private static final Logger logger = LoggerFactory.getLogger(TheaterController.class);
	
	@Autowired
	private TheaterService theaterService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public TheaterVO initCommand() {
		return new TheaterVO();
	}
	
	//1.관리자 - 극장지역등록 폼
	@GetMapping("/theater/theaterWrite.do")
	public String form() {
		return "theaterWrite"; //타일스설정
	}
	
	//1-1. 극장지역등록 폼에서 전송된 데이터 처리
	@PostMapping("/theater/theaterWrite.do")
	public String submit(@Valid TheaterVO theaterVO, BindingResult result, HttpSession session, HttpServletRequest request) {

		//로그
		logger.info("<<극장지역등록>> : " + theaterVO);

		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		
		//관리자로 로그인할 경우 체크
		Integer user_auth = (Integer)session.getAttribute("user_auth");
		
		//관리자번호세팅
		theaterVO.setMem_num(user_auth);
		
		//극장정보 등록 완료
		theaterService.insertTheater(theaterVO);
		
		return "redirect:/time/selectList.do";
	}
	
		//2. 극장지역리스트 ajax 
		@RequestMapping("/time/selectListData.do")
		@ResponseBody //제이슨문자열로 만들어줌
		public Map<String,Object> process(@RequestParam String theater_local){
			logger.info("<<local>> : " + theater_local);
			
			Map<String,Object> map = new HashMap<String,Object>();
			
			List<TheaterVO> list = theaterService.listLocal(theater_local);
			if(list!=null) {
				//list 데이터가 존재할 때 결과
				map.put("list", list);
			}else {
				map.put("list", Collections.emptyList());
			}
			return map;
		}
		

		 //3-1. 이미지 출력
		 @RequestMapping("/theater/theaterImage.do") //번호를 통해 이미지를 읽어와야함 
		 public ModelAndView theaterWrite(@RequestParam int theater_num) {
			 TheaterVO theater = theaterService.selectTheater(theater_num);
			 
			 ModelAndView mav = new ModelAndView();
			 mav.setViewName("imageView");
			 mav.addObject("imageFile",theater.getTheater_image()); //바이트배열로 반환
			 mav.addObject("filename",theater.getTheater_imagename());
		 
		 return mav;
		}
		 
		 //4. 극장지점명 변경 ajax 
		 @RequestMapping("/time/theaterInfo.do")
		 @ResponseBody //제이슨문자열로 만들어줌
		 public Map<String,Object> process2(@RequestParam String theater_name){
			 logger.info("<<theater_name>> : " + theater_name);

			 Map<String,Object> map = new HashMap<String,Object>();

			 List<TheaterVO> list = theaterService.listLocal(theater_name);
			 if(list!=null) {
				 //list 데이터가 존재할 때 결과
				 map.put("list", list);
			 }else {
				 map.put("list", Collections.emptyList());
			 }
			 return map;
		 }
}
