$(function(){
	let currentPage;
	let count;
	let rowCount;
	
	//댓글 목록
	function selectData(pageNum,board_num){
		currentPage = pageNum;
		
		//로딩 이미지 노출
		//$('#loading').show();
		
		$.ajax({
			type:'post',
			data:{pageNum:pageNum, board_num:board_num},
			url:'listReply.do',
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				//로딩 이미지 감추기
				//$('#loading').hide();
				//count = param.count;
				//rowCount = param.rowCount;
				
				//if(pageNum == 1){
					//처음 호출시는 해당 ID의 div 내부 내용물 제거
					//$('#output').empty();
				//}
				
				//댓글 목록 작업
				$(param.list).each(function(index,item){
					
					let output = '<div class="item">';
					output += '<h4 style= "display:none;">' + item.id + '</h4>';
					output += '<div class="sub-item">';
					output += '<p style= "display:none;">' + item.reply_num +'</p>';
					output += '<p class="content-item">' + item.re_content.replace(/\r\n/g, '<br>') + '</p>';
					
					if(item.re_date){
						output += '<span>등록일: ' + item.re_date + '</span>';
					}
					//user_auth == 3 만 볼 수 있게 화인
					if(param.user_auth == 3){
					output += ' <input type="button" data-num="'+item.reply_num+'" value="수정" class="modify-btn">';
					output += ' <input type="button" data-num="'+item.reply_num+'" value="삭제" class="delete-btn">';
					}
					output += '<hr size="1" noshade>';
					output += '</div>';
					output += '</div>';
					
					//문서객체에 추가
					$('#output').append(output);
				});
				
				//paging button 처리
				if(currentPage>=Math.ceil(count/rowCount)){
					//다음 페이지가 없음
					$('.paging-button').hide();
				}else{
					//다음 페이지가 존재
					$('.paging-button').show();
				}
				
			},
			//error:function(){
				//로딩 이미지 감추기
				//$('#loading').hide();
				//alert('네트워크 오류 발생');
			//}
		});
	}

	
	//댓글 등록
	$('#re_form').submit(function(event){
		if($('#re_content').val().trim()==''){
			alert('내용을 입력하세요');
			$('#re_content').val(''),focus();
			return false;
		}
		
		let data = $(this).serialize();
		//데이터 전송
		$.ajax({
			type:'post',
			data:data,
			url:'writeReply.do',
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인 후 작성할 수 있습니다.');
				}else if(param.result == 'success'){
					//폼 초기화
					initForm();
					//댓글 작성이 성공하면 새로 삽입한 글을 포함해서 첫번째 페이지의 게시글 다시 호출
					selectData(1,$('#board_num').val());
				}else{
					alert('등록오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류발생');
			}
		});
		//기본 이벤트 제거
		event.preventDefault();
		
	});
	
	//댓글 작성 폼 초기화
	function initForm(){
		$('textarea').val('');
		$('#re_first .letter-count').text('300/300');
	}
	
	//textarea에 내용 입력시 글자수 체크
	$(document).on('keyup','textarea',function(){
		//남은 글자수를 구함
		let inputLength = $(this).val().length;
		
		if(inputLength>300){//300자 넘어선 경우
			$(this).val($(this).val().substring(0,300));
		}else{//300자 이하인 경우
			let remain = 300 - inputLength;
			remain += '/300';
			if($(this).attr('id')=='re_content'){
				//등록폼 글자수
				$('#re_first .letter-count').text(remain);
			}else{
				//수정폼 글자수
				$('#mre_first .letter-count').text(remain);
			}
		}
	});
	//댓글 수정 버튼 클릭시 수정폼 노출
	$(document).on('click','.modify-btn',function(){
		//댓글 글번호
		let reply_num = $(this).attr('data-num');
		//댓글 내용
		let content = $(this).parent().find('p.content-item').html().replace(/<br>/gi,'\r\n');
		//댓글 수정폼 ui
		let modifyUI = '<form id="mre_form">';
		modifyUI += '<input type="hidden" name="reply_num" id="mre_num" value="'+reply_num+'">';
		modifyUI += '<textarea rows="3" cols="50" name="re_content" id="mre_content" class="rep-content">'+content+'</textarea>';
		modifyUI += '<div id="mre_first"><span class="letter-count">300/300</span></div>';
		modifyUI += '<div id="mre_second" class="align-right">';
		modifyUI += ' <input type="submit" value="수정" class="round inwhite">';
		modifyUI += ' <input type="button" value="취소" class="re-reset">';
		modifyUI += '</div>';
		//modifyUI += '<hr size="1" noshade width="96%">';
		modifyUI += '</form>';
		
		initModifyForm();
		//수정 버튼 감싸고 있는 div
		$(this).parent().hide();
		
		//수정폼 수정하고자 하는 데이터 있는 div에 노출
		$(this).parents('.item').append(modifyUI);
		
		//입력한 글자수 셋팅
		let inputLength = $('#mre_content').val().length;
		let remain = 300 - inputLength;
		remain += '/300';
		//문서객체에 반영
		$('#mre_first .letter-count').text(remain);
		
	});
	//수정폼에서 취소 버튼 클릭시 수정폼 초기화
	$(document).on('click','.re-reset',function(){
		initModifyForm();
	});
	//댓글 수정 폼 초기화
	function initModifyForm(){
		$('.sub-item').show();
		$('#mre_form').remove();
	}
	//댓글 수정
	$(document).on('submit','#mre_form',function(event){
		
		if($('#mre_content').val().trim()==''){
			alert('내용을 입력해 주세요');
			$('#mre_content').val('').focus();
			return false;
		}
		
		//폼에 입력한 데이터 반환
		let data = $(this).serialize();
		//데이터 전송
		$.ajax({
			url:'updateReply.do',
			type:data,
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인 후 수정 가능합니다.');
				}else if(param.result == 'success'){
					//수정 데이터 표시
					$('#mre_form').parent().find('p').html($('#mre_content').val().replace(/</g,'&lt;').replace(/>/g, '&gt;').replace(/\r\n/g, '<br>').replace(/\r/g, '<br>').replace(/\n/g, '<br>'));
					
					//수정폼 초기화
					initModifyForm();
					
				}else if(param.result == 'wrongAccess'){
					alert('타인의 글은 수정할 수 없습니다.');
				}else{
					alert('수정시 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
		//기본 이벤트 제거
		event.preventDefault();
	});
	
	
	//댓글 삭제
	$(document).on('click','.delete-btn',function(){
		//댓글 번호
		let reply_num = $(this).attr('data-num');
		
		$.ajax({
			type:'post',
			url:'deleteReply.do',
			data:{reply_num:reply_num},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인해야 삭제할 수 있습니다.');
				}else if(param.result == 'success'){
					alert('삭제완료');
					selectData(1,$('#board_num').val());
				}else if(param.result == 'wrongAccess'){
					alert('타인의 글을 삭제할 수 없습니다.');
				}else{
					alert('댓글 삭제시 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류발생');
			}
		});
	});
	
	//초기 데이터(목록) 호출
	selectData(1,$('#board_num').val());
	
});



