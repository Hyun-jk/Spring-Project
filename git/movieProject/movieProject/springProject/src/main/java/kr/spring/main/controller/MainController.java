package kr.spring.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.movie.service.MovieService;
import kr.spring.movie.vo.MovieVO;

@Controller
public class MainController {
	
	@Autowired
	private MovieService movieService;

	@RequestMapping("/main/main.do")
	public ModelAndView main() {
		//1. TODO 소진 : 검색조건 추가하기(상위랭크4개만 뽑기)
		Map<String,Object> map = new HashMap<String,Object>();
		
		//2. select(service)
		int count = movieService.selectRowCount(map);
		
		List<MovieVO> movieList = null;
		if(count > 0) {
			map.put("start",1);
			map.put("end",10);
			movieList = movieService.selectList(map);
		}

		//3. ModelAndView에 넣기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		mav.addObject("count", count);
		mav.addObject("movieList",movieList);
		
		//타일스 설정
		return mav;
	}
}
