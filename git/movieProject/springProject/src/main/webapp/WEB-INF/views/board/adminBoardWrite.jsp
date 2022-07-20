<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 부트스트랩 라이브러리 -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript"
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.ck-editor__editable_inline {
	min-height: 350px;
	overflow: auto;
}

table {
	width: 100%;
	border: none;
	border-collapse: collapse;
}

table td, table th {
	border: none;
	padding: 5px;
}
</style>
<!-- ckedior 라이브러리 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/uploadAdapter.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".radio_b1").click(function(){
			if($("input[type='radio']").is(':checked')){
				$(".radio_v1").show();
				$(".radio_v2").hide();
				$("input:radio[name='cate_num']:radio[value='1']").prop("checked",true) ;
			}

		});
		$(".radio_b2").click(function(){
			if($("input[type='radio']").is(':checked')){
				$(".radio_v2").show();
				$(".radio_v1").hide();
				$("input:radio[name='cate_num']:radio[value='5']").prop("checked",true) ;
			}

		})
		$(".check1").click(function(){
			if($("input[type='radio']").is(':checked')){
				$(".region").disable();
			}else{
				$(".region").able();
			}

		})
		 // 영화관 선택(선택하지 않음:0, 선택함:1)
        $('input:radio[name="theater_choise"]').on("change", function () {            
            $(this).parent().addClass("on").siblings().removeClass("on");

            if ($(this).val() == "0") {
                //기본으로 셋팅
                $('#sel_t_group option').eq(0).attr("selected", true);
                theaterBinding();

                $('#sel_t_group').attr("disabled", true);
                $('#sel_regioncode').attr("disabled", true);
                $('#sel_theatercode').attr("disabled", true);
            }
            else {
                $('#sel_t_group').attr("disabled", false);
                $('#sel_regioncode').attr("disabled", false);
                $('#sel_theatercode').attr("disabled", false);
            }
        });
		
	})
	function movie(){
			
			const selectVal = $('#sel_regioncode').children("option:selected").val();
			console.log(selectVal);
			
			switch(selectVal) {
				case '1':
					console.log("1탔다");
					$('#sel_theatercode').empty();
					$('#sel_theatercode').append("<option value='0' selected>영화관 선택</option>");
					$('#sel_theatercode').append("<option value='2' selected>CGV 홍대</option>");
					$('#sel_theatercode').append("<option value='3' selected>CGV 강남</option>");
					$('#sel_theatercode').append("<option value='4' selected>CGV 압구정</option>");
					break;
				case '2':
					console.log("2탔다");
					$('#sel_theatercode').empty();
					$('#sel_theatercode').append("<option value='0' selected>영화관 선택</option>");
					$('#sel_theatercode').append("<option value='5' selected>CGV 수원</option>");
					$('#sel_theatercode').append("<option value='6' selected>CGV 광교</option>");
					$('#sel_theatercode').append("<option value='7' selected>CGV 화성</option>");
					break;
				default:
					break;
			}
		
			
		}
</script>
<!-- 중앙 시작 -->
<!-- 3월 11일 31분 -->
<div class="adminBoardWrite-main">
	<h3>관리자 글쓰기</h3>
	<form:form modelAttribute="boardVO" action="adminBoardWrite.do"
		class="adminWriteForm" method="post" enctype="multipart/form-data">
		<table style="width: 100%; table-layout: fixed;"
			class="tbl_notice_list tbl_left">
			<colgroup>
				<col style="width: 140px;">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">게시글 유형</th>
					<td>
						<ul class="type_list">
							<li><label for="qna"> <input type="radio" id="qna"
									name="board_auth" class="radio_b1" value="0" data-modal="modal"
									checked>자주찾는 질문
							</label></li>
							<li><label for="news"> <input type="radio" id="news"
									name="board_auth" class="radio_b2" value="1">뉴스/공지
							</label></li>
						</ul>
					</td>
				</tr>
				<!-- 자바 스크립트 이용할 예정 -->
				<tr class="radio_v1">
					<th scope="row">카테고리</th>
					<td>
						<ul class="type_list">
							<li><label for="tic"> <input type="radio"
									id="tic" name="cate_num" value="1" checked>예매/매표
							</label></li>
							<li><label for="pay"> <input type="radio" id="pay"
									name="cate_num" value="2">결제수단
							</label></li>
							<li><label for="memberShip"> <input type="radio"
									id="memberShip" name="cate_num" value="3">멤버쉽
							</label></li>
							<li><label for="useTheater"> <input type="radio"
									id="useTheater" name="cate_num" value="4">영화관이용
							</label></li>
						</ul>
					</td>
				</tr>
				<tr class="radio_v2">
					<th scope="row">카테고리</th>
					<td>
						<ul class="type_list cate">
							<li><label for="systemCheck"> <input type="radio"
									id="systemCheck" name="cate_num" value="5" >시스템점검
							</label></li>
							<li><label for="theater"> <input type="radio"
									id="theater" name="cate_num" value="6">극장
							</label></li>
							<li><label for="etc"> <input type="radio" id="etc"
									name="cate_num" value="7">기타
							</label></li>
						</ul>
					</td>
				</tr>
				<tr class="radio_v2">
					<th scope="row">영화관 선택</th>
					<td>
						<ul class="type_list">
							<li class="on"><label for="no_sel"> <input
									type="radio" id="no_sel" name="theater_choise"
									checked="checked" value="0" />선택하지 않음
							</label></li>
							<li><label for="sel"> <input type="radio" id="sel"
									name="theater_choise" value="1" />선택함
							</label></li>
						</ul> <label for="sel_regioncode" class="hidden">지역 선택</label> <select
						title="지역 선택" class="sel01" id="sel_regioncode"
						name="sel_regioncode" disabled="disabled"
						style="width: 114px; height: 30px;" onchange="movie();">
							<option value=0 selected>지역 선택</option>
							<option value=1>서울</option>
							<option value=2>경기</option>
							<option value=3>인천</option>
							<option value=4>강원</option>
							<option value=5>대구</option>
					</select> <label for="sel_theatercode" class="hidden">영화관 선택</label> <select
						title="영화관 선택" class="sel01" id="sel_theatercode"
						name="sel_theatercode" disabled="disabled"
						style="width: 114px; height: 30px;">
							<option value="0" selected>영화관 선택</option>

					</select>
					</td>
				</tr>

				<tr>
					<th scope="row">제목</th>
					<td><input name="board_title"
						style="width: 660px; height: 30px;" type="text"
						placeholder="제목을 입력하세요" /></td>
				</tr>
				<tr>
					<th scope="row"><b>내용</b></th>
					<td><textarea name="board_content" class="ck"
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
			    	</script></td>
				</tr>

				<tr style="display: none">
					<th>파일업로드</th>
					<td><input type="file" name="upload" id="upload"
						accept="image/gif,image/png,image/jpeg"></td>
				</tr>
			</tbody>
		</table>
		<div class="box-btn_adminSubmit">
			<input type="button" value="취소하기" class="round cancel"
				onclick="location.href='boardMain.do'">
			<form:button class="round submit">등록하기</form:button>
		</div>
	</form:form>
</div>
<!-- 중앙 끝-->