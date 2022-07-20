<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 중앙 컨텐츠 시작 -->
<!-- 부트스트랩 라이브러리 -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<div class="page-main">
	<h2>극장 등록</h2>
	<form:form modelAttribute="movieVO" action="theaterInsert.do" id="register_form">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<form:label path="movie_name">제목</form:label>
				<form:input path="movie_name"/>
				<form:errors path="movie_name" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="movie_genre">영화 장르</form:label>
				<form:input path="movie_genre"/>
				<form:errors path="movie_genre" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="movie_auth">상영 정보</form:label>
				<form:input path="movie_auth"/>
				<form:errors path="movie_auth" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="movie_pg">영화 관람연령</form:label>
				<form:input path="movie_pg"/>
				<form:errors path="movie_pg" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="movie_date">상영날짜</form:label>
				<form:input path="movie_date"/>
				<form:errors path="movie_date" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="movie_time">상영시간</form:label>
				<form:input path="movie_time"/>
				<form:errors path="movie_time" cssClass="error-color"/>
			</li>
			
		</ul>	 
		<div class="align-center">
			<form:button>전송</form:button>
			<input type="button" value="목록" 
			              onclick="location.href='movieChart.do'">
		</div>                                          
	</form:form>
</div> --%>
<!-- 중앙 컨텐츠 끝 -->
