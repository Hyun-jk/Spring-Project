<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<div id="step-info">
	<div id="step1-info">1.영화 및 극장 선택</div>
	<div id="step2-info">2.좌석 선택</div>
	<div id="step3-info" style="background: #ed6e6e; font-weight: bold;">3.결제</div>
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
		<div id="cgv_seat">${reserv.reserve_seat}</div>
	</div>
	<div class="info-people">
		<div id="adult_result" reserve_adult=${reserv.reserve_adult}>성인 | ${reserv.reserve_adult} 명</div>
		<div id="youth_result" reserve_youth=${reserv.reserve_youth}>청소년 | ${reserv.reserve_youth} 명</div>
		<div id="old_result" reserve_old=${reserv.reserve_old}>경로우대 | ${reserv.reserve_old} 명</div>
		<div id="total_result" reserve_price_total=${reserv.reserve_price_total}>합계 | ${reserv.reserve_price_total}원</div>
		<div id="kakaopay" style="padding-top: 10px;"><img src="${pageContext.request.contextPath}/resources/images/kakao.png" width="50px"></div>
	</div>
	<div>
		<form action="reserveconfirm.do" method="post" id="reserveStep1_form" style="display:none;">
			<input type="hidden" name="movie_num" id="movie_num" value="${movie.movie_num}">
			<input type="hidden" name="theater_num" id="theater_num" value="${theater.theater_num}">
			<input type="hidden" name="time_num" id="time_num" value="${time.time_num}">
			<input type="hidden" name="reserve_adult" id="reserve_adult" value="${reserv.reserve_adult}">
			<input type="hidden" name="reserve_youth" id="reserve_youth" value="${reserv.reserve_youth}">
			<input type="hidden" name="reserve_old" id="reserve_old" value="${reserv.reserve_old}">
			<input type="hidden" name="reserve_price_total" id="reserve_price_total" value="${reserv.reserve_price_total}">
			<input type="hidden" name="reserve_seat" id="reserve_seat" value="${reserv.reserve_seat}">
			<input type="hidden" name="seat_num_array" id="seat_num_array" value="${reserv.seat_num_array}">
			<input type="hidden" name="sale_price" id="sale_price">
			<input type="hidden" name="final_price" id="final_price">
			<input type="submit" value="결제하기">
		</form> 
	</div>
</div>

<div id="info-message" style="background: #f2f2f2; padding: 10px; margin-bottom: 10px">
	<div>${member.mem_name}님은 
		<c:if test="${member.mem_grade == 0}">브론즈</c:if>
		<c:if test="${member.mem_grade == 1}">실버</c:if>
		<c:if test="${member.mem_grade == 2}">골드</c:if>등급으로 
		<c:if test="${member.mem_grade == 0}"><span id="grade_sale_price">1000</span></c:if>
		<c:if test="${member.mem_grade == 1}"><span id="grade_sale_price">2000</span></c:if>
		<c:if test="${member.mem_grade == 2}"><span id="grade_sale_price">3000</span></c:if> 원 할인 혜택을 받으실 수 있습니다.
	</div>
</div>

<hr width="100%">
<table>
	<tr>
		<th>결제하실 금액</th>
		<th>총 할인 금액</th>
		<th>최종결제 금액</th>
		<th>결제 방법</th>
	</tr>
	<tr>
		<td style="text-align:center;" id="original_price">${reserv.reserve_price_total}</td>
		<td style="text-align:center;" id="sale_price_info"></td>
		<td style="text-align:center;" id="final_price_info"></td>
	</tr>
</table>



<script type="text/javascript">
	$('#sale_price_info').text($('#grade_sale_price').text());
	$('#final_price_info').text($('#original_price').text()-$('#sale_price_info').text());
	$('#sale_price').val($('#sale_price_info').text());
	$('#final_price').val($('#final_price_info').text());
	
	let name = '${movie.movie_name}';
	let amount = $('#final_price').val();
	let email = '${member.mem_email}';
	let mem_name = '${member.mem_name}';
	let phone = '${member.mem_phone}';
    let address = '${member.mem_address}';
    let zipcode = '${member.mem_zipcode}';
	
    $('#kakaopay').click(function(){
    	iamport();
    });
    
    function iamport(){
    	//아임포트 API
		IMP.init('imp27697868');
		IMP.request_pay({
		    pg : 'kakaopay',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : name, //결제창에서 보여질 이름
		    amount : amount, //실제 결제되는 가격
		    buyer_email : email,
		    buyer_name : mem_name,
		    buyer_tel : phone,
		    buyer_addr : address,
		    buyer_postcode : zipcode,
		}, function(rsp) {
			console.log(rsp);
		    if ( rsp.success ) {
		    	alert('결제완료');
		    	
		    	$("#reserveStep1_form").submit();
		      	
		    	//결제 완료 후 예매완료 페이지로 이동
			    //window.location.href = 'http://localhost:8080/project/reserve/reserveconfirm.do';
		    } else {
		    	alert('결제실패');
		    }
		    
		});
    }
    
	//결제하기 버튼 클릭 시 
	//$('#reserveStep1_form').submit(function(){		
		
	//}); // end of submit (결제하기 버튼 클릭 시)
	
</script>

<!-- 중앙 컨텐츠 끝 -->