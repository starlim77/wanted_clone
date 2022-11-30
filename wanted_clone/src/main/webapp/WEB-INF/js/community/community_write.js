$(function(){
	var id = $('#session_id').val();
	
	//로그인 유무 체크후 화면 띄우기
	$('#container_main__body__boardwrite').click(function(){
		if(id != ""){
			$(".write_background").show();
		    $("#writebody").show();
		    document.body.style= 'overflow: hidden';
		}else{
			alert('로그인 후 서비스를 이용해주세요!');
		}
	

	});
	
	//글쓰기 화면 나가기
	$('.write_background').click(function(){
	    
	    $('.writebody__title').val('');
	    $('.writebody__content').val('');
	    
	    $(".write_background").hide();
	    $("#writebody").hide();
	    document.body.style= 'overflow: auto';
	    
	   
	});
	
	
	
	//내용에서 포커스 나왔을떄 버튼 활성화
	$('.writebody__content,.writebody__title').focusout(function(){
		if($('.writebody__title').val() != ''){
			if($('.writebody__content').val() != ''){
				$('#writebody__writeBtn').attr('disabled',false);
				$('#writebody__writeBtn').css('color','#3366ff')
			}
		}
	});
 	
	//글 쓰기 버튼 클릭시
	$('#writebody__writeBtn').click(function(){
			$.ajax({
				type: 'post',
				url: '/controller/community/boardWrite',
				data : 'title=' + $('.writebody__title').val() + '&content_=' + $('.writebody__content').val(),
				success: function(){
					alert('작성완료');
					location.reload();
				},
				error: function(err){
				console.log(err);
				}
			});
			

	
	});
	
	
});