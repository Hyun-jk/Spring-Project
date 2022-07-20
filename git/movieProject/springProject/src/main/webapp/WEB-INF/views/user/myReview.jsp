<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script src="${pageContext.request.contextPath}/resources/css/hyoen.css"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>      
<!DOCTYPE html>
<script type="text/javascript">
	function delete_btn(){
		if(confirm("리뷰를 삭제하시겠습니까?") == true){
			$.ajax({
				url:'deleteMyReview.do',
				type:'post',
				data:{mem_num:$('#mem_num').val(),review_num:$('#review_num').val()},
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
					if(param.result == 'success'){
						alert('성공적으로 삭제되었습니다.');
						return;
					}else if(param.result == 'notMatchUser_num'){
						alert('리뷰 작성자와 로그인 된 회원이 불일치 합니다.')
					}else{
						alert('삭제오류')
					}
				},
				error:function(){
					alert('네트워크 오류 발생');
				}
			});
		}else{
			alert('취소되었습니다.');
		}
	}
</script>
<div class="cols-content">
	<div class="col-detail">
		<div class="movielog-detail-wrap">
			<div class="sect-movielog-lst">
				<c:if test="${count == 0}">
					리뷰한 내용이 없습니다.
				</c:if>
				
				<c:if test="${count >0}">
				<c:forEach var="myReview" items="${list}">
					<ul id="watched_list_container">
						<li class="movie_info_80530">
							<div class="article-movie-info">
								<div class="box-image">
									<a id="phototicket_popup_80530" title="포스터 크게 보기" href="">
										<span class="thumb-image">
										<!-- 영화 포스터 넣어야함(영화 리스트쪽 하시는거보고 확인하자) --> 
										<img alt="" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000080/80530/80530_185.jpg"
											onerror="errorImage(this)" />
									</span>
									</a>
								</div>
								<div class="box-contents">
								<input style="display:none" id="review_num" value="${myReview.review_num}">
								<input style="display:none" id="mem_num" value="${myReview.mem_num}">
									<div class="title">
										<a href=""> <strong
											id="strong_80530">${myReview.movie_name}</strong>
										</a>
									</div>

									<p class="date">${myReview.review_reg_date}</p>
									<p class="theater">CGV${watchedMovie.theater_name}
										/${myReview.review_rate}점</p>
									<p>"${myReview.review_content}"</p>
								</div>
								<button type="button" class="btn-del" onclick="delete_btn()">
									<img
										src="https://img.cgv.co.kr/R2014/images/common/btn/btn_del.gif"
										alt="${myReview.movie_name}">
								</button>
								<button type="button" onclick="location.href='${pageContext.request.contextPath}/user/modifyReviewForm.do?review_num=${myReview.review_num}'">
									수정하기
								</button>
							</div>
						</li>
					</ul>
				</c:forEach>
				</c:if>	
			</div>
			<div class="align-center">${pagingHtml}</div>
		</div>
	</div>
</div>
