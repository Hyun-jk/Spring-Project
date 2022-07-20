<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 콘텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>

<script>
	$(window).ready(function(){
		console.log("2");
	});
</script>
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
		<h3 style="margin:0px 10px;">자주찾는 질문</h3>
		<form action="qnaList.do" class="search123" id="search_form" method="get">
		<div class="search_area">
			<select style="display:none" name="keyfield" id="keyfield">
				<option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>제목+내용</option>
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
					<a href="/project/board/qnaList.do?cate_num=0" style="font-size: 13px;" title="선택된 탭메뉴">전체</a>
				</li>
				<li>
					<a href="/project/board/qnaList.do?cate_num=1" style="font-size: 13px;">예매/매표</a>
				</li>
				<li>
					<a href="/project/board/qnaList.do?cate_num=2" style="font-size: 13px;">결제수단</a>
				</li>
				<li>
					<a href="/project/board/qnaList.do?cate_num=3" style="font-size: 13px;">멤버쉽</a>
				</li>
				<li>
					<a href="/project/board/qnaList.do?cate_num=4" style="font-size: 13px;">영화관이용</a>
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
					<col style="width:40px;">
					<col style="width:120px;">
					<col style="width:560px;">
					<col style="auto;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">구분</th>
						<th scope="col" class="tit">제목</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="board" varStatus="status">
						<%-- <c:if test="${board.cate_num eq 1 or board.cate_num eq 2 or board.cate_num eq 3 or board.cate_num eq 4}"> --%>
						<tr>
							<td>${board.board_num}</td>
							<td>[${board.cate_name}]</td>
							<td class="txt"><a href="qnaDetail.do?board_num=${board.board_num}">${board.board_title}</a></td>
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