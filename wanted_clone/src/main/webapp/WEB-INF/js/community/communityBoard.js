$(function(){
	
	var id = $('#session_id').val();
	var sortnum = $('#sortnum').val();
	//주소창값 가져와서 seq 변수지정
	const urlParams = new URL(location.href).searchParams;
	const seq = urlParams.get('seq');
	
	//글 정보 가져오기
	$.ajax({
		type: 'post',
		url: '/controller/community/getBoard',
		data: 'seq=' + seq,
		dataType: 'json',
		success : function(data){
			$('.profile_id').text(data.id_);
			$('.community_board__title').text(data.title);
			$('.community_board__content').text(data.content_);
			
			//태그 추가
	
			var words = (data.theme).split(';');
			
			for(var word in words){
				//태그1인분 만들기
				var tag = $('<input>');
				tag.attr('type','button')
				tag.addClass('community_board__theme_tag_item');
				tag.val(words[word]);

				$('.community_board__theme_tag').append(tag);
			
			
			}
			
			
			$('.community_board__bottom__like > span').text(data.like_count);
			$('.community_board__bottom__coment > span').text(data.comment_);
			console.log('로그인아이디 = ' + id );
			console.log('아이디 = ' + data.id_ );
			if(id == data.id_){
				$('#community_board__update_btn').show();
				$('#community_board__delete_btn').show();
			}
			if(sortnum == '0'){$('#community_board__delete_btn').show();}
			
			$('.community_comment__profile__name_user > span').html(id);
			
		},
		error: function(err){
			console.log(err);
		}
	});
	
	//글 삭제
	$('#community_board__delete_btn').click(function(){
		if(confirm('정말로 글을 삭제하시겠습니까?')){
			$.ajax({
				type: 'post',
				url: '/controller/community/deleteBoard',
				data: 'seq=' + seq,
				success: function(){
					alert('삭제완료');
					location.href='/controller/community/communityForm';
				},
				error: function(err){
					console.log(err);
				}
			});
		}
	});

	//글 수정
	$('#community_board__update_btn').click(function(){
		$('#community_board__update_complete_btn').show()
		
		title_item = $('.community_board__title').text();	
		$('.community_board__title').remove();
		var title = $('<input>');
		title.attr('type','text');
		title.addClass('community_board__title');
		
		
		content_item = $('.community_board__content').text();
		$('.community_board__content').remove();
		var content = $('<textarea>');
		content.addClass('community_board__content');
		
		
		$('#update_hidden_box').append(title).append(content);
		
		$('.community_board__title').val(title_item);
		$('.community_board__content').text(content_item);
	});
	
	$('#community_board__update_complete_btn').click(function(){
		let title = $('.community_board__title').val();
		let content = $('.community_board__content').val();
		
		$.ajax({
			type:'post',
			url: '/controller/community/updateBoard',
			data: 'seq=' + seq + '&title=' + title + '&content_=' + content,
			success: function(){
				location.reload();
			},
			error: function(err){
				console.log(err);
			}
		});
	
	});
	
	//댓글 작성하려고 누를 시 로그인 유무 확인
	$('.community_comment__write__content').click(function(){
		if(id == ''){
			alert('로그인 후 이용해주세요');
			location.href = '/controller/user/loginForm';
		}else{
			$('#community_comment__write__content_body__btn').css('color','blue');
		}
		
	});
	
	//댓글 작성
	$('.community_comment__write__content_body__btn').click(function(){
		if($('.community_comment__write__content').val() == ''){
			alert('[WARNING]  댓글의 내용이 없습니다.');
		}else{
			$.ajax({
				type: 'post',
				url: '/controller/community/commentWrite',
				data: 'seq=' + seq + '&id_=' + id + '&comment_=' + $('.community_comment__write__content').val() 
						+  '&title=' + $('.community_board__title').text(),
				success: function(){
					location.reload();
				},
				error: function(err){
				console.log(err);
				}
			
			});
		}
	});
	
	
	
	//좋아요 버튼 클릭시
	var like_btn = false;
	$('.fa-thumbs-up').click(function(){
		if(like_btn == false){
			like_btn = true;
			var count = Number($('.community_board__bottom__like > span').text()) + 1;
		 	$('.community_board__bottom__like > span').html(count);
		 	$('.community_board__bottom__like').css('color','red');
		 	
		}else{
			like_btn = false;
			var count = Number($('.community_board__bottom__like > span').text()) - 1;
		 	$('.community_board__bottom__like > span').html(count);
		 	$('.community_board__bottom__like').css('color','black');
		}
		
		$.ajax({
			type: 'post',
			url: '/controller/community/likeBtn',
			data: 'like=' + like_btn + '&seq=' + seq,
			success:function(){},
			error: function(err){
				console.log(err);
				}
		});
	});
	

});