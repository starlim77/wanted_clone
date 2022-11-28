//포트폴리오 업로드 버튼
$(".resume__file-upload").click(function(){
	$(".file-upload").trigger("click");
});

//포트폴리오 업로드
$("#portfolio").change(function(){
	var formData = new FormData($("#portfolio-form")[0]);
	$.ajax({
		type: "post",
		url: "/controller/resume/fileUpload",
		enctype: 'multipart/form-data',
		processData : false,
		contentType: false,
		data:  formData,
		success: function(){
			alert("업로드 성공");
			location.reload();
		},
		error: function(err){
			console.log(err);
		}
	});
});

//이력서 리스트 생성
$(function() {
	$.ajax({
		url: "/controller/resume/getResumeList",
		dataType: "json",
		success:function(data){
			data.forEach(function(index){
				//topDiv
				var resumeDiv = $(".resume");
				var oldResumeDiv = $("<div/>").addClass("old-resume");
				var h3DivHTML = $("<div/>").addClass("resume-box-top__h3").html(index.formName);
				var pDivHTML = $("<div/>").addClass("resume-box-top__p").html(index.logtime);
				var resumeBoxTop = $("<div/>").addClass("resume-box-top").append(h3DivHTML).append(pDivHTML);
				
				//bottomDiv
				var resumeBoxBottom = $("<div/>").addClass("resume-box-bottom");
				// var resumeBoxBottom = $(".resume-box-bottom");
				if (index.writing === "0") {
					resumeBoxBottom.html("작성중");
				} else if (index.writing === "1") {
					resumeBoxBottom.html("작성 완료");
				} else if (index.writing === null){
					resumeBoxBottom.html("<i class='fa-regular fa-file-lines'></i>&nbsp&nbsp&nbsp&nbsp첨부 완료");
				} else {
					resumeBoxBottom.html("aasdf");
				}
				
				//resumeDiv 생성
				$(".resume__file-upload").after(oldResumeDiv.append(resumeBoxTop).append(resumeBoxBottom).prependTo(resumeDiv));
			});
		},
		error: function(request, status, error, textStatus){
			console.log("code: " + request.status)
			console.log("message: " + request.responseText)
			console.log("error: " + error);
			console.log("textStatus: "+textStatus);
		}
	});
});

//작성중 이력서 페이지 접속
$(document).on("click", ".old-resume", function(){
	location.href="resumeForm?formName="+$(this).children(".resume-box-top").children(".resume-box-top__h3").text();
});
