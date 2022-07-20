<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#search_form').submit(function(){
			if($('#keyword').val().trim()==''){
				alert('검색어를 입력하세요!');
				$('#keyword').val('').focus();
				return false;
			}
		});
	});
</script>
<!-- 상단 메뉴 시작 -->
<ul>
	<li><a href="${pageContext.request.contextPath}/movie/movieChart.do">영화</a></li>
	<li><a href="${pageContext.request.contextPath}/time/selectList.do">극장</a></li>
	<li><a href="${pageContext.request.contextPath}/reserve/reserveStep1.do">예매</a></li>
	<li><a href="${pageContext.request.contextPath}/movie/boxoffice.do">박스오피스</a></li>
	<li>
        <div class="search_box">
        <form action="${pageContext.request.contextPath}/movie/searchMovie.do" id="search_form" method="get">
          <input type="search" maxlength="225" placeholder="스텔라" onfocus="this.placeholder=''" onblur="this.placeholder='스텔라'" id="keyword" name="keyword" value="${param.keyword}"/>
          <input type="submit" value="검색">
         </form>
        </div>
    </li>
</ul>
<!-- 상단 메뉴 끝 -->