$(function(){
	
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
			console.log(JSON.stringify(data));
			$('.profile_id').text(data.id_);
			$('.community_board__title').text(data.title);
			$('.community_board__content > pre').text(data.content_);
			//태그 추가
			$('.community_board__bottom__like > span').text(data.like_count);
			
		},
		error: function(err){
			console.log(err);
		}
	});


});