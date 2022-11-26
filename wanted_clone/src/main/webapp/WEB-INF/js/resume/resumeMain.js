$(".resume__file-upload").click(function(){
	$(".file-upload").trigger("click");
});

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

// TODO list로 가져와서 새로운 resume div 만드는지 확인 필요
	$(function() {
		$.ajax({
			url: "/controller/resume/getResumeList",
			dataType: "json",
			success:function(data){
				data.forEach(function(index){
				var resumeDiv = $(".resume");
				var oldResumeDiv = $("<div/>").addClass("old-resume");
				var h3Div = $("<div/>").addClass("resume-box-top__h3").html(index.formName);
				var pDiv = $("<div/>").addClass("resume-box-top__p").html(index.logtime);
				var resumeBoxTop = $("<div/>").addClass("resume-box-top").append(h3Div).append(pDiv);
				var resumeBoxBottom = $("<div/>").addClass("resume-box-bottom");
				
				$(".resume__file-upload").after(oldResumeDiv.append(resumeBoxTop).append(resumeBoxBottom).prependTo(resumeDiv));
				// oldResumeDiv.append(resumeBoxTop).append(resumeBoxBottom).appendTo(resumeDiv);
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

