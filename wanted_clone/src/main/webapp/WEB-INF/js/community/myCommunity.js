$(function(){
	var id = $('#session_id').val();
	
	$('.my_community_body__user_imformation__profile > span').text(id);
	
	
	$('.my_community_body__my_action_kind > li').click(function(){
		if($(this).text() == '작성글'){
			
			$('.contentDTO').remove();
			
			$.ajax({
				type: 'post',
				url: '/controller/community/myCommunityBoard',
				data: 'id='+ id,
				dataType: 'json',
				success: function(data){
					
					
					for(var i in data){
						
						var DTO = $('<div>');
						DTO.addClass('contentDTO');
						
						var title = $('<div>');
						title.addClass('my_community_body__content_body__title');
						var title_span = $('<span>');
						title_span.addClass('my_community_body__content_body__title_span');
						title_span.text(data[i].title);
						
						title.append(title_span);
						
						var content = $('<div>');
						content.addClass('my_community_body__content_body__content');
						var content_span = $('<span>');
						content_span.addClass('my_community_body__content_body__content_span');
						content_span.text(data[i].content_);
						
						var a = $('<a>');
						a.attr('href','/controller/community/communityBoard?seq='+data[i].seq);
						
						content.append(content_span);
						a.append(content);
						
						
						var bottom = $('<div>');
						bottom.addClass('my_community_body__content_body__bottom');
						
						var	first_icon = $('<div>');
						var first_i = $('<i>');
						first_i.addClass('fa-regular fa-thumbs-up');
						var first_span = $('<span>');
						first_span.text(data[i].like_count);
						
						first_icon.append(first_i,first_span);
						
						var	second_icon = $('<div>');
						var second_i = $('<i>');
						second_i.addClass('fa-regular fa-comment');
						var second_span = $('<span>');
						second_span.text(data[i].comment_);
						
						second_icon.append(second_i,second_span);
						
						bottom.append(first_icon,second_icon);
						
						var hr = $('<hr>');
						hr.addClass('content_body_hr');
						
						
						DTO.append(title,a,bottom,hr);
						$('.my_community_body__content_body').append(DTO);
					
					}
					
				},
				error: function(err){
					console.log(err);
				}
			
			});
			
		}else if($(this).text() == '작성댓글'){
			
			$('.contentDTO').remove();
					
			$.ajax({
				type: 'post',
				url: '/controller/community/myCommunityComment',
				data: 'id='+ id,
				dataType: 'json',
				success: function(data){
					
					
					for(var i in data){
						
						var DTO = $('<div>');
						DTO.addClass('contentDTO');
						
						var title = $('<div>');
						title.addClass('my_community_body__content_body__title');
						var title_span = $('<span>');
						title_span.addClass('my_community_body__content_body__title_span');
						title_span.text(data[i].title);
						
						title.append(title_span);
						
						var content = $('<div>');
						content.addClass('my_community_body__content_body__content');
						var content_span = $('<span>');
						content_span.addClass('my_community_body__content_body__content_span');
						content_span.text(data[i].comment_);
						
						var a = $('<a>');
						a.attr('href','/controller/community/communityBoard?seq='+data[i].seq);
						
						content.append(content_span);
						a.append(content);
						
						
						var hr = $('<hr>');
						hr.addClass('content_body_hr');
						
						
						DTO.append(title,a,hr);
						$('.my_community_body__content_body').append(DTO);
					
					}
					
				},
				error: function(err){
					console.log(err);
				}
			
			});
			
		}
	});
});