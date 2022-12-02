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
	
		var select_list = new Array();
	        
        $('.selected_button').each(function(){
        	var data = $(this).val();
        	select_list.push(data);
        });	
        
        var String_list = select_list.toString();
		String_list = String_list.replace(/,/gi,';');
		
		if(select_list == ''){
			alert('태그 선택은 필수입니다.');
		}else{
			
			
			$.ajax({
				type: 'post',
				url: '/controller/community/boardWrite',
				data : 'title=' + $('.writebody__title').val() + '&content_=' + $('.writebody__content').val() + '&theme=' + String_list,
				success: function(){
					alert('작성완료');
					location.reload();
				},
				error: function(err){
				console.log(err);
				}
			});
			
		}//else
			
	});
	
	// 플러스 버튼 클릭시
	var plus_btn = false;
	
	$('.fa-square-plus').click(function(){
       	
       	if(plus_btn){
	        $('#button_section').hide();
	        plus_btn = false;
	        
	        //var a = $('.write_tag__ul__button_style').val();
	        
	        var select_list = new Array();
	        
	        $('.write_tag__ul__button_style').each(function(){
	        	var data = $(this).val();
	        	select_list.push(data);
	        });
	        
	        for(var i in select_list){
	        	
	        	var list_item = $('<input>');
	        	list_item.attr('type','button');
	        	list_item.addClass('selected_button');
	        	list_item.val(select_list[i]);
	        	
	        	$('.writebody__top__tag').append(list_item);
	        }
	        
	        
        }else{
        	$('#button_section').show();
	        plus_btn = true;
	        
	        $('.selected_button').remove();
        }
    });
    
    //버튼 스타일 추가 삭제
    var select_length = 0;
    
    $('.write_tag__ul__button').click(function(){
    	if($(this).hasClass('write_tag__ul__button_style')){
    		
    		select_length--;
    		$(this).removeClass('write_tag__ul__button_style');
    	}else{
    		if(select_length >=3){
    			alert('3개까지만 선택해주세요');
    		}else{
    			 select_length++;
    			 $(this).addClass('write_tag__ul__button_style');
    		}
    	
    	}
    });
	
	
});