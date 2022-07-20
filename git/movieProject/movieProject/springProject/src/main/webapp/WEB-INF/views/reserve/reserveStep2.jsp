<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<div id="step-info">
	<div id="step1-info">1.영화 및 극장 선택</div>
	<div id="step2-info" style="background: #ed6e6e; font-weight: bold;">2.좌석 선택</div>
	<div id="step3-info">3.결제</div>
</div>
	
<div style="display: flex; flex-direction: row-reverse;">
	<input type="button" value="예약 선택 초기화" onclick="location.href='reserveStep1.do'">
</div>

<div id="info-banner" style="width: 100%; background: black; height: 150px; margin: 10px 0 10px 0">
	<div class="info-movie">
		<div>
			<c:if test="${empty movie.filename}">
				<img src="${pageContext.request.contextPath}/resources/images/default.png" width="120px" height="130px" style="float:left; margin-right: 20px;" id="movie_photo">
			</c:if>
			<c:if test="${!empty movie.filename}">
				<img src="${pageContext.request.contextPath}/movie/imageView.do?movie_num=${movie.movie_num }" width="120px" height="130px" style="float:left; margin-right: 20px;" id="movie_photo">
			</c:if>
		</div>
		<div id="movie_name" movie_num=${movie.movie_num}>${movie.movie_name}</div>
		<div id="movie_genre">${movie.movie_genre}</div>
		<div id="movie_pg">${movie.movie_pg}</div>
	</div>
	<div class="info-theater">
		<div id="cgv_name" theater_num=${theater.theater_num}>${theater.theater_name}</div>
		<div id="cgv_date" time_num=${time.time_num}>${time.movie_date}</div>
		<div id="cgv_time">${time.movie_time}</div>
	</div>
	<div class="info-people">
		<div id="adult_result" reserve_adult=${reserv.reserve_adult}>성인 | ${reserv.reserve_adult} 명</div>
		<div id="youth_result" reserve_youth=${reserv.reserve_youth}>청소년 | ${reserv.reserve_youth} 명</div>
		<div id="old_result" reserve_old=${reserv.reserve_old}>경로우대 | ${reserv.reserve_old} 명</div>
		<div id="total_result" reserve_price_total=${reserv.reserve_price_total}>총 ${reserv.reserve_people_total}명 | ${reserv.reserve_price_total}원</div>
	</div>
	<div>
		<form action="reserveStep3.do" method="post" id="reserveStep1_form">
			<input type="hidden" name="movie_num" id="movie_num" value="${movie.movie_num}">
			<input type="hidden" name="theater_num" id="theater_num" value="${theater.theater_num}">
			<input type="hidden" name="time_num" id="time_num" value="${time.time_num}">
			<input type="hidden" name="reserve_adult" id="reserve_adult" value="${reserv.reserve_adult}">
			<input type="hidden" name="reserve_youth" id="reserve_youth" value="${reserv.reserve_youth}">
			<input type="hidden" name="reserve_old" id="reserve_old" value="${reserv.reserve_old}">
			<input type="hidden" name="reserve_price_total" id="reserve_price_total" value="${reserv.reserve_price_total}">
			<input type="hidden" name="reserve_seat" id="reserve_seat">
			<input type="hidden" name="seat_num_array" id="seat_num_array">
			<input type="submit" value="결제하기" class="custom-btn btn-7">
		</form> 
	</div>
</div>

<div id="info-message" style="background: #f2f2f2; padding: 10px; margin-bottom: 10px">
	${seat_possable_count} / ${seat_total_count} (예약가능 좌석 / 총 좌석)
	<p>회원님께서 선택한 인원수는 ${reserv.reserve_people_total}명입니다. ${reserv.reserve_people_total}명의 자리를 선택해주세요. </p>
</div>

<div id="seat">
	
	<c:forEach var="seat" items="${seat_list}">
			<span class="seat_detail" style="background: black; color: white; display: inline-block; width: 95px; height: 50px; margin-bottom: 10px;">
				<input style="margin-top: 17px; margin-left: 30px;" type="checkbox" class="seat_select" seat_num="${seat.seat_num}" value="${seat.seat_name}">${seat.seat_name}
			</span>			
		<c:forEach var="reserveseat" items="${reserveseat_list}">
				<c:if test="${reserveseat.seat_num == seat.seat_num}">
					<script type="text/javascript">
						$('input:checkbox').prop("checked",true).prop('disabled', true);
						$('.seat_detail').css('background','#743030');
					</script>
				</c:if>
		</c:forEach>
	</c:forEach>
			
</div>
<script type="text/javascript">
	let reserve_seat = []; // 선택한 예약좌석들을 담는 변수 (A1,A2...)
	let seat_num_array = []; // 좌석번호를 담을 배열
	let count = 0;
	let max_select = 0;
	
	//선택 인원 체크 유효성 검사
	$('input:checkbox').click(function(){
	  
	  count = $('input:checkbox:checked').length; // 체크되어 있는 수 구하기
	  max_select = ${reserv_total_count} + ${reserv.reserve_people_total}; // 이미예약된 인원 수 + 새로 예약 신청하려는 인원 수 
	  
	  if(count>max_select){ // 체크한 수가 체크 가능한 최대 수를 넘는 경우
	   alert(${reserv.reserve_people_total} + '명 까지만 선택 가능합니다.');
	   $(this).prop('checked', false); // 다시 체크 풀기
	  }
	  
	  //정상 체크 하는 경우
	  if(count<=max_select){		  
		  //체크한 좌석번호를 배열 요소 추가
		  seat_num_array.push($(this).attr('seat_num'));
		  
		  //체크한 좌석번호를 다시 체크할 경우 배열 요소 삭제
		  
		  //체크한 좌석명을 배열 요소 추가
		  reserve_seat.push($(this).val());
	  }
	  
	  $('#seat_num_array').val(seat_num_array);
	  $('#reserve_seat').val(reserve_seat);
	 });
	
	
	//결제하기 버튼 클릭 시 (Step3 로 가기 위한 유효성 검사)
	$('#reserveStep1_form').submit(function(){
		if(count != max_select || count == 0 || max_select == 0){
			alert('좌석을 선택해주세요.');
			return false;			
		}
	});

</script>
<!-- 중앙 컨텐츠 끝 -->