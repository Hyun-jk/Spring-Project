<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hyoen.css">
<!DOCTYPE html>
<div class="cols-content" id="menu">
	<div class="col-aside">
		<div class="skipnaiv">
			<a href="#mycgv_contents" id="skipMycgvMenu">MYCGV 서브메뉴 건너띄기</a>
		</div>
		<h2>MY CGV 서브메뉴</h2>
		<div class="snb">
			<ul>
				<li class="on"><a href="${pageContext.request.contextPath}/user/myPage.do" title="현재 선택">MY
						CGV HOME <i></i>
				</a></li>
				<li><a href="/user/mycgv/reserve/?g=1">나의 예매내역 <i></i></a></li>

				<li><a href="/user/mycgv/myinfo/?g=1">회원정보<i></i></a>
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/user/update.do">개인정보
								변경</a></li>

						<li><a href="${pageContext.request.contextPath}/user/delete.do">회원탈퇴</a>
						</li>

					</ul></li>

				<li><a href="/user/mycgv/inquiry/qna/list.aspx?g=1">나의
						문의내역 <i></i>
				</a>
					<ul>
						<li><a href="/user/mycgv/inquiry/qna/list.aspx?g=1">1:1
								문의</a></li>
					</ul></li>
				<li class="my-event"><a href="/user/movielog/watched.aspx">내가
						본 영화</a></li>
				<!-- <li class="my-event"><a href="/user/mycgv/event/?g=1">나의 참여 이벤트</a></li> -->
			</ul>
			<div class="ad-partner01">
				<iframe
					src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@M_Rectangle"
					width="160" height="300" title="" frameborder="0" scrolling="no"
					marginwidth="0" marginheight="0" id="M_Rectangle"></iframe>
			</div>
			<div class="ad-partner02">
				<iframe
					src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@Image_text"
					width="160" height="35" title="" frameborder="0" scrolling="no"
					marginwidth="0" marginheight="0" id="Image_text"></iframe>
			</div>
		</div>
	</div>
</div>

