<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	

</style>
<link rel="stylesheet" href="../css/styles.css" />
</head>
<body>
        <div class="resume-form-cotainer">
                <div class="resumeForm-language-and-download">
                    <div class="resumeForm-language">
                    <select name="resumeForm-language-select" id="resumeForm-language-select">
                        <option value="KR">한국어</option>
                        <option value="EN">English</option>
                        <option value="JP">日本語</option>
                        <option value="CH">繁體中文</option>
                    </select>
                    <div class="resumeForm-download">
                        <i class="fa-solid fa-down-to-line"></i>
                    </div>
                </div>
            </div>
    	<form action="" name="resumeForm" id="resumeForm">
            <div class="form-wrapper">
                <div class="resume-name">
                     이력서 이름
                    <input type="text" id="formName" name="formName" /><br>
                     아이디
                    <input type="text" id="id" name="id" /><br>
                     이름
                    <input type="text" id="name" name="name" /><br>
                     이메일
                    <input type="text" id="email" name="email" /><br>
                     전화번호
                    <input type="text" id="phoneNum" name="phoneNum" /><br>
                     간단 소개글
                    <input type="text" id="introduce" name="introduce" /><br>
                     경력
                    <input type="text" id="career" name="career" /><br>
                     학력
                    <input type="text" id="education" name="education" /><br>
                     수상
                    <input type="text" id="award" name="award" /><br>
                     외국어
                    <input type="text" id="language" name="language" /><br>
                     파일 업로드
                    <input type="text" id="portfolio" name="portfolio" /><br>
                     작성중
                    <input type="text" id="writing" name="writing" /><br>
                </div>
            </div>
	  	</form>
     </div>
      <input type="button" value="test" id="test">

	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://kit.fontawesome.com/1f61694686.js"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.1.js"
		integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
		crossorigin="anonymous"></script>
		
		<script type="text/javascript">
			$("#test").click(function(){
				$.ajax({
					url: "resumeWrite",
					type: "post",
					data: $("#resumeForm").serialize(),
					success: function(){
						alert("등록완료")
					},
					error: function(request, status, error){
				        console.log("code: " + request.status)
				        console.log("message: " + request.responseText)
				        console.log("error: " + error);
				      }
				});
			});
		
		</script>
</body>
</html>