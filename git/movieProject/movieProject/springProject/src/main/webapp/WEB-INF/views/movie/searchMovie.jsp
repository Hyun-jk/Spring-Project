<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<style>
.image-cine .horizontal-area{
   margin:2px;
   padding:3px;
   width:180px;
   height:370px;
   float:left;
   overflow:hidden;
}
.image-cine .horizontal-area img{
   width:175px;
   height:250px;
}
.image-cine .horizontal-area span{
   padding:5px;
   margin:5px;
}
.image-cine .float-clear{
   clear:both;
}
</style> 
<div class="page-main">
   <h2>검색 결과 ${keyword}입니다</h2>
   <span>총${count}건</span>
   <hr>
   <c:if test="${count == 0}">
   <div class="result-display">검색 결과가 없습니다.</div>
   </c:if>
   <c:if test="${count > 0}">
   
   <div class="image-cine">
      <c:forEach var="rearchResult" items="${list}" end="29" varStatus="status">
      <div class="horizontal-area">
         <img src="imageView.do?movie_num=${rearchResult.movie_num}">
         <p>
            <span style="font-weight:bold; font-size:14px;">${rearchResult.movie_name}</span><br>
         <h3 style="background:#fb4357; color:white; text-align:center; border-radius:5px;"><a href="${pageContext.request.contextPath}/reserve/reserveStep1.do">예매하기</a></h3>
            <c:if test="${box.count != 'None'}">
            <span>${box.count}</span>
            </c:if>
         </p>
      </div>
      </c:forEach>
      <div class="float-clear">
         <hr width="100%" size="1" noshade="noshade">
      </div>
   </div>
   </c:if>
</div>