<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/webfont.css" />
<script src="${pageContext.request.contextPath}/resources/css/hyoen.css"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<script type="text/javascript">
	function delete_btn(){
		if(confirm("정말로 삭제하시겠습니까?") == true){
			
			$.ajax({
				url:'deleteMyMovie.do',
				type:'post',
				data:{mem_num:$('#mem_num').val(),reserve_num:$('#reserve_num').val()},
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
					if(param.result == 'success'){
						alert('성공적으로 삭제되었습니다.');
						return;
					}else if(param.result == 'notMatchUser_num'){
						alert('내가 본 영화랑 로그인 된 회원번호가 불일치 합니다.')
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
<!DOCTYPE html>
<div class="cols-content">
	<div class="col-detail">
		<div class="movielog-detail-wrap">
			<div class="sect-movielog-lst">
				<c:if test="${count == 0}">
					내가 본 영화가 없습니다.
				</c:if>
				
				<c:if test="${count >0}">
				<c:forEach var="watchedMovie" items="${list}">
					<ul id="watched_list_container">
						<li class="movie_info_80530">
							<div class="article-movie-info">
								<div class="box-image">
									<a id="phototicket_popup_80530" title="포스터 크게 보기" href="">
										<span class="thumb-image">
										<!-- 영화 포스터 넣어야함(영화 리스트쪽 하시는거보고 확인하자) --> 
										<img alt="" src="${pageContext.request.contextPath}/movie/imageView.do?movie_num=${watchedMovie.movie_num}"
											onerror="errorImage(this)" />
									</span>
									</a>
								</div>
								<div class="box-contents">
								<input style="display:none" id="reserve_num" value="${watchedMovie.reserve_num}">
								<input style="display:none" id="mem_num" value="${member.mem_num}">
									<div class="title">
										<a href=""> <strong
											id="strong_80530">${watchedMovie.movie_name}</strong>
										</a>
									</div>
									<c:set var="MovieDate" value="${watchedMovie.movie_date}"/> 
									<p class="date">${fn:substring(MovieDate,0,10)}
										${reserveMovie.movie_time}</p>
									<p class="theater">CGV${watchedMovie.theater_name}
										/${watchedMovie.seat_num}석</p>
								</div>
								<button type="button"class="btn-del" onclick="delete_btn()">
									<img
										src="https://img.cgv.co.kr/R2014/images/common/btn/btn_del.gif"
										alt="${watchedMovie.movie_name}">
								</button>
								<button type="button" onclick="location.href='${pageContext.request.contextPath}/user/writeReviewForm.do?movie_num=${watchedMovie.movie_num}'">
									리뷰남기기
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
