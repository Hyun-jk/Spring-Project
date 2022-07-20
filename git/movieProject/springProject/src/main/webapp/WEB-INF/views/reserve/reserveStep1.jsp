<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		//다음 step 으로 가기위한 영화/상영관/시간/인원수... 정보를 저장하기 위한 변수 선언
		let pick_movie_num; //선택한 영화번호
		let pick_theaternum; //선택한 상영관번호
		let pick_movietime; //선택한 상영시간번호
		let seat_total_count; //해당 영화 전체 좌석 수
		let reserv_total_count; //해당 영화 예약된 좌석 수
		let seat_possable_count; //해당 영화 예약 가능한 좌석 수
			
		//영화 선택 시 이벤트 발생
		$('.movie_list li').click(function(){
			let movie_num = $(this).children().attr('movie-idx'); // 클릭한 영화의 영화번호 변수에 저장
			$('#movie_num').val(movie_num);//form 태그 내 movie_num에 value 지정
			
			//로딩 이미지 노출
			$('#loading').show();
			
			$.ajax({
				type:'post',
				data:{movie_num:movie_num},
				url:'pickmovie.do',
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
					//로딩 이미지 감추기
					$('#loading').hide();
					
					//영화 연령제한 유효성 검사
					if(param.age<param.movie.movie_pg){
						alert('해당 영화는' + param.movie.movie_pg + '세 이상 관람 가능 합니다.');
						return;
					}
					
					//info 영역에 선택한 영화 정보 노출
					$('#movie_name').html(param.movie.movie_name).attr('movie_num',movie_num);
					$('#movie_genre').html(param.movie.movie_genre);
					$('#movie_pg').html(param.movie.movie_pg);

					if(param.movie.filename){ // DB에 이미지 있으면, 
						let imgurl = '/project/movie/imageView.do?movie_num='+param.movie.movie_num; // DB에서 가져온 filename
						$('#movie_photo').css('display','').attr('src',imgurl); // 저장된 이미지 노출
					}else{ // DB에 이미지 없으면,
						let imgurl_default = '/project/resources/images/default.png'; // 기본 이미지
						$('#movie_photo').css('display','').attr('src',imgurl_default); // 기본 이미지 노출
					}
					
					//다음 step으로 가기위한 영화 번호 변수에 저장
					pick_movie_num = param.movie.movie_num;
					
					//극장 카테고리(지역) 리스트 내용 초기화
					$('#theater-local').empty();
					//cgv 리스트 내용 초기화
					$('#theater-cgv').empty();
					//info에 있는 cgv 내용(극장명) 초기화
					$('#cgv_name').empty();
					//info에 있는 cgv 내용(상영일) 초기화
					$('#cgv_date').empty();
					//info에 있는 cgv 내용(상영시간) 초기화
					$('#cgv_time').empty();
					//상영일자 내용 초기화
					$('#movie-date').empty();
					//상영시간 내용 초기화
					$('#movie-time').empty();
					//인원수 선택 내용 초기화
					$('#people').empty();
					//info에 있는 adult 인원수 초기화
					$('#adult_result').empty();
					//info에 있는 youth 인원수 초기화
					$('#youth_result').empty();
					//info에 있는 old 인원수 초기화
					$('#old_result').empty();
					//info에 있는 total 인원수 초기화
					$('#total_result').empty();
					
					
					// 선택한 영화가 상영하는 극장 카테고리(지역) 노출
					$(param.theater_local_name).each(function(index,item){
						let output = '<li style="float:none; text-align:right;">';
						output += item.theater_local;
						output += '</li>';
						
						//문서 객체에 추가
						$('#theater-local').append(output);
						
						
						
					});
				},
				error:function(){
					//로딩 이미지 감추기
					$('#loading').hide();
					alert('네트워크 오류 발생');
				}
			});
			
			
		}) // end of click (영화 선택 시 이벤트 발생)
		
		
		
		//극장지역 선택 시 이벤트 발생
		$(document).on('click','#theater-local li',function(){
			let pick_localname = $(this).text(); // 클릭한 극장 지역(카테고리)명 변수에 저장
			
			
			//로딩 이미지 노출
			$('.loading2').show();
			
			$.ajax({
				type:'post',
				data:{pick_localname:pick_localname,pick_movie_num:pick_movie_num},
				url:'picklocal.do',
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
					//로딩 이미지 감추기
					$('.loading2').hide();
					//cgv 목록 내용 초기화
					$('#theater-cgv').empty();
					//info에 있는 cgv 내용(극장명) 초기화
					$('#cgv_name').empty();
					//info에 있는 cgv 내용(상영일) 초기화
					$('#cgv_date').empty();
					//info에 있는 cgv 내용(상영시간) 초기화
					$('#cgv_time').empty();
					//상영일자 내용 초기화
					$('#movie-date').empty();
					//상영시간 내용 초기화
					$('#movie-time').empty();
					//인원수 선택 내용 초기화
					$('#people').empty();
					//info에 있는 adult 인원수 초기화
					$('#adult_result').empty();
					//info에 있는 youth 인원수 초기화
					$('#youth_result').empty();
					//info에 있는 old 인원수 초기화
					$('#old_result').empty();
					//info에 있는 total 인원수 초기화
					$('#total_result').empty();
						
					//선택한 지역에 속해있는 극장 노출
					$(param.cgv_list).each(function(index,item){
						let output = '<li style="float:none; text-align:right";>';
						output += '<a href="#" theater-idx="'+ item.theater_num +'">';
						output += item.theater_name;
						output += '</a>';
						output += '</li>';

						//문서 객체에 추가
						$('#theater-cgv').append(output);
						
						
					});
				},
				error:function(){
					//로딩 이미지 감추기
					$('.loading2').hide();
					alert('네트워크 오류 발생');
				}
			});
			
		}); // end of click (극장지역 선택 시 이벤트 발생)
		
		
		//cgv 선택 시 이벤트 발생
		$(document).on('click','#theater-cgv li',function(){
			let pick_theatername = $(this).text(); // 클릭한 cgv명 변수에 저장
			pick_theaternum = $(this).children().attr('theater-idx');
			$('#theater_num').val(pick_theaternum);//form 태그 내 theater_num에 value 지정
			
			//로딩 이미지 노출
			$('.loading3').show();
			
			$.ajax({
				type:'post',
				data:{pick_theaternum:pick_theaternum,pick_movie_num:pick_movie_num},
				url:'pickcgv.do',
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
					//로딩 이미지 감추기
					$('.loading3').hide();
					//info 영역에 선택한 cgv명 정보 노출
					$('#cgv_name').html('극장명 | ' + pick_theatername).attr('theater_num',pick_theaternum);
					//info에 있는 cgv 내용(상영일) 초기화
					$('#cgv_date').empty();
					//info에 있는 cgv 내용(상영시간) 초기화
					$('#cgv_time').empty();
					//상영일자 내용 초기화
					$('#movie-date').empty();
					//상영시간 내용 초기화
					$('#movie-time').empty();
					//인원수 선택 내용 초기화
					$('#people').empty();
					//info에 있는 adult 인원수 초기화
					$('#adult_result').empty();
					//info에 있는 youth 인원수 초기화
					$('#youth_result').empty();
					//info에 있는 old 인원수 초기화
					$('#old_result').empty();
					//info에 있는 total 인원수 초기화
					$('#total_result').empty();
					
					//선택한 영화/상영관에 상영중인 시간대 노출
					$(param.date_list).each(function(index,item){
						let output = '<li style="float:none; text-align:center;" time_num="'+ item.time_num +'">';
						output += '<a href="#">';
						output += item.movie_date;						
						output += '</a>';
						output += '</li>';

						//문서 객체에 추가
						$('#movie-date').append(output);
						
					});
					
				},
				error:function(){
					//로딩 이미지 감추기
					$('.loading3').hide();
					alert('네트워크 오류 발생');
				}
			});
			
		}); // end of click (cgv 선택 시 이벤트 발생)
		
		
		//상영 일자 선택 시 이벤트 발생
		$(document).on('click','#movie-date li',function(){
			let pick_moviedate = $(this).text(); // 클릭한 상영일자 변수에 저장
			pick_movietime = $(this).attr('time_num'); // 클릭한 상영일자의 상영시간 번호를 가져옴
			$('#time_num').val(pick_movietime);//form 태그 내 time_num에 value 지정
			
			//로딩 이미지 노출
			$('.loading4').show();
			
			$.ajax({
				type:'post',
				data:{pick_theaternum:pick_theaternum,pick_movie_num:pick_movie_num,pick_moviedate:pick_moviedate},
				url:'pickdate.do',
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
					//로딩 이미지 감추기
					$('.loading4').hide();
					//info 영역에 선택한 상영일자 정보 노출
					$('#cgv_date').html('상영일자 | ' + pick_moviedate).attr('time_num',pick_movietime);
					//info에 있는 cgv 내용(상영시간) 초기화
					$('#cgv_time').empty();
					//상영시간 내용 초기화
					$('#movie-time').empty();					
					//인원수 선택 내용 초기화
					$('#people').empty();
					//info에 있는 adult 인원수 초기화
					$('#adult_result').empty();
					//info에 있는 youth 인원수 초기화
					$('#youth_result').empty();
					//info에 있는 old 인원수 초기화
					$('#old_result').empty();
					//info에 있는 total 인원수 초기화
					$('#total_result').empty();
					
					//선택한 영화/상영관에 상영중인 시간대 노출
					$(param.time_list).each(function(index,item){
						let output = '<li style="float:none; text-align:center";>';
						output += '<a href="#" time-idx="'+ item.time_num +'">';
						output += item.movie_time;
						output += '</a>';
						output += '</li>';

						//문서 객체에 추가
						$('#movie-time').append(output);
						
					});
					
				},
				error:function(){
					//로딩 이미지 감추기
					$('.loading4').hide();
					alert('네트워크 오류 발생');
				}
			});
			
		}); // end of click (상영 일자 선택 시 이벤트 발생)
		
		
		//상영 시간 선택 시 이벤트 발생
		$(document).on('click','#movie-time li',function(){
			pick_time_num = $(this).children().attr('time-idx'); // 클릭한 상영시간의 시간 번호(time_num)을 변수에 저장
			
			//인원수 체크 내용 초기화
			$('#people').empty();
			
			//info 영역에 선택한 상영일자 정보 노출
			$('#cgv_time').html('상영시간 | ' + $(this).children().text());
			
			
			$.ajax({
				type:'post',
				data:{pick_time_num:pick_time_num},
				url:'picktime.do',
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
					seat_total_count = param.seat_total_count; //해당 영화 전체 좌석 수 
					reserv_total_count = param.reserv_total_count; //해당 영화 예약된 좌석 수
					seat_possable_count = param.seat_possable_count; //해당 영화 예약 가능한 좌석 수
					
					//인원수 선택 및 합계 조회 정보 노출
					//$('#people_check').css('display','');
					let output = '<div id="people_check">';
					output += '<div style="height: 30px; text-align: center; background: white;"><span style="vertical-align: middle;">'+seat_possable_count+'/'+seat_total_count+'(예약가능 좌석 / 총 좌석)</div>';
					output += '<div><span>성인(20세 이상) / 10,000원 </span><input type="number" id="adult" name="adult" max="3" min="0"></div>';
					output += '<div><span>청소년(19세 이하) / 8,000원 </span><input type="number" id="youth" name="youth" max="3" min="0"></div>';
					output += '<div><span>경로우대(65세 이상) / 6,000원 </span><input type="number" id="old" name="old" max="3" min="0"></div>';
					output += '<div style="margin-top: 10px;"><span id="total_people" name=""></span><div id="total_price" name="total_price"></div></div>';
					output += '</div>';

					//문서 객체에 추가
					$('#people').append(output);
				},
				error:function(){
					alert('네트워크 오류 발생');
				}
			});

		}); // end of click (상영 시간 선택 시 이벤트 발생)
		
		
		// =================================================================================================인원수 선택 및 합계 조회
		let adult_price = 10000;
		let youth_price = 8000;
		let old_price = 6000;
		
		let adult_sum = 0;
		let youth_sum = 0;
		let old_sum = 0;
		
		let possable_people = 3; // 선택 가능한 인원
		let total_price = 0; // 총 금액
		let total_people = 0; // 총 인원

		let adult; // 예약하려는 어른 수
		let youth; // 예약하려는 청소년 수
		let old; // 예약하려는 경로우대 수
	
		let movie_pg; // 영화 시청연령
		
		$(document).on('keyup mouseup','#adult,#youth,#old',function(){
			
			//연령제한 유효성 검사
			$.ajax({
				type:'post',
				data:{pick_movie_num:pick_movie_num},
				url:'pickmovie_pg.do',
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
					movie_pg = param.movie.movie_pg;
				},
				error:function(){
					alert('네트워크 오류 발생');
				}
			});
			
			
			if(seat_possable_count == 0){
				alert('예약 가능한 좌석이 없습니다.');
				$(this).val('').focus();
				return;
			}
			
			
			if(possable_people == 0){
				alert('최대 예약 가능한 인원은 3명입니다.');
				$(this).val('').focus();
			}
			
			
			adult = Number($('#adult').val());
			youth = Number($('#youth').val());
			old = Number($('#old').val());
			
			
			if(movie_pg == 19){
				if(youth >= 1){
					alert('청소년이 관람할 수 없는 영화입니다.');
					$('#youth').val('').focus();
					youth = Number($('#youth').val());
				}
			}
			
			
			//인원수 체크
			total_people = adult + youth + old;
			
			//가격 체크
			adult_sum = adult_price * adult;
			youth_sum = youth_price * youth;
			old_sum = old_price * old;
			total_price = adult_sum + youth_sum + old_sum;
			
			//남은 인원수 구하기
			possable_people = 3 - total_people;
			
			$('#total_people').text('총인원 ' + total_people + '명');
			$('#total_price').text('총금액 ' + total_price + '원');
			
			//info 영역에 선택한 인원수 정보 노출
			$('#adult_result').html('성인 '+ adult + '명 | ' + adult_sum + '원').attr('adult_count',adult);
			$('#youth_result').html('청소년 '+ youth + '명 | ' + youth_sum + '원').attr('youth_count',youth);
			$('#old_result').html('경로우대 '+ old + '명 | ' + old_sum + '원').attr('old_count',old);
			$('#total_result').html('총 '+ total_people + '명 | ' + total_price + '원').attr('total_price',total_price).attr('total_people',total_people);
			
			//form 태그 내 hidden 데이터 저장
			$('#reserve_adult').val(adult);
			$('#reserve_youth').val(youth);
			$('#reserve_old').val(old);
			$('#reserve_people_total').val(total_people);
			$('#reserve_price_total').val(total_price);
			
		}); // end of on (인원수 선택 및 합계 조회)
		
			
		//좌석 선택 유효성 체크
		$('#reserveStep1_form').submit(function(){
			
			if($('#movie_num').val() == ''){
				alert('영화를 선택해주세요.');
				return false;
			}
			
			if($('#theater_num').val() == ''){
				alert('상영관을 선택해주세요.');
				return false;
			}
			
			if($('#time_num').val() == ''){
				alert('상영 일자(날짜) 선택해주세요.');
				return false;
			}
			
			
			if($('#reserve_people_total').val() == '' || $('#reserve_people_total').val() == 0){
				alert('상영 시간 및 인원(최소1명 ~ 최대3명)을 선택해주세요.');
				return false;
			}
			
			
		});
		
	});
</script>

<div id="step-info">
	<div id="step1-info" style="background: #ed6e6e; font-weight: bold;">1.영화 및 극장 선택</div>
	<div id="step2-info">2.좌석 선택</div>
	<div id="step3-info">3.결제</div>
</div>
	
<div style="display: flex; flex-direction: row-reverse;">
	<input type="button" value="초기화" onclick="location.href='reserveStep1.do'">
</div>

<div id="info-banner" style="width: 100%; background: black; height: 150px; margin: 10px 0 10px 0">
	<div class="info-movie">
		<div id="loading" style="display:none;"><img src="${pageContext.request.contextPath}/resources/images/ajax-loader.gif"></div>
		<div><img src="${pageContext.request.contextPath}/resources/images/default.png" width="120px" height="130px" style="float:left; margin-right: 20px; display:none" id="movie_photo"></div>
		<div id="movie_name"></div>
		<div id="movie_genre"></div>
		<div id="movie_pg"></div>
	</div>
	<div class="info-theater">
		<div class="loading3" style="display:none;"><img src="${pageContext.request.contextPath}/resources/images/ajax-loader.gif"></div>
		<div id="cgv_name"></div>
		<div id="cgv_date"></div>
		<div id="cgv_time"></div>
	</div>
	<div class="info-people">
		<div id="adult_result"></div>
		<div id="youth_result"></div>
		<div id="old_result"></div>
		<div id="total_result"></div>
	</div>
	<div>
		<form action="reserveStep2.do" method="post" id="reserveStep1_form" style="border:0px solid;">
			<input type="hidden" name="movie_num" id="movie_num">
			<input type="hidden" name="theater_num" id="theater_num">
			<input type="hidden" name="time_num" id="time_num">
			<input type="hidden" name="reserve_adult" id="reserve_adult">
			<input type="hidden" name="reserve_youth" id="reserve_youth">
			<input type="hidden" name="reserve_old" id="reserve_old">
			<input type="hidden" name="reserve_people_total" id="reserve_people_total">
			<input type="hidden" name="reserve_price_total" id="reserve_price_total">
			<input type="submit" value="좌석선택" class="custom-btn btn-7">
		</form> 
	</div>
</div>

<div class="movie-form">
	<div id="movieselect" style="width: 30%; height: 100%; border:1px black solid; float: left;">
		<div class="col-head">영화</div>
		<div class="col-body">
			<c:if test="${empty movie_list}">
			<div style="text-align: center;">현재 상영중인 영화가 없습니다.</div>
		</c:if>
		<c:if test="${!empty movie_list}">
			<ul style="margin-top: 0px; padding-left: 0px; margin-bottom: 0px;" class="movie_list">
				<c:forEach var="movie" items="${movie_list}">
					<li style="margin: 5px; float: none; text-align: left;">
						<a href="#" movie-idx="${movie.movie_num}">
							<span style="display:inline-block;">
								<c:choose>
									<c:when test="${12 <= movie.movie_pg && movie.movie_pg < 15}">
									<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/grade-12.png" width="30px" height="30px;">
									</c:when>
									<c:when test="${15 <= movie.movie_pg && movie.movie_pg < 19}">
									<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/grade-15.png" width="30px" height="30px;">
									</c:when>
									<c:when test="${19 <= movie.movie_pg}">
									<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/grade-19.png" width="30px" height="30px;">
									</c:when>
									<c:otherwise>
									<img src="https://img.cgv.co.kr/R2014/images/common/flag/age/grade-all.png" width="30px" height="30px;">
									</c:otherwise>
								</c:choose>
							</span>
							<span>${movie.movie_name}</span>
						</a>
					</li>					
				</c:forEach>
			</ul>			
		</c:if>
		</div>
	</div>
	<div style="width: 30%; height: 100%; border:1px black solid; float: left;">
		<div class="col-head">극장</div>
		<div class="col-body">
			<div class="theater-list">
				<div class="theater-area-list">
					<ul id="theater-local">
						
					</ul>
				</div>
				<div class="theater-cgv-list">
					<ul id="theater-cgv">
						<div class="loading2" style="display:none;"><img src="${pageContext.request.contextPath}/resources/images/ajax-loader.gif"></div>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div style="width: 9%; height: 100%; border:1px black solid; float: left;">
		<div class="col-head">날짜</div>
		<div class="col-body">
			<div class="date-list">
				<ul id="movie-date" style="padding-left: 0px;">
					<div class="loading4" style="display:none;"><img src="${pageContext.request.contextPath}/resources/images/ajax-loader.gif"></div>
				</ul>
			</div>
		</div>
	</div>
	<div style="width: 10%; height: 100%; border:1px black solid; float: left;">
		<div class="col-head">시간</div>
		<div class="col-body">
			<div class="time-list"> 
				<ul id="movie-time" style="padding-left: 0px;">
				
				</ul>
			</div>
		</div>
	</div>
	<div style="width: 20%; height: 100%; border:1px black solid; float: left;">
		<div class="col-head">인원 (최대 3명)</div>
		<div class="col-body" id="people">
		</div>
	</div>
</div>	
<!-- 중앙 컨텐츠 끝 -->