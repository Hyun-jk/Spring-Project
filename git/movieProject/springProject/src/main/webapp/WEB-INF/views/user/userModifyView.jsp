<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<script type="text/javascript">
	$(function(){
		//프로필 사진 업로드
		$('#photo_btn').click(function(){
			$('#photo_choice').show();
			$(this).hide();
		});
		
		//처음 화면에 보여지는 이미지 읽기
		let photo_path = $('.my-photo').attr('src');
		let my_photo;
		
		$('#upload').change(function(){
			my_photo = this.files[0];
			if(!my_photo){
				$('.my-photo').attr('src',photo_path);
				return;
			}
			
			if(my_photo.size > 1024 * 1024){
				alert(Math.round(my_photo.size/1024) + 'kbytes(1024kbytes까지만 업로드 가능)');
				$('.my-photo').attr('src',photo_path);
				$(this).val('');
				return;
			}
			
			//이미지 미리보기 처리
			var reader = new FileReader();
			reader.readAsDataURL(my_photo);
			
			reader.onload=function(){
				$('.my-photo').attr('src',reader.result);
			};
		});//end of change
		
		//이미지를 서버에 전송
		$('#photo_submit').click(function(){
			if($('#upload').val() == ''){
				alert('파일을 선택하세요!!');
				$('#upload').focus();
				return;
			}
			
			//파일 전송작업
			var form_data = new FormData();
			form_data.append('upload',my_photo);
			
			$.ajax({
				url:'updateMyPhoto.do',
				type:'post',
				data:form_data,
				dataType:'json',
				contentType:false,
				enctype:'multipart/form-data',
				processData:false,
				success:function(param){
					if(param.result == 'logout'){
						alert('로그인 후 사용하세요!');		
					}else if(param.result == 'success'){
						alert('프로필 사진이 수정되었습니다.');
						photo_path = $('.my-photo').attr('src');
						$('#upload').val('');
						$('#photo_choice').hide();
						$('#photo_btn').show();
					}else{
						alert('파일 전송 오류 발생');
					}
				},
				error:function(){
					alert('네트워크 오류 발생');
				}
			});
		}); //end of click
		
		$('#photo_reset').click(function(){
			$('.my-photo').attr('src',photo_path);
			$('#upload').val('');
			$('#photo_choice').hide();
			$('#photo_btn').show();
		});
		
		
	});
</script>
<style type="text/css">
span,  ul, li, fieldset {
	font-family: 'Noto Sans KR', 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
    font-size: 100%;
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: baseline;
    word-break: break-all;
}

.wrap-login{
	position:relative;
	padding:100px 200px 60px;
}
.wrap-login h3{height:auto;margin:0;background:none;line-height:1.2;text-align:left; color:#222222; font-size:15px;}
.wrap-login h3 >  strong{ color:#fb4357;}
.sect-login{ width:541px; float:none;}
.wrap-login .tab-menu-round > li{ width:100px;}
.box-login{
	padding:7px 0px 0 70px; 
	border-top:2px solid #898987; 
	border-bottom:2px solid #898987; 
	height: auto;
	
}

/*버튼*/
.box-login button[type="submit"] {
    width: 150px;
    height: 42px;
    line-height: 37px;
    left: 0;
    position: static;
    margin-top: 60px;
    margin-left:-200px;
    padding: 2px;
    background: #fb4357;
    text-align: center;
    color:white;
}

.sect-login > .box-login fieldset {
    position: relative;
    display: block;
    margin-inline-start: 2px;
    margin-inline-end: 2px;
    padding-block-start: 20px;
    padding-inline-start: 0.75em;
    padding-inline-end: 0.75em;
    padding-block-end: 0.625em;
    min-inline-size: min-content;
}

label{
	padding:20px 15px 15px 10px;
}

</style>
<!-- 중앙 컨텐츠 시작 -->
<div class="wrap-login">
	<div class="sect-login">
	<div class="infoTit">회원 정보</div>	
	<div class="box-login">
		<ul class="checkMyPage cols">
			<li>
			<c:if test="${empty member.mem_photo}">
				<img src="${pageContext.request.contextPath}/resources/images/face.png" width="200" height="200" class="my-photo">
			</c:if> 
			<c:if test="${!empty member.mem_photo}">
				<img src="${pageContext.request.contextPath}/user/photoView.do" width="200" height="200" class="my-photo">
			</c:if>
			</li>
		</ul>
		
		<ul class="cols">
			<li class="modifyPhoto">
				<div>
					<input type="button" value="프로필 사진 수정" id="photo_btn" class="round modifyPhoto">
				</div>
			</li>
		</ul>
	
		<ul>
			<li>
				<div id="photo_choice" style="display: none;">
					<input type="file" id="upload" accept="image/gif,image/png,image/jpeg" >
					<input type="button" value="전송" id="photo_submit" class="round inblue"> 
					<input type="button" value="취소" id="photo_reset" class="round inwhite1">
				</div>
				<br>
				<br>
			</li>
		</ul>
		
		<div class="infoDetail">
		<h2>회원 상세 정보</h2>
		<ul class="userInfo">
			<li>이름 : ${member.mem_name}</li><br>
			<li>전화번호 : ${member.mem_phone}</li><br>
			<li>이메일 : ${member.mem_email}</li><br>
			<li>우편번호 : ${member.mem_zipcode}</li><br>
			<li>주소 : ${member.mem_address}</li><br>
			<li>등급 : 
			<c:if test="${member.mem_grade < 3}"> 
                        <strong class="txt-purple">브론즈</strong>입니다.             
                        </c:if>
                        <c:if test="${member.mem_grade >= 3}"> 
                        <strong class="txt-purple">실버</strong>입니다.             
                        </c:if>
                        <c:if test="${member.mem_grade >= 5}"> 
                        <strong class="txt-purple">골드</strong>입니다.             
            </c:if>				
			</li>
		</ul>
		</div>
		<hr size="1" width="100%">
		
		
		<p class="modifyBtn">
			<input type="button" value="회원정보수정" class="round inwhite2" onclick="location.href='userModify.do'">
			<input type="button" value="비밀번호변경" class="round inblue2" onclick="location.href='changePassword.do'">
			<input type="button" value="회원탈퇴" class="round inred2" onclick="location.href='delete.do'">
		</p>
		</div>
		</div>
	</div>


<!-- 중앙 컨텐츠 끝 -->