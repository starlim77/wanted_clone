function logout(){
	$.ajax({
		method : "get",
		url : "/controller/user/logout" ,
		success : function(){
			location.href = "/controller/";
		}, error : function(err){
			console.log(err);
		}
	});
}

$(function(){
	
	console.log("asdf");

	//로그인 유무 체크후 화면 띄우기
	$('.nav-bar__menu-list__service__list__profile-img').click(function(){

		 //$(".nav-bar__menu-list__service__list__profile-popover__background").show();
	     $(".nav-bar__menu-list__service__list__profile-popover").show();
	    // document.body.style= 'overflow: hidden';
				
			
		});

	
	//글쓰기 화면 나가기
	$('.nav-bar__menu-list__service__list__profile-popover__background').click(function(){
	    
	 /*   $('.writebody__title').val('');
	    $('.writebody__content').val('');*/
	    
	    $(".nav-bar__menu-list__service__list__profile-popover__background").hide();
	    $(".nav-bar__menu-list__service__list__profile-popover").hide();
	    document.body.style= 'overflow: auto';
	       
	});
});


