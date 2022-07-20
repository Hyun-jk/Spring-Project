<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<style type="text/css">
ul.memberInfo_wrap {
    float: right;
    margin: 10px;
    padding: 2px;
}
.box-image {
 	position:relative;
}
.addr-text {
	position:absolute;
}
.box-image {
	opacity:0.7;
}
.box-image .addr-text {
   visibility:visible;
 }
 .addr-text {
  padding: 10px 20px;
  border-radius: 10px;
  color:red;
  font-weight:bold;
  font-size:large;
  text-align: left;
  position: absolute;
  top: 95%;
  left: 18%;
  transform: translate(-35%, -70%);
}
 
div {
    display: block;
}
ul img.grade-round{
   display:inline-block;
}
div, ul, li, form, font, a{
	font-family: 'Noto Sans KR', 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
    font-size: 100%;
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: baseline;
    word-break: break-all;
}
ul.time-choice{
	list-style: none;
}
ul.time-choice li {
    display: inline-block;
    width: 100px;
    padding: 20px 18px 20px 20px;
    font-size: 18px;
    border: ridge;
    cursor: pointer;
}
div.area ul li a, div.sect-city ul li a{
	cursor:pointer;
}


/*밑부터 테스트*/
div[class^="sect-"] {
    clear: both;
    zoom: 1;
}
/*아이콘*/
.sect-showtimes .col-times .ico-grade {
    top: -2px;
    left: -1px;
}
.ico-grade.grade-15 {
    background-position: -72px 0;
}
.ico-grade {
    display: block;
    position: absolute;
    background: url(https://img.cgv.co.kr/R2014/images/sprite/sprite_icon.png) no-repeat;
    font: 0/0 a;
    zoom: 1;
}
/*제목*/
.info-movie {
    float: left;
    height: 30px;
    color: #cccccc;
    font-size: 12px;
    border-right: 1px solid white;
    width: 100%;
    margin: 10px;
}
.sect-showtimes .col-times > .info-movie strong {
    margin-right: 5px;
    color: #000;
    font-size: 16px;
}
/*상영중*/
.round > * {
    box-sizing: border-box;
    -moz-box-sizing: border-box;
    width: 100%;
    height: 100%;
    padding: 0 5px 0;
}
.round, .round > * {
    display: inline-block;
    position: relative;
}
em {
    font-style: italic;
}
.sect-showtimes .col-times > .info-movie .round {
    line-height: 16px;
    vertical-align: top;
}
.round.lightblue {
    border: 2px solid #3e82a4;
    color: #3e82a4;
}
.round {
    line-height: 23px;
    font-weight: 500;
    font-size: 12px;
    text-align: center;
    vertical-align: middle;
}
i {
    font-style: italic;
}
.sect-showtimes .info-hall {
    clear: both;
    margin-bottom: 5px;
    background: url(https://img.cgv.co.kr/r2014/images/common/ico/ico_arrow03.png) no-repeat 2px 50%;
}
.sect-showtimes .type-hall, .sect-showtimes .info-hall {
    zoom: 1;
}
ul ul {
    list-style-type: none;
}
.sect-showtimes .info-timetable > ul > li {
    float: left;
    position: relative;
    width: 60px;
    height: 36px;
    margin-right: -1px;
    padding-top: 5px;
    border: 1px solid #cbcabe;
    line-height: 1.4;
    text-align: center;
}
.showtimes-wrap .early, .showtimes-wrap .midnight, .showtimes-wrap .early, .showtimes-wrap .midnight, .showtimes-wrap .ico_script, .descri-info > ul > li > a, .sect-showtimes .info-timetable a > em {
    color: #333;
}
.sect-showtimes .info-timetable em {
    display: block;
    font-family: verdana, sans-serif;
    font-size: 12px;
    font-weight: bold;
}
.sect-showtimes .info-timetable span {
    display: inline-block;
    font-size: 11px;
}
.txt-lightblue {
    color: #2275a4 !important;
}
.sect-showtimes > ul > li:first-child {
    border-top: 0 none;
}
.sect-showtimes > ul > li {
    padding: 40px 0;
    border-top: 1px solid #474746;
}
.sect-showtimes > ul > li:after {
    content: '';
    clear: both;
    display: block;
}
.sect-showtimes .type-hall:after, .sect-showtimes .info-hall:after {
    content: '';
    clear: both;
    display: block;
}
.type-hall{
	width:150px;
	float:left;
}
#theater_img_container img{
	width: 980;
	height: 420px;
}
</style>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
//극장지역 선택 시 이벤트 발생
$(function(){
	let theater_local; //선택한 지역명(서울,경기,인천 ...)
	let theater_num;
		$(document).on('click','.theater-choice',function(){
			$.ajax({
				type:'post',
				data:{theater_local:$(this).text()},// 클릭한 극장 지역명 저장
				url:'selectListData.do',
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){	
					$('#area').empty();
					//선택한 지역에 속해있는 극장리스트 노출
					$(param.list).each(function(index,item){
						let output = '<div class="area">';
						output += '<ul>';
						output += '<li class="on">';
						output += '<a title="'+ item.theater_name + '" class="theater-name" data-num="'+item.theater_num+'" data-addr="'+item.theater_addr+'">' + item.theater_name + '</a>';
						output += '</li>';
						output += '</ul>';
						output += '</div>';

						//문서 객체에 극장지역 리스트 추가
						$('#area').append(output);
						
					});
				},
				error:function(){
					alert('네트워크 오류 발생');
				}
			});
			
		}); // end of click (극장지역 선택 시 이벤트 발생)
		$('#theater_img_container').hide();

		//극장관 등록 후 cgv지점을 클릭하면 지점별 극장 인포사진 노출
		$(document).on('click','.theater-name',function(){
			theater_num = $(this).attr('data-num');
			let theater_name = $(this).text();
			let theater_addr = $(this).attr('data-addr');
			
			//cgv지점명 클릭시 지점별 인포사진 교체
			$('#theater_img_container').show();
			$('#theater_img_container').find('img').attr('src','${pageContext.request.contextPath}/theater/theaterImage.do?theater_num='+theater_num);	
			//cgv지점명 클릭시 인포사진 위에 극장지점명(ex cgv강남) 표시
			$('h4').find('span').text(theater_name).show();
			$('.addr-text').text(theater_addr); 
			$('.time-choice').show();
			$('.time-choice li').hover(function(){
				   $(this).css('color','red');
			   }, function(){
				   $(this).css('color','black');
			   });
			$('.sect-showtimes').show();
			$('.info-noti1').show();
			
			//상영관명과 상영관 이미지 출력 후 상영 정보 호출
			//오늘 날짜 추출
			let times = getCurrentWeek();
			let movie_date = times[0].split('-');
			movie_date = movie_date[0] + '/' + movie_date[1] + '/' + movie_date[2];
			getTimeList(movie_date);
			
	});	
		
	//오늘부터 7일 날짜 출력하기	
	function getCurrentWeek(){
	    const day = new Date();
		const result = [day.toISOString().slice(0,10)];

	   	for(let i=1;i<7;i++){
	    	day.setTime(day.getTime() + 86400000);
	    	result.push(day.toISOString().slice(0,10));
	   }
	   return result;
   }

   let times = getCurrentWeek();
   $(times).each(function(index,items){
	   let time = items.split('-');
	   time = time[0] + '/' + time[1] + '/' + time[2];
	   
	   let output = '<ul class="time-choice">';
	   output += '<li data-time="'+time+'">'+time+'</li>';
	   output += '</ul>';
	   $('#time_output').append(output);
   })
   $('.time-choice').hide();
   //날짜를 클릭하면 상영 정보를 구해옴 
   $(document).on('click','.time-choice li',function(){
	   let movie_date = $(this).attr('data-time');
	   
	   if(!theater_num) return;
	   
	   getTimeList(movie_date);
	}); // end of click
	
	$('.sect-showtimes').hide();
	$('.info-noti1').hide();
	//상영 정보 호출 함수
	function getTimeList(movie_date){
		$.ajax({
			type:'post',
			data:{movie_date:movie_date,theater_num:theater_num},
			url:'selectTimeListAjax.do',
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				$('.movie-name').text("");
				$('.movie-genre').text("");
				$('.movie-date').text("");
				$('.movie-time').text("");
				$('.movie-showtm').text("");
				$('.movie-auth').find('em').text("");
				$('.movie-pg').find('img').hide();
				
				$('#time_output2').empty();
				
				if(param.list.length==0){
					$('.info-movie').hide();
				}else{
					$('.info-movie').show();
				}
				
				//$('#area').empty();
				let movie_num;
				let movie_name;
				let movie_auth;
				let movie_genre;
				let movie_pg;
				let movie_date;
				let movie_time;
				let movie_showtm;
				
				$(param.list).each(function(index,item){
					movie_num = item.movie_num;
				    movie_name = item.movie_name;
				    movie_auth = item.movie_auth;
				    movie_genre = item.movie_genre;
				    movie_pg = item.movie_pg;
				    movie_date = item.movie_date;
				    movie_showtm = item.movie_showtm;		
				    movie_time = item.movie_time;
				    
					/*
					let output = '<div class="area">';
					output += '<ul>';
					output += '<li class="on">';
					output += '<a title="'+ item.theater_name + '" class="theater-name" data-num="'+item.theater_num+'">' + item.theater_name + '</a>';
					output += '</li>';
					output += '</ul>';
					output += '</div>';

					//문서 객체에 극장지역 리스트 추가
					$('#area').append(output);
					*/
				});
				
				$('.movie-name').text(movie_name);
				if(movie_auth == 0) $('.movie-auth').find('em').text('상영중');
				else if(movie_auth == 1) $('.movie-auth').find('em').text('상영예정');
				else if(movie_auth == 2) $('.movie-auth').find('em').text('상영종료');
				
				$('.movie-genre').text(movie_genre);
				if(12 == movie_pg){
					$('.movie-pg').find('img').attr('src','https://img.cgv.co.kr/R2014/images/common/flag/age/grade-12.png').show();
				}else if(15 == movie_pg){
					$('.movie-pg').find('img').attr('src','https://img.cgv.co.kr/R2014/images/common/flag/age/grade-15.png').show();
				}else if(19 == movie_pg){
					$('.movie-pg').find('img').attr('src','https://img.cgv.co.kr/R2014/images/common/flag/age/grade-19.png').show();
				}else{
					$('.movie-pg').find('img').attr('src','https://img.cgv.co.kr/R2014/images/common/flag/age/grade-all.png').show();
				}
				$('.movie-date').text(movie_date);
				$('.movie-time').text(movie_time);
				$('.movie-showtm').text(movie_showtm+'분');
				
				//무비디테일 링크
				$('.info-movie').find('a').attr('href','${pageContext.request.contextPath}/movie/movieDetail.do?movie_num='+movie_num);
				
				$(param.time_list).each(function(index,item){
					let output = '';
					output += '<div class="type-hall">';
					output += '<div class="info-hall">';
					output += '<ul style="display: block;list-style: none;list-style-type: disc;margin-block-start: 1em;margin-block-end: 1em;margin-inline-start: 0px;margin-inline-end: 0px;padding-inline-start: 40px;">';
					output += '<li style="display: list-item;text-align: -webkit-match-parent;list-style: none;">총 '+item.total_count+'석</li>';
					output += '</ul>';
					output += '</div>';
					output += '<div class="info-timetable">';
					output += '<ul style="display: block;list-style: none;list-style-type: disc;margin-block-start: 1em;margin-block-end: 1em;margin-inline-start: 0px;margin-inline-end: 0px;padding-inline-start: 40px;">';
					output += '<li style="display: list-item;text-align: -webkit-match-parent;list-style: none;">';
					output += '<a href="${pageContext.request.contextPath}/reserve/reserveStep1.do">';
					output += '<em class="movie-time">'+item.movie_time+'</em>';
					output += '<span class="txt-lightblue">';
					output += '<span class="hidden">잔여좌석 </span>'+item.rest_count+'석';
					output += '</span>';
					output += '</a>';
					output += '</li>';
					output += '</ul>';
					output += '</div>';
					output += '</div>';
					
					$('#time_output2').append(output);
				});
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	}//end

});

</script>
<div class="favorite-wrap">
	<div class="sect-city">
		<ul>
			<li class="on" style="text-align: center;">
			<a class="theater-choice">서울</a>
			<a class="theater-choice">경기</a>
			<a class="theater-choice">인천</a>
			<a class="theater-choice">강원</a>
			<a class="theater-choice">대구</a>
			<div id="area"></div>
			</li>
		</ul>
	</div>
</div>

<c:if test="${!empty user_num && user_auth==3}">
	<div class="align-right">
		<input type="button" value="극장등록" onclick="location.href='${pageContext.request.contextPath}/theater/theaterWrite.do'">
	</div>
</c:if>

<hr size="1" noshade="noshade" width="100%">
<div>
</div>
<!-- THEATER 삽입 START -->
<div class="wrap-theater">
	<h3>
		<img alt="theater" src="https://img.cgv.co.kr/R2014/images/title/h3_theater.gif">
	</h3>
</div>
<hr size="1" noshade="noshade" width="100%">
<!-- THEATER 삽입 END -->
<!-- 지점별 THEATER 삽입 시작 -->
<div class="sect-theater">
	<div id="theatername_container"> <!-- <div class="sect-theater" id="theatername_container"> -->
		<h4 class="theater-ti">
			<!-- 디폴트값 cgv강남으로 지정 -->
			<span class="theater-name"><!-- cgv강남 --></span>	<!-- <span class="theater-name">CGV강남</span> -->
		</h4>
		<div class="wrap-theaterinfo">
			<div class="box-image">
				<div class="thumb-image" id="theater_img_container">
					<img src="https://img.cgv.co.kr/Theater/Theater/2014/1211/CGVgangnam.jpg" >
					<div class="addr-text"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="theater-info">
     <!-- <strong class="movie-title">서울 강남구 테헤란로123</strong> -->
</div>
<br>
<!-- 상영일자 표시 -->
<div id="time_output"></div>
<!-- 상영일자 표시 -->
<c:if test="${!empty user_num && user_auth==3}">
	<div class="align-right">
		<input type="button" value="상영정보등록" onclick="location.href='${pageContext.request.contextPath}/time/timeInsert.do'">
		<input type="button" value="좌석등록" onclick="location.href='${pageContext.request.contextPath}/time/insertSeat.do'">
	</div>
</c:if>

<!-- 영화리스트 시작(참고용) -->
<div class="sect-showtimes">
	<ul style="display: block;list-style: none;list-style-type: disc;margin-block-start: 1em;margin-block-end: 1em;margin-inline-start: 0px;margin-inline-end: 0px;padding-inline-start: 40px;">
		<li style="display:list-item;text-align: -webkit-match-parent;list-style: none;">
			
			<div class="col-times">

				<div class="info-movie">
					<span class="movie-pg">
						<img class="grade-round" src="<!-- https://img.cgv.co.kr/R2014/images/common/flag/age/grade-15.png -->" width="20px" height="20px"> <!-- <span class="ico-grade grade-15">15세 이상</span> -->
					</span>
					<a href="${pageContext.request.contextPath}/movie/movieDetail.do?movie_num=${movieVO.movie_num}" target="_parent">
					<strong style="font-weight: bold;" class="movie-name"><!-- 극장판 주술회전 --></strong></a> 
							<span class="round lightblue movie-auth">
								<em><!-- 상영중 --></em>
							</span>
							<span class="">
								<em> </em>
							</span>
							<i class="movie-genre"> <!-- 애니메이션 --></i> / <i class="movie-showtm"> <!-- 105분 --></i> / <i class="movie-date"> <!-- 2022.03.31 개봉 --></i>
				</div>
				<div id="time_output2">
				</div>
			</div>
		</li>
	</ul>
</div>
<!-- 영화리스트  끝 -->
<div class="info-noti1">
<p class="info-noti"></p>
<hr size="1" noshade="noshade" width="100%">
<p>ㆍ입장 지연에 따른 관람 불편을 최소화하기 위해 영화는 10분 후 상영이 시작됩니다.</p>
<p></p>
</div>
<!-- 중앙 컨텐츠 끝 -->