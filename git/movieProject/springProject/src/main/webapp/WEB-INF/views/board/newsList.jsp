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
<div class="boardMain">
	<div class="board-detail">
		<h3 style="margin:0px 10px;">공지/뉴스</h3>
		<form action="newsList.do" id="search_form" method="get">
		<div class="search_area">
			<select name="keyfield" id="keyfield" class="c_select" style="width:100px;">
				<option value="2" <c:if test="${param.keyfield == 2}">selected</c:if>>제목</option>
				<option value="3" <c:if test="${param.keyfield == 3}">selected</c:if>>내용</option>
			</select>
			<input id="keyword" name="keyword" value="${param.keyword}" type="search" class="c_input" title="검색어 입력" placeholder="검색어를 입력해 주세요" style="width:275px;">
			<button type="submit" class="round inblack" title="검색하기" id="btn_search">
				<span>검색하기</span>
			</button>
		</div>
		</form>
		<div class="c_tab_wrap">
			<ul class="c_tab type_free">
				<li class="on">
					<a href="/project/board/newsList.do?cate_num=20" style="font-size: 13px;" title="선택된 탭메뉴">전체</a>
				</li>
				<li>
					<a href="/project/board/newsList.do?cate_num=5" style="font-size: 13px; width: 87px;">시스템점검</a>
				</li>
				<li class>
					<a href="/project/board/newsList.do?cate_num=6" style="font-size: 13px;">극장</a>
				</li>
				<li class>
					<a href="/project/board/newsList.do?cate_num=7" style="font-size: 13px;">기타</a>
				</li>
			</ul>
		</div>
		<c:if test="${count == 0}">
		<div class="result-display">표시할 게시물이 없습니다.</div>
		</c:if>
		<c:if test="${count > 0}">
		<div class="tbl_area">
			<table class="tbl_notice_list">
				<colgroup>
					<col style="width:70px;">
					<col style="width:120px;">
					<col style="auto;">
					<col style="width:140px;">
					<col style="width:120px;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">구분</th>
						<th scope="col" class="tit">제목</th>
						<th scope="col">등록일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
					
					<c:forEach var="board" items="${list}" varStatus="status">
					<%-- <c:if test="${board.cate_num eq 5 or board.cate_num eq 6 or board.cate_num eq 7}"> --%>
					<tr>
						<td>${board.board_num}</td>
						<td>[${board.cate_name}]</td>
						<td class="txt"><a href="qnaDetail.do?board_num=${board.board_num}">${board.board_title}</a></td>
						<td>${board.board_reg_date}</td>
						<td>${board.board_hit}</td>
					</tr>
					<%-- </c:if> --%>
					</c:forEach>
					
				</tbody>
			</table>
			<div class="paging">${pagingHtml}</div>
			</div>
			</c:if>
	</div>
</div>








































