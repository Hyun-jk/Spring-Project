<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/movie.review.js"></script> --%>
<script>
var divCd = 0;
function like() {
    document.getElementById("like_movie").src = "${pageContext.request.contextPath}/resources/images/like.png";}
$( document ).ready(function() {
	$(".star_rating a").click(function() {
	    $(this).parent().children("a").removeClass("on");
	    $(this).addClass("on").prevAll("a").addClass("on");
	    return false;
	});
});

function clickLike(likeYn){
	var my_movie_num = $("#my_movie_num").val();
	var imgUrl = ""; 
	var likeCnt = Number($("#likeCnt").text());
	$.ajax({
		url:'clickLike.do',
		type:'post',
		data:{  movie_num : $('#movie_num').val(), my_movie_num : my_movie_num },
		dataType:'json',
		cache:false,
		timeout:30000,
		success:function(param){
			divCd = param.divCd;
			if(divCd === 1){
				alert('좋아요 되었습니다.');
				imgUrl = "${pageContext.request.contextPath}/resources/images/like.png";
				document.getElementById("like_movie").src = imgUrl;
				
				likeCnt = likeCnt + 1;
				
			}else{
				alert('좋아요 취소 되었습니다.');
				imgUrl = "${pageContext.request.contextPath}/resources/images/likedefault.png";
				document.getElementById("like_movie").src = imgUrl;
				
				
				likeCnt = likeCnt - 1;
			}
			$("#likeCnt").text(likeCnt);
		},
		error:function(param){
			alert('네트워크 오류 발생');
		}
	});
}

</script>
<p class="movie_img"><img src="imageView.do?movie_num=${movie.movie_num}" style="width:185px; height:260px;"></p>
	<div class="movie_info">
	<p class="detail_name">${movie.movie_name}</p>
	
	<c:if test="${movie.movie_auth == 0}">
			<span class="auth_result">상영중</span></c:if>
	<c:if test="${movie.movie_auth == 1}">
			<span class="auth_result">상영 예정</span></c:if> 
	<c:if test="${movie.movie_auth == 2}">
			<span class="auth_result">상영 종료</span></c:if>
	<%-- <button type="button" onclick="alert('${movie.movie_name} 영화가 좋아요 되었습니다.\n * 상단  MY CGV에서 확인 가능합니다.'),like()" style="background-color:transparent; border:0;"><img id="like_movie" src="${pageContext.request.contextPath}/resources/images/likedefault.png" style="width:25px; height:25px; margin-left: 5px;"></button> --%>
	<button type="button" onclick="clickLike();" style="background-color:transparent; border:0;">
		<c:if test="${0 eq movie.my_movie_num}">
			<img id="like_movie" src="${pageContext.request.contextPath}/resources/images/likedefault.png" style="width:25px; height:25px; margin-left: 5px;">
		</c:if>
		<c:if test="${0 ne movie.my_movie_num}">
			<img id="like_movie" src="${pageContext.request.contextPath}/resources/images/like.png" style="width:25px; height:25px; margin-left: 5px;">		
		</c:if>
	</button>
	<input type="hidden" id="my_movie_num" value="${movie.my_movie_num}">
	<input type="hidden" id="contextPath" value="${pageContext.request.contextPath}">
	<p id="likeCnt" style="font-weight: bold;">${movie.likeCnt}</p>
</div>
	<p style="font-size:20px; margin-top: 5px; width: 29%; text-align: center;">${movie.movie_showtm}분</p>
<hr>
<div class="page-main">
	<p class="movie_contents">${movie.movie_content}</p>
	<a class="detail_reserve" href="/project/reserve/reserveStep1.do">예매하기</a>
	<p>첨부파일 : <a href="file.do?movie_num=${movie.movie_num}">${movie.filename}</a></p>
	<c:if test="${fn:endsWith(movie.filename,'.jpg') ||
	              fn:endsWith(movie.filename,'.JPG') ||
	              fn:endsWith(movie.filename,'.gif') ||
	              fn:endsWith(movie.filename,'.GIF') ||
	              fn:endsWith(movie.filename,'.png') ||
	              fn:endsWith(movie.filename,'.PNG')}">
	</c:if>
</div>
	<hr size="1" width="100%" noshade="noshade">
	<div class="align-right">
		<c:if test="${!empty user_num && user_auth == 3}">
		<input type="button" value="수정" onclick="location.href='movieUpdate.do?movie_num=${movie.movie_num}'"> 
		<input type="button" value="삭제" id="delete_btn"> 
		<script type="text/javascript">
			let delete_btn = document.getElementById('delete_btn');
			delete_btn.onclick=function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
					location.replace('movieDelete.do?movie_num=${movie.movie_num}');
				}
			};
		</script>
		</c:if>
		<input type="button" value="목록" onclick="location.href='movieChart.do'">
	</div>
	<hr size="1" width="100%" noshade="noshade">
	<div id="reply_div">
		<span class="re-title">리뷰 달기</span>
		<form id="re_form">
			<input type="hidden" name="movie_num" 
			                 value="${movie.movie_num}" id="movie_num">
<p class="star_rating">
    <a href="#" class="on">★</a>
    <a href="#" class="on">★</a>
    <a href="#" class="on">★</a>
    <a href="#" class="on">★</a>
    <a href="#" class="on">★</a>
</p>
			<textarea rows="3" cols="50" name="review_content"
			         id="review_content" class="rep-content"
			         <c:if test="${empty user_num}">disabled="disabled"</c:if>
			         ><c:if test="${empty user_num}">로그인해야 작성할 수 있습니다.</c:if></textarea>                 
			<c:if test="${!empty user_num}">
			<div id="re_first">
				<span class="letter-count">300/300</span>
			</div>
			<div id="re_second" class="align-right">
				<input type="submit" value="전송">
			</div>
			</c:if>
		</form>
	</div>
	<!-- 댓글 목록 출력 -->
	<div id="output"></div>
	<div class="paging-button" style="display:none;">
		<input type="button" value="다음글 보기">
	</div>
	<div id="loading" style="display:none;">
		<img src="${pageContext.request.contextPath}/resources/images/ajax-loader.gif">
	</div>
<!-- 중앙 컨텐츠 끝 -->