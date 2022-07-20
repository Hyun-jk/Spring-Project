<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- 상단 시작 -->

<div class="header">	
            <!-- 서비스 메뉴 --> 
            
<div class="main_header">
<div class="contents">
        <h1 onclick=""><a href="${pageContext.request.contextPath}/main/main.do"><img src="https://img.cgv.co.kr/R2014/images/common/logo/logoRed.png" alt="CGV" /></a><span>CULTUREPLEX</span></h1>
        <ul class="memberInfo_wrap">
			
			<c:if test="${!empty user_num && !empty user_photo}">
    		<img src="${pageContext.request.contextPath}/user/photoView.do" 
    	                        width="50" height="50" class="my-photo">
    		</c:if>
    		<c:if test="${!empty user_num && empty user_photo}">
    		<img src="${pageContext.request.contextPath}/resources/images/face.png" 
    	                        width="50" height="50" class="my-photo">
    		</c:if>
			
            <c:if test="${empty user_num}">
            <li><a href="${pageContext.request.contextPath}/user/login.do?returnURL=https%3a%2f%2fwww.cgv.co.kr%2fdefault.aspx"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png" alt="로그인" /><span>로그인</span></a></li>
            <li><a href="${pageContext.request.contextPath}/user/memberRegister.do"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginJoin.png" alt="회원가입" /><span>회원가입</span></a></li>
            </c:if>
            <c:if test="${!empty user_num}">
             <li class="header_id">${user_id}</li>
			<a href="${pageContext.request.contextPath}/user/logout.do"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png" alt="로그아웃" />로그아웃</a>
            </c:if>
            <c:if test="${!empty user_num && user_auth == 1}">
            <li><a href="${pageContext.request.contextPath}/user/myPage.do"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png" alt="MY CGV" /><span>MY CGV</span></a></li>
            </c:if>
            <c:if test="${!empty user_num && user_auth == 3}">
			<li><a href="${pageContext.request.contextPath}/admin/adminPage.do"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png" alt="회원관리" /><span>회원관리</span></a></li>	
			</c:if>
            <li><a href="${pageContext.request.contextPath}/board/boardMain.do"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginCustomer.png" alt="고객센터" /><span>고객센터</span></a></li>
        </ul>
        </div>
</div>
</div>

<!-- 상단 끝 -->