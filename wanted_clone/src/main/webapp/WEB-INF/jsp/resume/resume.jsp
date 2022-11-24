<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/styles.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<style>
#resume-container {
	display: flex;
	overflow: hidden;
	flex-wrap: wrap;
	justify-content: center;
	align-items: center;
	padding-left: 10px;
	padding-right: 10px;
}

#resume-wrap {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	text-align: center;
	padding-top: 100px;
	padding-left: 100px;
	padding-right: 100px;
	text-align: center;
	width: 1080px;
	text-align: center;
}
#banner{
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	text-align: center;
	width: 100%;
}

#banner-btn {
	display: flex;
	gap: 10px;
	align-items: center;
	flex-wrap: wrap;
	width: 100%;
	height: 12vh;
	background-color: #2b4bc8;
	border-radius: 2vh;
	text-align: left;
	border-color: white;
	vertical-align: middle;
	padding-left: 3vw;
	padding-right: 2.5vw;
}

#banner-btn__txt {
	display: inline-block;
	width: 450px;
	color: white;
	font-weight: 800;
	font-size: 21px;
	line-height: 26px;
}

#banner-btn__img{
	width: 300px;
	height: 96px;
	flex-flow:column-reverse;
	justify-content: flex-end;
	float: left;
	margin-left: 3%
}
#banner-btn__img img {
	display: inline-block;
	width: 100%;
	padding-top: 4%;
}

#banner-btn__inner-btn {
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 2vh;
	width: 16%;
	height: 50%;
	margin-left: 3%;
	background-color: white;
	text-align: center;
}

#banner-btn__inner-btn__txt {
	font-weight: 800;
	font-size: 17px;
	color: #2b4bc8;
}

#middle-txt {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	font-weight: 400;
	top: 30%;
	height: 2%;
	padding-top: 3%;
	padding-bottom: 3%;
	width: 100%;
}

#space {
	width: 82%;
	display: flex;
}

.resume {
	display: flex;
	justify-content:flex-start;
	flex-wrap: wrap;
	gap: 30px 55px;
	width: 1065px;
	position: relative;
}

.resume__btn {
	position: relative;
	display: flex;
	flex-direction: column;
	justify-content: flex-end;
	align-content: center;
	height: 25vh;
	width: 27vh;
	border: 2px solid #dbdbdb;
	background-color: white;
	cursor: pointer;
}

#my-new-resume__img {
	display: flex;
	justify-content: center;
	align-content: center;
	border: 2px solid #dbdbdb;
	width: 40%;
	height: 40%;
	margin: auto;
	border-radius: 50%;
	background-color: #3366FF;
}

#new-resume-icon {
	margin: auto;
	color: white;
}

.resume__box__txt {
	margin-bottom: 10%;
	height: 20%;
}
.resume__file-upload{
	position: relative;
	display: flex;
	flex-direction: column;
	justify-content: flex-end;
	align-content: center;
	height: 25vh;
	width: 27vh;
	border: 2px solid #dbdbdb;
	background-color: white;
	cursor: pointer;
}
.file-upload{
	/* display: none; */
}
.resume__btn__upload-img {
	display: flex;
	justify-content: center;
	align-content: center;
	border: 2px solid #dbdbdb;
	width: 40%;
	height: 40%;
	margin: auto;
	border-radius: 50%;
	background-color: #e1e2e3;
}

#resume__upload-icon {
	margin: auto;
	color: #666;
}
.old-resume{
	position: relative;
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	align-content: center;
	height: 25vh;
	width: 27vh;
	border: 2px solid #dbdbdb;
	background-color: white;
	cursor: pointer;
}
.resume-box-top{
	height: 70%;
	border-bottom: 2px solid #dbdbdb;
}
</style>
</head>
<body>
	<!--  header -->
	<div>
		<jsp:include page="../../jsp/component/header.jsp"></jsp:include>
	</div>
	<div id="resume-container">
		<!-- banner -->
		<div id="resume-wrap">
			<div id="banner">
				<button id="banner-btn">
					<h5 id="banner-btn__txt">이력서 작성이 쉬워진다! 1분 만에 채워지는 경력정보</h5>
					<div id="banner-btn__img">
						<img alt="" src="/controller/img/resume/trio.webp">
					</div>
					<div id="banner-btn__inner-btn">
						<div id="banner-btn__inner-btn__txt">내 경력 불러오기</div>
					</div>
				</button>
			</div>
			<!-- *************** -->
			<div id="middle-txt">
				최근 문서
				<div id="space"></div>
				<div id="middle-txt__resume-intro">
					<a href="#">원티드 이력서 소개</a>
				</div>
			</div>

			<!-- 새 이력서 작성 -->
			<div class="resume">
				<div class="resume__btn" onclick="location.href='resumeForm'">
					<div id="my-new-resume__img">
						<i class="fa-regular fa-clone fa-xl" id="new-resume-icon"></i>
					</div>
					<div class="resume__box__txt">
						<h3>새 이력서 작성</h3>
					</div>
				</div>
				<!-- 파일 업로드 -->
				<div class="resume__file-upload">
					<div class="resume__btn__upload-img">
						<i class="fa-light fa-folder-arrow-up" id="resume__upload-icon"></i>
					</div>
					<div class="resume__box__txt">
						<h3>파일 업로드</h3>
					</div>
				</div>
				
				<!-- 등록된 이력서 -->
				<div class="old-resume">
					<div class="resume-box-top">
						
					</div>
					<div class="resume-box-bottom">
						
					</div>
				</div>
				<div class="old-resume">
					<div class="resume-box-top">
						
					</div>
					<div class="resume-box-bottom">
						
					</div>
				</div>
			</div>
				<form action="" id="portfolio-form" >
					<input type="file" class="file-upload" name="portfolio" id="portfolio">
					<input type="button" id="btn" value="파일 전송">
				</form>
				<!--  -->
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://kit.fontawesome.com/1f61694686.js"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.1.js"
		integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
		crossorigin="anonymous"></script>
		<script type="text/javascript">
			$(".resume__file-upload").click(function(){
				$(".file-upload").trigger("click");
			});
			
			$("#btn").click(function(){
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
					},
					error: function(err){
						console.log(err);
					}
				});
			});

			// TODO list로 가져와서 새로운 resume div 만드는지 확인 필요
			$(function() {
				$("#middle-txt__resume-intro").click(function() {
					$.ajax({
						url: "/controller/resume/getResumeList",
						dataType: JSON,
						success:function(data){
							alert(JSON.stringify(data));
						},
						error: function(request, status, error, textStatus){
							console.log("code: " + request.status)
					        console.log("message: " + request.responseText)
					        console.log("error: " + error);
					        console.log("textStatus: "+textStatus);
						}
					});
					
				/* 	var resumeDiv = $(".resume");
					var oldResumeDiv = $("<div/>").addClass("old-resume");
					var resumeBoxTop = $("<div/>").addClass("resume-box-top");
					var resumeBoxBottom = $("<div/>").addClass("resume-box-bottom");
					oldResumeDiv.append(resumeBoxTop).append(resumeBoxBottom).appendTo(resumeDiv); */
				});
			});
		</script>
</body>
</html>