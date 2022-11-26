$(function(){
	//시작시 best글 불러오기
	title_page_numberChange();
	
	$('.container_main__body__best_hit__content__example').eq(1).css('background-color','#E4F4EC');
	$('.container_main__body__best_hit__content__example').eq(2).css('background-color','#F7F2F9');
	//첫 시작화면 아이디 체크.
	$.ajax({
		type:'post',
		url:'/controller/community/checkId',
		success: function(data){
			if(data != ""){
				$('.container_sub__my_community__body__profile__login_condition').children('span').empty().text(data);
				$('.container_main__body__boardwrite__user_icon').css('display','flex');
			}else{}
		},
		error: function(err){
			console.log(err);
		}
	});
	

	//my커뮤니티 눌렀을때
	$('.container_sub__my_community__body__title').click(function(){});
	
	//글쓰기 눌렀을때
	$('#container_main__body__boardwrite').click(function(){});
	

	//페이지 왼쪽 눌렀을때	
	$('.container_main__body__best_hit__title_page').children('.fa-circle-left').click(function(){
		var num = $('#title_page_number').text();
		if(Number(num) > 1){
			num = Number(num)-1;
			$('#title_page_number').text(num);	
			title_page_numberChange();
		}
		
	});
	//페이지 오른쪽 눌렀을때	
	$('.container_main__body__best_hit__title_page').children('.fa-circle-right').click(function(){
		var num = $('#title_page_number').text();
		
		if(Number(num) < 3){
			num = Number(num)+1;
			$('#title_page_number').text(num);	
			title_page_numberChange();
		}
	});
	//페이지 기반 best글 가져오는 함수
	function title_page_numberChange(){
		$.ajax({
			type: 'post',
			url: '/controller/community/bestBoard',
			data : 'pg=' + $('#title_page_number').text(),
			dataType: 'json',
			success: function(data){
				for(var i=0; i < 3; i++){
				$('.container_main__body__best_hit__content__example__content').eq(i-1).text(data[i].title);
				$('.container_main__body__best_hit__content__example__id').eq(i-1).text(data[i].id_);
				}
				
			},
			error: function(err){
				console.log(err);
			}
		});
	
	}
	
	//무한스크롤 전 게시물 뿌리기
	$.ajax({
		type: 'post',
		url: '/controller/community/boardList',
		data: 'scrollPg=' + $('#scrollPg').val(),
		dataType: 'json',
		success: function(data){
			//console.log(JSON.stringify(data));
			
			for(let i in data){
			
				//전체 내용바디
				var content = $('<div>');
				content.addClass('container_main__body__boardlist__content');
				
				//프로필
				var profile = $('<div>');
				profile.addClass('container_main__body__boardlist__content__profile');
				
				//프로필사진
				var profile_img = $('<img>');
				profile_img.addClass('container_main__body__boardlist__content__profile_img');
				profile_img.attr('src','../img/profile_default.png');
				
				//아이디
				var span_id = $('<span>');
				span_id.html('&nbsp;&nbsp;'+ data[i].id_ );
				
				//글 제목
				var title = $('<div>');
				title.addClass('container_main__body__boardlist__content__title');
				title.html(data[i].title);
				
				//글 내용
				var content_content = $('<div>');
				content_content.addClass('container_main__body__boardlist__content__content');
				content_content.html(data[i].content_);
				
				//글 태그
				var tag = $('<div>');
				tag.addClass('container_main__body__boardlist__content__tag');
				tag.html(data[i].theme);
				
				//글 좋아요,댓글
				var bottom = $('<div>');
				bottom.addClass('container_main__body__boardlist__content__bottom');
				bottom.html(data[i].like_count + ".." + data[i].view_count);
				
				//마지막 선
				var hr = $('<div>');
				hr.addClass('hr');
				
				content.append(profile.append(profile_img).append(span_id)).append(title)
				.append(content_content).append(tag).append(bottom).append(hr);
				
				$('.container_main__body__boardlist').append(content);
				
			}//for문
			
		},
		error: function(err){
			console.log(err);
		}

	});

	//무한스크롤 이벤트 구현
	$(window).scroll(function(){
		
		if($(window).scrollTop() >= $(document).height() - $(window).height()){
		 	var scrollPg = Number($('#scrollPg').val()) + 1;
		 	$('#scrollPg').val(scrollPg);
		 	
	 		$.ajax({
				type: 'post',
				url: '/controller/community/boardList',
				data: 'scrollPg=' + $('#scrollPg').val(),
				dataType: 'json',
				success: function(data){
					//console.log(JSON.stringify(data));
					
					for(let i in data){
					
						//전체 내용바디
						var content = $('<div>');
						content.addClass('container_main__body__boardlist__content');

						//프로필
						var profile = $('<div>');
						profile.addClass('container_main__body__boardlist__content__profile');
						
						//프로필사진
						var profile_img = $('<img>');
						profile_img.addClass('container_main__body__boardlist__content__profile_img');
						profile_img.attr('src','../img/profile_default.png');
						
						//아이디
						var span_id = $('<span>');
						span_id.html('&nbsp;&nbsp;'+ data[i].id_ );
						
						//글 제목
						var title = $('<div>');
						title.addClass('container_main__body__boardlist__content__title');
						title.html(data[i].title);
						
						//글 내용
						var content_content = $('<div>');
						content_content.addClass('container_main__body__boardlist__content__content');
						content_content.html(data[i].content_);
						
						//글 태그
						var tag = $('<div>');
						tag.addClass('container_main__body__boardlist__content__tag');
						tag.html(data[i].theme);
						
						//글 좋아요,댓글
						var bottom = $('<div>');
						bottom.addClass('container_main__body__boardlist__content__bottom');
						bottom.html(data[i].like_count + ".." + data[i].view_count);
						
						//마지막 선
						var hr = $('<div>');
						hr.addClass('hr');
						
						
						content.append(profile.append(profile_img).append(span_id)).append(title)
						.append(content_content).append(tag).append(bottom).append(hr);
						
						$('.container_main__body__boardlist').append(content);
					}//for문
					
				},
				error: function(err){
					console.log(err);
				}
			}); //ajax
		}//if
	});//무한 스크롤
	


});














