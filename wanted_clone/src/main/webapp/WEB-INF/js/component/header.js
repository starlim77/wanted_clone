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
	$('.nav-bar__menu-list__service__list__profile-img').click(function(){
	     $(".nav-bar__menu-list__service__list__profile-popover").show();
	     $(".nav-bar__menu-list__service__list__profile-popover__background").show();
		});

	//글쓰기 화면 나가기
	$('.nav-bar__menu-list__service__list__profile-popover__background').click(function(){
			$(".nav-bar__menu-list__service__list__profile-popover__background").hide();
			$(".nav-bar__menu-list__service__list__profile-popover").hide();
	});
});

function resumeLoginCheck(){
	$.ajax({
		method : "get",
		url : "/controller/resume/resumeLoginCheck" ,
		dataType: "text",
		success : function(data){
			if(data == "0"){
				alert("로그인이 필요합니다")
				location.href = "http://localhost:8080/controller/user/loginForm"
			} else {
				location.href ="http://localhost:8080/controller/resume/"
			}
		}, error : function(err){
			console.log(err);
		}
	});
}