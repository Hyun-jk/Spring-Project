<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<div class="movieWrite">
	<h2>무비차트 수정</h2>
	<form:form modelAttribute="movieVO" action="movieUpdate.do" id="movieUpdate_form" enctype="multipart/form-data">
		<form:hidden path="movie_num"/>
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<form:label path="movie_name">제목</form:label>
				<form:input path="movie_name"/>
				<form:errors path="movie_name" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="movie_content">내용</form:label>
				<form:input path="movie_content"/>
				<form:errors path="movie_content" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="movie_genre">영화 장르</form:label>
				<form:input path="movie_genre"/>
				<form:errors path="movie_genre" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="movie_auth">상영 정보</form:label>
				<form:input path="movie_auth"/>
				<form:errors path="movie_auth" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="movie_pg">영화 관람연령</form:label>
				<form:input path="movie_pg"/>
				<form:errors path="movie_pg" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="movie_showtm">상영 시간</form:label>
				<form:input path="movie_showtm"/>
				<form:errors path="movie_showtm" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="upload">파일업로드</form:label>
				<input type="file" name="upload" id="upload">
				<c:if test="${!empty movieVO.filename}">
				<br>
				<span id="file_detail">(${movieVO.filename})파일이 등록되어 있습니다.
				다시 업로드하면 기존 파일은 삭제됩니다.
				<input type="button" value="파일삭제" id="file_del">
				</span>
<script type="text/javascript">
	$(function(){
		$('#file_del').click(function(){
			let choice = confirm('삭제하시겠습니까?');
			if(choice){
				$.ajax({
					url:'deleteFile.do',
					data:{movie_num:${movieVO.movie_num}},
					type:'post',
					dataType:'json',
					cache:false,
					timeout:30000,
					success:function(param){
						if(param.result == 'logout'){
							alert('로그인 후 사용하세요');
						}else if(param.result == 'success'){
							$('#file_detail').hide();	
						}else{
							alert('파일 삭제 오류 발생');
						}
					},
					error:function(){
						alert('네트워크 오류 발생');
					}
				});
			}
		});
	});
</script>				
				</c:if>
			</li>
		</ul>
		<div class="align-center">
			<form:button>전송</form:button>
			<input type="button" value="취소" 
			                         onclick="location.href='movieChart.do'">
		</div>
	</form:form>	 
	</div>