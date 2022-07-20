<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<div>
	<b>${member.mem_name}</b>님 예매가 완료되었습니다.
</div>
<hr width="100%">
<div>
	<div>
		<c:if test="${empty movie.filename}">
			<img src="${pageContext.request.contextPath}/resources/images/default.png" width="500px" height="500px" style="float:left; margin: 20px;" id="movie_photo">
		</c:if>
		<c:if test="${!empty movie.filename}">
			<img src="${pageContext.request.contextPath}/movie/imageView.do?movie_num=${movie.movie_num }" width="500px" style="float:left; margin: 20px;" id="movie_photo">
		</c:if>
	</div>
	<div>
		<p>${movie.movie_name}</p>
		<p>극장 | ${theater.theater_name}</p>
		<p>일시 | ${time.movie_date} ${time.movie_time}</p>
		<p>인원 | 성인 ${reserve.reserve_adult}명, 청소년 ${reserve.reserve_youth}명, 경로우대 ${reserve.reserve_old}명</p>
		<p>좌석번호 | ${reserve.reserve_seat}<p>
		<input type="button" value="영화정보 보기" class="custom-btn btn-7" onclick="location.href='${pageContext.request.contextPath}/movie/movieDetail.do?movie_num=${movie.movie_num}'">
		<input type="button" value="마이페이지"  class="custom-btn btn-7" onclick="location.href='${pageContext.request.contextPath}/user/myPage.do'">
	</div>
</div>
<hr width="100%">
<table>
	<tr>
		<th>결제하실 금액</th>
		<th>총 할인 금액</th>
		<th>최종결제 금액</th>
		<th>결제 방법</th>
	</tr>
	<tr>
		<td style="text-align:center;"><fmt:formatNumber value="${reserve.reserve_price_total}" type="number"/>원</td>
		<td style="text-align:center;"><fmt:formatNumber value="${reserve.sale_price}" type="number"/>원</td>
		<td style="text-align:center;"><fmt:formatNumber value="${reserve.final_price}" type="number"/>원</td>
		<td style="text-align:center;">${reserve.reserve_paymethod}</td>
	</tr>
</table>
<!-- 중앙 컨텐츠 끝 -->