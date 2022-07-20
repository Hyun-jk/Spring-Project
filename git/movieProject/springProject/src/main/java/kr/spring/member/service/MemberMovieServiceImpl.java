package kr.spring.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.member.dao.MemberMovieMapper;
import kr.spring.movie.vo.MovieReviewVO;
import kr.spring.movie.vo.MovieVO;
import kr.spring.reserve.vo.ReserveVO;

@Service
@Transactional
public class MemberMovieServiceImpl implements MemberMovieService{

	@Autowired
	private MemberMovieMapper MemberMovieMapper;

	@Override
	public int selectMyWatchedMovieCount(Map<String, Object> map) {
		return MemberMovieMapper.selectMyWatchedMovieCount(map);
	}

	@Override
	public List<ReserveVO> selectMyWatchedMovie(Map<String, Object> map) {
		return MemberMovieMapper.selectMyWatchedMovie(map);
	}

	@Override
	public int selectMyReserveMovieCount(Map<String, Object> map) {
		return MemberMovieMapper.selectMyReserveMovieCount(map);
	}

	@Override
	public List<ReserveVO> selectMyReserveMovie(Map<String, Object> map) {
		return MemberMovieMapper.selectMyReserveMovie(map);
	}

	@Override
	public void deleteMyMovie(int reserve_num) {
		MemberMovieMapper.deleteMyMovie(reserve_num);
	}
	@Override
	public ReserveVO selectMyMovie(int reserve_num) {
		return MemberMovieMapper.selectMyMovie(reserve_num);
	}
	
	@Override
	public int selectMyInterestedMovieCount(Map<String, Object> map) {
		return MemberMovieMapper.selectMyInterestedMovieCount(map);
	}

	@Override
	public List<MovieVO> selectMyInterestedMovie(Map<String, Object> map) {
		return MemberMovieMapper.selectMyInterestedMovie(map);
	}

	@Override
	public void insertReview(MovieReviewVO review) {
		review.setReview_num(MemberMovieMapper.selectReview_num());
		MemberMovieMapper.insertReview(review);
		review.setTotal_rate(MemberMovieMapper.countTotalMovieRate(review));
		MemberMovieMapper.updateMovieRate(review);
	}

	@Override
	public int selectMyReviewListCount(Map<String, Object> map) {
		return MemberMovieMapper.selectMyReviewListCount(map);
	}
	
	@Override
	public List<MovieReviewVO> selectMyReviewList(Map<String, Object> map) {
		return MemberMovieMapper.selectMyReviewList(map);
	}

	@Override
	public void updateMyReview(MovieReviewVO review) {
		MemberMovieMapper.updateMyReview(review);
		review.setTotal_rate(MemberMovieMapper.countTotalMovieRate(review));
		MemberMovieMapper.updateMovieRate(review);
	}
	@Override
	public MovieReviewVO selectReviewDetail(int review_num) {
		return MemberMovieMapper.selectReviewDetail(review_num);
	}

	@Override
	public void deleteMyReview(MovieReviewVO review) {
		MemberMovieMapper.deleteMyReview(review);
		review.setTotal_rate(MemberMovieMapper.countTotalMovieRate(review));
		MemberMovieMapper.updateMovieRate(review);
	}

	}
	
