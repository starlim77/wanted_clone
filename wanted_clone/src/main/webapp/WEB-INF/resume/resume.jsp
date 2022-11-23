<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/styles.css">
<style>
#resume-container{
	display: flex;
	overflow: hidden;
	flex-wrap: wrap;
}
#banner-wrap {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	padding-top: 100px;
	padding-left: 100px;
	padding-right: 100px; text-align : center;
	width: 90%;
	text-align: center;
}

#banner-btn {
	width: 70vw;
	height: 12vh;
	background-color: #2b4bc8;
	border-radius: 2vh;
	text-align: left;
	border-color: white;
	vertical-align: middle;
	padding-left: 3vw;
	padding-right: 5vw;
}

#banner-btn__txt {
	display: inline-block;
	position: absolute;
	color: white;
	font-weight: 800;
	font-size: 21px;
	line-height: 26px;
	top: 17vh;
}

#banner-btn__img img {
	display: inline-block;
	position: absolute;
	float: left;
	width: 23vw;
	margin-left: 50vh;
	padding-left: 11.5vw;
	left: 10vw;
	top: 13%;
}

#banner-btn__inner-btn {
	display: flex;
	align-items: center;
	border-radius: 2vh;
	display: inline-block;
	position: absolute;
	width: 10%;
	height: 6%;
	background-color: white;
	text-align: center;
	left: 72%;
	top: 16%;
}

#banner-btn__inner-btn__txt {
	position: absolute;
	font-weight: 800;
	font-size: 15px;
	color: #2b4bc8;
	top: 30%;
	left: 15%;
}

#resume-txt {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	top: 30%;
	height: 2%;
	position: absolute;
	padding-bottom: 3%;
	width: 70vw;
}

#resume-txt:after {
	display: none;
	float: none;
	content: "";
}

#space {
	width: 82%;
	display: flex;
}

.resume {
	display: flex;
	flex-wrap: wrap;
	width: 100%;
	position: relative;
	padding-top: 100px;
	padding-left: 55px;
	padding-right: 55px;
}

#my-new-resume {
	position: relative; 
	display: flex;
	flex-direction: column;
	justify-content: flex-end;
	align-content: center;
	height : 190px;
	width: 190px;;
	margin: 20px, 10px;
	border: 2px solid #dbdbdb;
	background-color: white;
	height: 190px;
	cursor: pointer;
}
#my-new-resume__img{
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
#new-resume-icon{
	margin: auto;
	color: white;
}
.my-new-resume__txt{
	margin-bottom: 10%; 
	height: 20%; 
	
}

</style>
</head>
<body>
	<!--  header -->
	<div>
		<jsp:include page="../jsp/component/header.jsp"></jsp:include>
	</div>
	<div id="resume-container">
		<!-- banner -->
		<div id="banner-wrap">
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
			<div id="resume-txt">
				최근 문서
				<div id="space"></div>
				<div id="resume-intro">
					<a href="#">원티드 이력서 소개</a>
				</div>
			</div>

			<!-- resume -->
			<div class="resume">
				<div id="my-new-resume" onclick="location.href=''">
					<div id="my-new-resume__img">
						<i class="fa-regular fa-clone fa-xl" id="new-resume-icon"></i>
					</div>
					<div class="my-new-resume__txt">
						<h3>새 이력서 작성</h3>
					</div>	
				</div>
			</div>
		</div>
	</div>
	
	 <script src="https://code.jquery.com/jquery-latest.min.js"></script>
	    <script
      src="https://kit.fontawesome.com/1f61694686.js"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://code.jquery.com/jquery-3.6.1.js"
      integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
      crossorigin="anonymous"
    ></script>
</body>
</html>