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
    font-size: 3em; /* 이모지 크기 */
    color: transparent; /* 기존 이모지 컬러 제거 */
    text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
}
#myform label:hover{
    text-shadow: 0 0 0 #a00; /* 마우스 호버 */
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 #a00; /* 마우스 호버 뒤에오는 이모지들 */
}
#myform fieldset legend{
    text-align: left;
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 #a00; /* 마우스 클릭 체크 */
}
</style>
<!DOCTYPE html>
<form name="moviewReviewVO" id="myform" method="post" action="writeReview.do">
    <fieldset>
        <legend>이모지 별점</legend>
        <input type="radio" name="review_rate" value="5" id="rate1"><label for="rate1">⭐</label>
        <input type="radio" name="review_rate" value="4" id="rate2"><label for="rate2">⭐</label>
        <input type="radio" name="review_rate" value="3" id="rate3"><label for="rate3">⭐</label>
        <input type="radio" name="review_rate" value="2" id="rate4"><label for="rate4">⭐</label>
        <input type="radio" name="review_rate" value="1" id="rate5"><label for="rate5">⭐</label>
    	<textarea name="review_content"></textarea>
    </fieldset>
    <div>
    	<input type="submit" value="전송">
    </div>
</form>
