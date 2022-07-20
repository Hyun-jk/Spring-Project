<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
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
   <h2>박스오피스</h2>
   <span>총30건</span>
   <hr>
   <c:if test="${count == 0}">
   <div class="result-display">표시할 게시물이 없습니다.</div>
   </c:if>
   <c:if test="${count > 0}">
   
   <div class="image-cine">
      <c:forEach var="box" items="${list}" end="29" varStatus="status">
      <div class="horizontal-area">
         <h3 style="background:#fb4357; color:white; text-align:center; border-radius:5px;">No.${status.count}</h3>
         <img src="${box.url}">
         <p>
            <span style="font-weight:bold; font-size:14px;">${box.title}</span><br>
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