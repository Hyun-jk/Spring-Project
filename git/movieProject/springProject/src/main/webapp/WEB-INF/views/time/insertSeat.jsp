<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- 중앙 컨텐츠 시작 -->
<style type="text/css">
form {
    width: 355px;
    margin: 0 auto;
    border: 1px solid #000;
    padding: 10px 10px 10px 30px;
}
#search_form {
    overflow: hidden;
    margin-top: -10px;
    margin-left: 75px;
    padding: 5px;
}
</style>
<!-- 부트스트랩 라이브러리 -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<div class="page-main">
	<h2 style="width: 500px;padding-left: 170px;">좌석 등록</h2>
	<form:form modelAttribute="seatVO" action="insertSeat.do" id="seat_form">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
		    <li style="clear:both">
				<form:label path="theater_num">극장</form:label>
				<select name="theater_num" id="theater_num">
				<c:forEach var="list" items="${theater_list }">
					<option value="${list.theater_num}">${list.theater_name}</option>
				</c:forEach>
				</select>
				<form:errors path="theater_num" cssClass="error-color"/>
			</li>
			<li style="clear:both;"><p>
				<form:label path="seat_name">좌석명</form:label>
				<form:input path="seat_name"/>
				<form:errors path="seat_name" cssClass="error-color"/>
			</li>
		</ul>	 
		<div class="align-center" style="clear:both"><p>
			<form:button>등록</form:button>
			<input type="button" value="목록" 
			              onclick="location.href='${pageContext.request.contextPath}/time/selectList.do'">
		</div>                                          
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->