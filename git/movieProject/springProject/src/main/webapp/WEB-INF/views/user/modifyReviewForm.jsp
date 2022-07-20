<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
#myform fieldset{
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    direction: ltr;
    border: 0; /* 필드셋 테두리 제거 */
}
#myform input[type=radio]{
    display: none; /* 라디오박스 감춤 */
}
#myform label{
	float:right; /* 데이터 오류 시 수정 필요 - 소진 */
    font-size: 2em; /* 이모지 크기 */
    color: transparent; /* 기존 이모지 컬러 제거 */
    text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
}
#myform label:hover{
    text-shadow: 0 0 0 #fc0; /* 마우스 호버 */
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 #fc0; /* 마우스 호버 뒤에오는 이모지들 */
}
#myform fieldset legend{
    text-align: left;
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 #fc0; /* 마우스 클릭 체크 */
}
</style>
<!DOCTYPE html>
<form name="moviewReviewVO" id="myform" method="post" action="modifyReview.do" style="width:100%; height:450px; margin-top: 30px; text-align:center; position:relative;">
	<p style="float: left; font-size: 25px; color: black;">평점 작성</p>
	<p style="position: absolute;top: 20%;left: 33%;font-weight: bold;font-size: 17px;">여기에 영화제목이 나오면 좋을 것 같아요</p>
	<div class="review_form" style="position:absolute; top:30%; left:30%;">
    <fieldset>
    	<input type=hidden name="review_num" value="${movieReviewVO.review_num}">
        <input type=hidden name="movie_num" value="${movieReviewVO.movie_num}">
        <legend>영화평점</legend>
        <div class="review_rate" style="float:left; margin-bottom: 10px;">
        <input type="radio" name="review_rate" value="5" id="rate1"><label for="rate1">⭐</label>
        <input type="radio" name="review_rate" value="4" id="rate2"><label for="rate2">⭐</label>
        <input type="radio" name="review_rate" value="3" id="rate3"><label for="rate3">⭐</label>
        <input type="radio" name="review_rate" value="2" id="rate4"><label for="rate4">⭐</label>
        <input type="radio" name="review_rate" value="1" id="rate5"><label for="rate5">⭐</label>
        </div>
    	<br>
    	<textarea name="review_content" style="width:300px; height:100px; font-size:15px;">${movieReviewVO.review_content}</textarea>
    </fieldset>
    <div style="width: 20%; height: 20px; float: right; margin-top: 10px; font-size:15px;">
    	<input type="submit" value="전송">
    </div>
    <hr>
    <p style="    position: absolute; top: 100%; margin-top: 30px; width: 330px;">
         올바른 커뮤니티를 지향하기 위하여 운영원칙에 어긋나는<br>
         게시물로 판단되는 글은 적발 시, 경고 없이 삭제되며<br> 아이디 중지 등의
	제재 조치를 받을 수 있습니다.<br>
	건전한 인터넷 문화를 지향합니다.</p>
    </div>
</form>
