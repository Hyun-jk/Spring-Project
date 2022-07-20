<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 중앙 컨텐츠 시작 -->
<style>
table{
	width:100%;
	border:none;
	border-collapse:collapse;
}
table td, table th{
	border:none;
	padding:5px;
}
</style>

<div class="page-main">
	<h2>회원정보 리스트</h2>
	<form action="adminPage.do" id="search_form" method="get" class="adminForm1">
		<ul class="search">
			<li>
				<select name="keyfield" id="keyfield" class="select-height">
					<option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>정지회원</option>
					<option value="2" <c:if test="${param.keyfield == 2}">selected</c:if>>일반회원</option>
					<option value="3" <c:if test="${param.keyfield == 3}">selected</c:if>>관리자</option>
				</select>
			</li>
			<li>
				<input type="search" name="keyword" id="keyword" class="ad_input" value="${param.keyword }">
			</li>
			<li>
				<input type="submit" value="검색" class="round inblack">
				<input type="button" value="목록" class="round inwhite1" onclick="location.href='adminPage.do'">
			</li>
		</ul>
	</form>
	<c:if test="${count == 0 }">
	<div class="result-display">회원정보가 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<div class="tbl_area1">
	<table class="tbl_notice_list">
		<colgroup>
			<col style="width:70px;">
			<col style="auto;">
			<col style="width:120px;">
			<col style="width:140px;">
			<col style="width:120px;">
		</colgroup>
		<thead>
		<tr>
			<th>회원번호</th>
			<th>회원 아이디</th>
			<th>이름</th>
			<th>주소</th>
			<th>회원정보</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="member" items="${list}">
		<tr>
			<td>${member.mem_num}</td>
			<td>${member.id}</td>
			<td>${member.mem_name}</td>
			<td>${member.mem_address}</td>
			<c:if test="${member.auth == 0}">
			<td>정지회원</td>
			</c:if>
			<c:if test="${member.auth == 1}">
			<td>일반회원</td>
			</c:if>
			<c:if test="${member.auth == 2}">
			<td>탈퇴회원</td>
			</c:if>
			<c:if test="${member.auth == 3}">
			<td>관리자</td>
			</c:if>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="paging">${pagingHtml}</div>
	</div>
	</c:if>
</div>
<!-- 중앙 컨텐츠 끝-->










