<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script src="${pageContext.request.contextPath}/resources/css/hyoen.css"></script>   
<!DOCTYPE html>
<style>
li #btn-del img{
	width: 30px;
    margin-left: -31px;
    position: relative;
}
.movie_reserve {
    font-weight: normal;
    width: 50px;
    padding: 1px 55px;
    font-size: 15px;
    background: #ed3124;
    border-radius: 7px;
    color:white;
}
strong {
    font-weight: 500;
    color: black;
}
a:link {
    text-decoration: none;
    color: white;
}

</style>
<div class="sect-wishlist-lst">
	<c:if test="${count == 0}">
		관심이 있는 영화가 없습니다.
	</c:if>
	<c:if test="${count > 0}">
		<ul id="wishlist_container">
			<c:forEach var="watchedMovie" items="${list}">
				<li>
					<div class="box-image">
						<span
							class="thumb-image"> <img 
								src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85673/85673_185.jpg"
								onerror="errorImage(this)" />
						</span>
					</div>
					<br>
					<div class="box-contents">
						<a href="/movies/detail-view/?midx=85673"> <strong
							class="title">${watchedMovie.movie_name}</strong>
							<br><br>
						</a> <span class="movie_reserve"> <a class="link-reservation"
							href="/ticket/?MOVIE_CD=20028988&MOVIE_CD_GROUP=20028988">예매하기</a>
						</span>
					</div>
				</li>
				<li id="btn-del">
					<button type="button" class="btn-del" id="btn-del">
						<img src="https://img.cgv.co.kr/R2014/images/common/btn/btn_del02.png"/>
					</button>
				</li>
			</c:forEach>
		</ul>
	</c:if>
</div>
<br><br><br><br><br><br><br>
<div class="align-center">${pagingHtml}</div>
