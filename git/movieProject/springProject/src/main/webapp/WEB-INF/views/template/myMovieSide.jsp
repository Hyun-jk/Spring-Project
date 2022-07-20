<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hyoen.css">
<div class="col-aside">
	<div class="box-round-dgray">
        <div class="box-round-inner">
            <div class="inner-contents-profile">
                <div class="box-image">
                	<div class="thumb-image">
					<c:if test="${!empty member.mem_photo}">
					<span class="profile-mask"><img src="${pageContext.request.contextPath}/user/photoView.do" alt="${member.mem_name}님 프로필 사진"/></span>
					</c:if>
					<c:if test="${empty member.mem_photo}">
					<span class="profile-mask"><img src="${pageContext.request.contextPath}/resources/images/face.png"/></span>
					</c:if>
                    </div>
                </div>
                <div class="box-contents">
	        		<strong>${member.mem_name}님</strong>
	        		<a id="go_edit_page" href="#" class="edit" target="_blank" title="새창열림">나의 정보 변경</a>
	        		<em></em>
	        		
		        </div>
            </div>
        </div>
    </div>
    <div class="box-round-wgray">
        <div class="box-round-inner">
            <div class="inner-contents-log">
                <a href="${pageContext.request.contextPath}/user/myReserveMovie.do">
                    <em></em>
                    <strong>나의 예매 내역</strong>
                </a>
            </div>
        </div>
    </div>
    <div class="box-round-wgray">
        <div class="box-round-inner">
            <div class="inner-contents-log">
                <a href="${pageContext.request.contextPath}/user/myInterestedMovie.do">
                    <em></em>
                    <strong>기대되는 영화</strong>
                </a>
            </div>
        </div>
    </div>
    <div class="box-round-on">
        <div class="box-round-inner">
            <div class="inner-contents-log">
                <a href="${pageContext.request.contextPath}/user/myWatchedMovie.do">
                    <em></em>
                    <strong>내가 본 영화</strong>
                </a>
            </div>
        </div>
    </div>
    <div class="box-round-wgray">
        <div class="box-round-inner">
            <div class="inner-contents-log">
                <a href="${pageContext.request.contextPath}/user/myReview.do">
                    <em></em>
                    <strong>내가 쓴 평점</strong>
                </a>
            </div>
        </div>
    </div>
 </div>  