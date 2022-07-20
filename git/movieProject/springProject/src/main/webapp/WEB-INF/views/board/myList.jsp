<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 콘텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
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
<script>
	const alertMessage = "${alert}";
	if (alertMessage == 1) {
		alert("관련 게시물에 권한이 없습니다.");
		location.href="${pageContext.request.contextPath}/board/userQnaList.do"
	}
</script>
<div class="boardMain">
	<div class="board-detail">
		<h3 style="margin:0px 10px;">내 상담내역</h3>
		<div class="c_tab_wrap">
			<ul class="c_tab type_free">
				<li class="on">
					<a href="#" style="font-size: 13px;" title="선택된 탭메뉴">전체</a>
				</li>
			</ul>
		</div>
		<c:if test="${count > 0}">
		<div class="tbl_area">
			<table class="tbl_notice_list">
				<colgroup>
					<col style="width:70px;">
					<col style="width:90px;">
					<col style="auto;">
					<col style="width:100px;">
					<col style="width:90px;">
					<col style="width:80px;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">구분</th>
						<th scope="col" class="tit">제목</th>
						<th scope="col">답변상태</th>
						<th scope="col">등록일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
					
					<c:forEach var="board" items="${list}">
					<tr>
						<td style="display:none;">${board.mem_num}</td>
						<td>${board.board_num}</td>
						<td>[${board.cate_name}]</td>
						<td class="txt"><a href="userQnaView.do?board_num=${board.board_num}">${board.board_title}</a></td>
						<td>${board.board_reg_date}</td>
						<td>${board.board_reg_date}</td>
						<td>${board.board_hit}</td>
					</tr>
					</c:forEach>
					
				</tbody>
			</table>
			<div class="paging">${pagingHtml}</div>
			</div>
			</c:if>
	</div>
</div>