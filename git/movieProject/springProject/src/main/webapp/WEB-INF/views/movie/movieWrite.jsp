<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 중앙 컨텐츠 시작 -->
<!-- 부트스트랩 라이브러리 -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.ck-editor__editable_inline {
	min-height: 350px;
	overflow: auto;
}
</style>
<!-- ckedior 라이브러리 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/uploadAdapter.js"></script>
<div class="movieWrite">
	<h2>영화 등록</h2>
	<form:form modelAttribute="movieVO" action="movieWrite.do" 
	                 enctype="multipart/form-data" id="movieRegister_form">
		<form:errors element="div" cssClass="error-color"/>
		<ul class="cols">
			<li class="col1">
				<form:label path="movie_name">제목</form:label>
			</li>
			<li class="col2">
				<form:input path="movie_name"/>
				<form:errors path="movie_name" cssClass="error-color"/>
			</li>
		</ul>
		<ul class="cols">
			<li class="col1">
				<form:label path="movie_genre">영화 장르</form:label>
			</li>
			<li class="col2">
				<form:input path="movie_genre"/>
				<form:errors path="movie_genre" cssClass="error-color"/>
			</li>
		</ul>
		<ul class="cols">
			<li class="col1">
				<form:label path="movie_auth">상영 정보</form:label>
			</li>
			<li class="col2">
				<form:input path="movie_auth"/>
				<form:errors path="movie_auth" cssClass="error-color"/>
			</li>
		</ul>
		<ul class="cols">
			<li class="col1">
				<form:label path="movie_pg">영화 관람연령</form:label>
			</li>
			<li class="col2">
				<form:input path="movie_pg"/>
				<form:errors path="movie_pg" cssClass="error-color"/>
			</li>
		</ul>
		<ul class="cols">
			<li class="col1">
				<form:label path="movie_showtm">상영 시간</form:label>
			</li>
			<li class="col2">
				<form:input path="movie_showtm"/>
				<form:errors path="movie_showtm" cssClass="error-color"/>
			</li>
		</ul>
		<ul class="cols">
			<li class="col1">내용</li>
		</ul>
		<ul class="cols">
			<li>
				<textarea name="movie_content" class="ck"
							placeholder="내용을 입력하세요"></textarea> <script>
						 function MyCustomUploadAdapterPlugin(editor) {
					    	editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
					        	return new UploadAdapter(loader);
					    	}
						}
				 
				 	ClassicEditor
		            	.create( document.querySelector( '.ck' ),{
		            		extraPlugins: [MyCustomUploadAdapterPlugin]
		            	})
		            	.then( editor => {
							window.editor = editor;
						} )
		            	.catch( error => {
		                	console.error( error );
		           		} );
			    	</script> 
			</li>
		</ul>
		
		<ul class="cols">
			<li class="col1">
				<form:label path="upload">파일업로드</form:label>
			</li>
			<li class="col2">
				<input type="file" name="upload" id="upload" accept="image/gif,image/png,image/jpeg">
				<form:errors path="upload" cssClass="error-color"/>
			</li>
		</ul>
			
			 
		<div class="align-center">
			<form:button>전송</form:button>
			<input type="button" value="목록" 
			              onclick="location.href='movieChart.do'">
		</div>                                          
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->



