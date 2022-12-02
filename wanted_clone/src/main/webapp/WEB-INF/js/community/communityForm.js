$(function(){
	//시작시 best글 불러오기
	title_page_numberChange();
	var id = $('#session_id').val();
	boardList();
	
	$('.container_main__body__best_hit__content__example').eq(1).css('background-color','#E4F4EC');
	$('.container_main__body__best_hit__content__example').eq(2).css('background-color','#F7F2F9');
	
	//첫 시작화면 아이디 체크.
	if(id != ""){
		$('.container_sub__my_community__body__profile__login_condition > a').children('span').empty().text(id);
		$('.container_main__body__boardwrite__user_icon').css('display','flex');
	}
	

$('.container_main__body__boardlist__content__content').on("click", function(){
	var haha = $(this).parent().find('input').val();
	alert('awdawd');
})


$('.container_main__body__boardlist__content__content').click(function(){
	alert("hahahahah");
});


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
				$('.container_main__body__best_hit__content__example__id_name').eq(i-1).text(data[i].id_);
				$('.container_main__body__best_hit__content__example > a').eq(i-1).attr('href','/controller/community/communityBoard?seq='+data[i].seq);
				}
				
			},
			error: function(err){
				console.log(err);
			}
		});
	
	}
	
	//게시물 뿌리기
	function boardList(){
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
							
							var words = (data[i].theme).split(';');
							
							for(var word in words){
								//태그1인분 만들기
								var tag_item = $('<input>');
								tag_item.attr('type','button')
								tag_item.addClass('content__tag');
								tag_item.val(words[word]);
	
								tag.append(tag_item);
							
							
							}
							
							
							
							//글 좋아요,댓글
							var bottom = $('<div>');
							bottom.addClass('container_main__body__boardlist__content__bottom');
							
							var div_like = $('<div>');
							var div_comment = $('<div>');
							var span_like = $('<span>');
							var span_comment = $('<span>');
							
							
							var like = $('<i>');
							like.addClass('fa-regular fa-thumbs-up fa-lg');
							div_like.append(like,span_like);
							
							span_like.html(data[i].like_count);						
							
							
							
							var comment = $('<i>');
							comment.addClass('fa-regular fa-comment fa-lg');
							div_comment.append(comment,span_comment);
							
							span_comment.html(data[i].comment_);
							
							
							//마지막 선
							var hr = $('<div>');
							hr.addClass('boardList_hr');
							
							var a = $('<a>');
							a.addClass('.hidden_seq')
							a.attr('href','/controller/community/communityBoard?seq='+data[i].seq);
							
							bottom.append(div_like,div_comment);
							a.append(content_content);
							
							content.append(profile.append(profile_img).append(span_id)).append(title)
							.append(a).append(tag).append(bottom).append(hr);
							
							$('.container_main__body__boardlist').append(content);
						}//for문
				
			},
			error: function(err){
				console.log(err);
			}
	
		});
}
	//무한스크롤 이벤트 구현
	$(window).scroll(function(){
		
		if($(window).scrollTop() >= $(document).height() - $(window).height()){
		 	var scrollPg = Number($('#scrollPg').val()) + 1;
		 	$('#scrollPg').val(scrollPg);
		 	boardList();	
	 	}	
	

	});
	
	
});














