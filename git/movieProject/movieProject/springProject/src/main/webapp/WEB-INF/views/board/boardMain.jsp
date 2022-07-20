<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>

<div class="boardMain">
	<div class="board-detail">
	<div class="c_check_warp">
		<div class="c_box qna_search">
			<strong class="c_tit">자주찾는 질문 빠른검색</strong>
			<br>
			<form action="qnaList.do" style="width: auto;margin: 0 auto;border: none;padding: 0;" method="get">
			<div class="board_search_box">
				<select style="display:none" name="keyfield" id="keyfield">
				<option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>제목+내용</option>
				</select>
				<input id="searchtext" name="keyword" type="search" value="${param.keyword}" title="검색어 입력" placeholder="검색어를 입력해 주세요.">
				<button type="submit" class="btn_search" title="검색하기" id="btn_search">검색</button>
			</div>
			</form>
		</div>
		<div class="c_box inquiry" style="cursor:pointer;">
			<strong class="c_tit">건의 및 문의사항</strong>
			<span class="c_txt">건의 및 문의사항을 전달해 주세요.</span>
			<c:if test="${!empty user_num && user_auth == 1 or user_auth == 3}">
			<a href="${pageContext.request.contextPath}/board/userBoardWrite.do">글쓰기</a>
			</c:if>
			<c:if test="${empty user_num}">
			<a href="${pageContext.request.contextPath}/user/login.do">로그인 후 사용</a>
			</c:if>
		</div>
		<div class="c_box my_advice" style="cursor:pointer;">
			<strong class="c_tit">내 상담내역 확인</strong>
			<span class="c_txt">문의하신 내용을 확인하실 수 있습니다.</span>
			<c:if test="${!empty user_num && user_auth == 1 or user_auth == 3}">
			<a href="${pageContext.request.contextPath}/board/myList.do?mem_num=${board.mem_num}">내역 조회</a>
			</c:if>
			<c:if test="${empty user_num}">
			<a href="${pageContext.request.contextPath}/user/login.do">로그인 후 사용</a>
			</c:if>
		</div>
	</div>
	<div class="customer_notice_area">
		<div class="notice_area">	
			<div class="notice_detail" style="marging:none; padding:none;">
			<a class="c1_tit" href="${pageContext.request.contextPath}/board/newsList.do">
				<span class="tit">공지/뉴스</span>
			</a>
			
			<!-- 공지/ 뉴스 카테고리만 뜨게끔 수정해야함. -->
			<c:forEach var="board" items="${list}" begin="0" end="4" step="1" varStatus="status">
			
			<ul class="txt">
				<li>
					<p style="display:none">${status.index}</p>
					<a  class="c1_txt" href="qnaDetail.do?board_num=${board.board_num}">[${board.cate_name}] ${board.board_title}</a>
					<span class="c1_txt">${board.board_reg_date}</span>
					
				</li>
			</ul>
		
			</c:forEach>
			</div>
		</div>
	</div>
	</div>
</div>
<!-- 중앙컨텐츠 끝 -->
