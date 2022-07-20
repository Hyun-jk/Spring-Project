package kr.spring.admin.controller;

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

import kr.spring.admin.dao.AdminMapper;
import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.reserve.vo.ReserveVO;
import kr.spring.util.AuthCheckException;
import kr.spring.util.PagingUtil;
import oracle.jdbc.proxy.annotation.Post;

@Controller
public class AdminController{

		private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
		
		//예매 조건 체크를 위해서 날짜 데이터
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd hh:mm");
		String str = format.format(date);
		String movieDate = str.substring(0, 8);
		String movieHour = str.substring(9,11)+"시";
		
		@Autowired
		private AdminMapper adminMapper;
		@Autowired
		private MemberService memberService;
		
		//관리자 회원페이지
		@RequestMapping("/admin/adminPage.do")
		public ModelAndView adminViewMemberList(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage, 
												@RequestParam(value="keyfield", defaultValue="") String keyfield,
												@RequestParam(value="keyword", defaultValue="") String keyword,
												HttpSession session) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("keyfield", keyfield);
			map.put("keyword", keyword);
			
			int count = adminMapper.adminMemberRowCount(map);
			logger.info("<count>> : " + count);
			
			//페이지 처리
			PagingUtil page = new PagingUtil(keyfield,keyword,currentPage, count, 10, 10, "adminPage.do");
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			
			List<MemberVO> list = null;
			if (count > 0) {
				list = adminMapper.adminSelectList(map);
			}
			
			logger.info("<list>> : " + list);
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("adminPage");
			mav.addObject("count", count);
			mav.addObject("list", list);
			mav.addObject("pagingHtml", page.getPagingHtml());
			
			return mav;
		}
		
		
		//관리자 회원정보 업데이트 페이지
		
		//예매내역 확인 페이지
		@RequestMapping("/admin/adminReserveListMovie.do")
		public ModelAndView viewMyReserveMovie(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage, 
											   @RequestParam(value="keyfield", defaultValue="") String keyfield,
											   @RequestParam(value="keyword", defaultValue="") String keyword,
											   HttpSession session) {
			
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("keyfield", keyfield);
			map.put("keyword", keyword);
			map.put("movieDate", movieDate);
			map.put("movieHour", movieHour);
			logger.info("<map>> : " + map);
			
			int count = adminMapper.selectAdminReserveMovieListCount(map);
			
			//페이지 처리
			PagingUtil page = new PagingUtil(currentPage, count, 10, 10, "adminReserveListMovie.do");
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			
			List<ReserveVO> list = null;
			if (count > 0) {
				list = adminMapper.selectAdminReserveMovieList(map);
			}
			logger.info("<list>> : " + list);

			ModelAndView mav = new ModelAndView();
			mav.setViewName("adminReserveListMovie");
			mav.addObject("count", count);
			mav.addObject("list", list);
			mav.addObject("pagingHtml", page.getPagingHtml());
			
			return mav;
		}
		
			
			
		
	}



