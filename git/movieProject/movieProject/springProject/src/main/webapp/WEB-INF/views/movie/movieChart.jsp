<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<div class="page-main">
	<div class="tit-moviechart">
		<h1>무비차트</h1>
	</div>
	<div class="order-moviechart">
		<div class="align-right">
			<select id="order_type" name="order-type">
				<option title="현재 선택됨" selected value="1">예매율순</option>
				<option value="2">평점순</option>
				<option value="3">관람객순</option>
			</select>
			<button type="button" class="round gray">
				<span>GO</span>
			</button>
		</div>
		<div class="list-moviechart">
			<c:if test="${!empty user_num && user_auth == 3}">
				<div class="align-right">
					<input type="button" value="글쓰기"
						onclick="location.href='movieWrite.do'">
				</div>
			</c:if>
			<c:if test="${count == 0}">
				<div class="result-display">표시할 게시물이 없습니다.</div>
			</c:if>
			<c:if test="${count > 0}">
			<c:forEach var="movie" items="${list}">
				<ul>
					<li>
						<div class="movie-image">
						<a href="movieDetail.do?movie_num=${movie.movie_num}"><img src="imageView.do?movie_num=${movie.movie_num}" style="width:185px; height:260px;"></a></div>
						<div class="movie-content">
						<strong class="movie_pg">
						<c:choose>
						<c:when test="${12 <= movie.movie_pg && movie.movie_pg < 15}">
						<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/grade-12.png">
						</c:when>
						<c:when test="${15 <= movie.movie_pg && movie.movie_pg < 19}">
						<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/grade-15.png">
						</c:when>
						<c:when test="${19 <= movie.movie_pg}">
						<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/grade-19.png">
						</c:when>
						<c:otherwise>
						<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/grade-all.png">
						</c:otherwise></c:choose></strong>
						<strong class="movie_name"><a href="movieDetail.do?movie_num=${movie.movie_num}">${movie.movie_name}</a></strong><br>
						<strong class="movie_genre">${movie.movie_genre}</strong>
						<strong class="movie_auth">
						<c:if test="${movie.movie_auth == 0}">
							<div class="auth_result">상영중</div>
						</c:if>
						<c:if test="${movie.movie_auth == 1}">
							<div class="auth_result">상영 예정</div>
						</c:if>
						<c:if test="${movie.movie_auth == 2}">
							<div class="auth_result">상영 종료</div>
						</c:if>
						</strong>
						</div>
						<strong class="movie_reserve"><a href="/" style="color:white;">예매하기</a></strong>
						
					</li>
					</ul>
			</c:forEach>
			</c:if>
		</div>
	</div>
	<div class="align-center">${pagingHtml}</div>
</div>
