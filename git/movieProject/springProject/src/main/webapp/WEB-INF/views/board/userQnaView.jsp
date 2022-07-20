<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board.reply.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/videoAdapter.js"></script>
<style>
table{
	width:100%;
	border:none;
	border-collapse:collapse;
}
table td, table th{
	border:none;
	padding:5px;
}
</style>
<div class="boardMain">
	<div class="board-detail1">
		<h3 style="margin:0px 10px;">문의/건의</h3>
		<div class="board_view_area">
			<ul class="top_title_faq">
				<li style="display:none">${board.mem_num}</li>
				<li style="display:none">${board.board_num}</li>
				<li class="title">
					<span>[<em>${board.cate_name}</em>]</span>
					<span><em>${board.board_title}</em></span>
				</li>
				<li class="stit_area">
					<span>등록일 <em>${board.board_reg_date}</em></span>
					<span>조회수 <em>${board.board_hit}</em></span>
				</li>

				

				</ul>
				<div class="view_area">
					${board.board_content}
				</div>
				<div class="customer_btn">
					<!-- 작성자, 관리자만 수정, 삭제 가능 -->
					<%-- <c:if test="${!empty user_num && user_auth == 3}"> --%>
					<button type="button" class="round inwhite" id="btn_list"
					onclick="location.href='${pageContext.request.contextPath}/board/userUpdate.do?board_num=${board.board_num}'">
						<span>수정</span>
					</button>
					
					<button type="button" class="round inred" id="btn_delete">
						<span>삭제</span>
					</button>
					<script type="text/javascript">
						let btn_delete = document.getElementById('btn_delete');
						btn_delete.onclick=function(){
							let choice = confirm('삭제하시겠습니까?');
							if(choice){
								location.replace('userDelete.do?board_num=${board.board_num}');
							}
						};
					</script>
					<%-- </c:if> --%>
					<button type="button" class="round inblack" id="btn_list">
						<span>목록</span>
					</button>
				</div>
				<hr size="1" width="100%" noshade="noshade">
				
				<div class="reply_area">
					<span class="re-title">답변 내용</span>

					<form id="re_form" class="adminReplyForm" method="post">
					<!-- 회원인 경우 div창만 보이게 구성. 답변 테이블 null 인  경우 답변전이라는 문구 띄움 , 답변 등록되어 있는 경우 답변내용 출력 -->
						<input type="hidden" name="board_num" value="${board.board_num}" id="board_num">
						<c:if test="${!empty user_num && user_auth eq 3}">
						<textarea rows="3" cols="50" name="re_content" id="re_content" class="rep-content" placeholder="답변내용을 작성해주세요."
						></textarea>
						<div id="re_first">
							<span class="letter-count">300/300</span>
						</div>                 
						<div id="re_second" class="align-right">
							<input type="submit" value="전송" class="round inblue">
						</div>
						</c:if>
					</form>
					
				</div>
				
				<div id="output"></div>
				
		</div>
		
	</div>
</div>
<!-- 중앙 컨텐츠 끝 --> 