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