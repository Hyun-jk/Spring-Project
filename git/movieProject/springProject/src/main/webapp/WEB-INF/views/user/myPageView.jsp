<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<div class="sect-common">
    <div class="mycgv-info-wrap">
		<div class="skipnaiv" >
			<a href="#menu" id="skipPersoninfo">개인화영역 건너띄기</a>
		</div>
        <div class="sect-person-info">
        	<h2 class="hidden">개인화 영역</h2> 
        	<div class="box-image">
				<span class="thumb-image">
					<c:if test="${!empty member.mem_photo}">
					<span class="profile-mask"><img src="${pageContext.request.contextPath}/user/photoView.do" alt="김재현님 프로필 사진"/></span>
					</c:if>
					<c:if test="${empty member.mem_photo}">
					<span class="profile-mask"><img src="${pageContext.request.contextPath}/resources/images/face.png"/></span>
					</c:if>
				</span>
        	</div>
        	<div class="box-contents newtype">
        		<div class="person-info">
        			<strong>${member.id}</strong>
        			<em>${member.mem_name}</em>
        			<button type="button" title="개인정보 수정" onclick="${pageContext.request.contextPath}/user/update.do">나의 정보 변경</button>
        		</div>
        		<div class="grade-info">
        	        
                    <p style="margin-bottom:4px;color: #342929;font-family: 'NanumBarunGothicBold', '맑은 고딕', '돋움', Dotum, sans-serif;font-size: 20px;line-height: 20px;">
                        
                            고객님은   
                        <c:if test="${member.mem_grade < 3}"> 
                        <strong class="txt-purple">브론즈</strong>입니다.             
                        </c:if>
                        <c:if test="${member.mem_grade >= 3}"> 
                        <strong class="txt-purple">실버</strong>입니다.             
                        </c:if>
                        <c:if test="${member.mem_grade >= 5}"> 
                        <strong class="txt-purple">골드</strong>입니다.             
                        </c:if>
                    </p>
        		</div>
        	</div>
        </div>
    </div>
</div>

<div class="sect-mycgv-reserve movielog col3">
    <div class="box-polaroid">
        <div class="box-inner preegg">
            <a href="${pageContext.request.contextPath}/user/myInterestedMovie.do" title="기대되는 영화">
                <h3>기대되는 영화</h3>
                <span>보고 싶은 영화들을 미리 <br>담아두고 싶다면?</span>
            </a>
        </div>
        <div class="box-inner watched">
            <a href="${pageContext.request.contextPath}/user/myWatchedMovie.do" title="내가 본 영화">
                <h3>내가 본 영화</h3>
                <span>관람한 영화들을 한번에 <br />모아 보고 싶다면?</span>
            </a>
        </div>
        <div class="box-inner mvdiary">
            <a href="${pageContext.request.contextPath}/user/myReview.do" title="내가 쓴 평점">
                <h3>내가 쓴 평점</h3>
                <span>관람 후 내 감상평을 적어 <br />추억하고 싶다면?</span>
            </a>
        </div>
    </div>
</div>

<div class="tit-mycgv">
	<h3>MY 예매내역</h3>
	<p>
		<em>0건</em> <a href="/user/mycgv/reserve/">예매내역 더보기</a>
	</p>
	<span>예매번호로만 티켓을 찾을 수 있으니 반드시 확인 부탁드립니다.</span>
</div>

<div class="sect-base-booking">
	<div class="box-polaroid">
		<div class="box-inner">
			<div class="lst-item">고객님의 최근 예매내역이 존재하지 않습니다.</div>
		</div>
	</div>
</div>
<div class="box-inner">
	<div class="tit-mycgv">
		<h3>MY Q&amp;A</h3>
		<p>
			<em>0건</em> <a href="/user/mycgv/inquiry/qna/list.aspx">MY
				Q&amp;A 더보기</a>
		</p>
	</div>
	<div class="col-myqna">
		<ul>
			<li>고객님의 1:1 문의내역이 존재하지 않습니다.</li>
		</ul>
	</div>
</div>

