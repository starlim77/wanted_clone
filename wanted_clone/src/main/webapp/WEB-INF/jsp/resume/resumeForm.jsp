<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/styles.css">
</head>
<body>
	<div class="resume-form-wrapper">
        <div class="resume-form-cotainer">
        	<div class="resumeForm-language-and-download">
        		<select class="resumeForm-language-select">
        			 <option value="KR">한국어</option>
	                 <option value="EN">English</option>
	                 <option value="JP">日本語</option>
	                 <option value="CH">繁體中文</option>
        		</select>
        		
	        	<div class="resumeForm-download">
	        	asdfasfd
	        		<i class="fa-sharp fa-solid fa-down-to-bracket"></i>
	        	</div>
        	</div>
        	
        	<form name="resumeForm" class="resume-form">
        		<div class="resume-form__wrapper">
	               <input type="text" class="formName" name="formName" value=${param.formName} ><br>
	               <input type="text" class="id" name="id" value=${id } ><br>
	               <input type="text" class="name" name="name" value=${name }><br>
	               <input type="text" class="tel" name="tel" value=${tel } ><br>
	               
	               <!-- 간단 소개글 -->
	               <div class="intorduce__txt">
	                	간단 소개글
	                </div>
	                <div class="border"></div>
	                <div class="resume-form__introduce">
	                	<div class="resume-form__describe">
	                		<ul>
	                			<li>• 본인의 업무 경험을 기반으로 핵심역량과 업무 스킬을 간단히 작성해주세요.</li>
	                			<li>• 3~5줄로 요약하여 작성하는 것을 추천합니다!
	                		</ul>
	                	</div>
	                	<div class="introduce-div">
		              	 	<textarea class="introduce" name="introduce" value=${param.introduce} ></textarea><br>
		              	</div>
	                </div>
	                
	                <!-- 경력 -->
	                 <div class="intorduce__txt">
	                	경력
	                </div>
	                <div class="border"></div>
	                <div class="resume-form__describe">
                		<ul>
                			<li>• 담당하신 업무 중 우선순위가 높은 업무를 선별하여 최신순으로 작성해주세요.</li>
                			<li>• 신입의 경우, 직무와 관련된 대외활동, 인턴, 계약직 경력 등이 있다면 작성해주세요. </li>
                			<li>• 업무 또는 활동 시 담당했던 역할과 과정, 성과에 대해 자세히 작성해주세요. </li>
                			<li>• 업무 성과는 되도록 구체적인 숫자 혹은 [%]로 표현해주세요! </li>
                			<li>• 커리어 조회 후 기업명이 실제와 다른 경우, 부서명/직책 란에 원하시는 기업명을 작성해주세요. </li>
                		</ul>
	                </div>
	               <input type="text" class="career" name="career" value=${career} ><br>
	               
	               <!-- 학력 -->
	                <div class="intorduce__txt">
	                	학력
	                </div>
	                <div class="border"></div>
	                <div class="resume-form__describe">
                		<ul>
                			<li>• 최신순으로 작성해주세요.</li>
                		</ul>
	                </div>
	               <input type="text" class="education" name="education" value=${education} ><br>
	               
	               <!-- 수상 -->
            	    <div class="intorduce__txt">
	                	수상
	                </div>
	                <div class="border"></div>
	                <div class="resume-form__describe">
                		<ul>
                			<li>• 수상 이력, 직무 관련 자격증, 수료한 교육이나 참석한 외부활동 등이 있다면 간략히 작성해주세요.</li>
                			<li>• 지원하는 회사에서 요구하는 경우가 아니라면 운전면허증과 같은 자격증은 생략하는 것이 좋습니다!</li>
                		</ul>
	                </div>
	               <input type="text" class="award" name="award" value=${award} ><br>
            	    <!-- 외국어 -->
            	    <div class="intorduce__txt">
	                	수상
	                </div>
	                <div class="border"></div>
	                <div class="resume-form__describe">
                		<ul>
                			<li>• 외국어 자격증을 보유한 경우 작성해주세요. </li>
                			<li>• 활용 가능한 외국어가 있다면, 어느정도 수준인지 레벨을 선택해주세요.</li>
                		</ul>
	                </div>
	               <input type="text" class="language" name="language" value=${language} ><br>
	               
	                작성중
	               <input type="text" class="writing" name="writing" ><br>
		           <input type="button" value="test" id="test">
        		</div>
        	</form>
        </div>
        	
        </div> <!-- resume-form-cotainer -->
	        <%-- <div class="resumeForm-language-and-download">
	            <div class="resumeForm-language">
		             <select name="resumeForm-language-select" id="resumeForm-language-select">
		                 <option value="KR">한국어</option>
		                 <option value="EN">English</option>
		                 <option value="JP">日本語</option>
		                 <option value="CH">繁體中文</option>
		             </select>
	            </div>
	          </div>
          </div>
          <div class="resumeForm-download">
               <i class="fa-solid fa-down-to-line"></i>
          </div>

    	<form action="" name="resumeForm" id="resumeForm">
            <div class="resume-form__wrapper">
                이력서 이름
               <input type="text" class="formName" name="formName" value=${param.formName} ><br>
                아이디
               <input type="text" class="id" name="id" value=${id } ><br>
                이름
               <input type="text" class="name" name="name" value=${name }><br>
                전화번호
               <input type="text" class="tel" name="tel" value=${tel } ><br>
                간단 소개글
               <input type="text" class="introduce" name="introduce" value=${param.introduce} ><br>
                경력
               <input type="text" class="career" name="career" value=${career} ><br>
                학력
               <input type="text" class="education" name="education" value=${education} ><br>
                수상
               <input type="text" class="award" name="award" value=${award} ><br>
                외국어
               <input type="text" class="language" name="language" value=${language} ><br>
                파일 업로드
               <input type="text" class="portfolio" name="portfolio" value=${portfolio} ><br>
                작성중
               <input type="text" class="writing" name="writing" ><br>
            </div>
	  	</form>
     </div> --%>
      

	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://kit.fontawesome.com/1f61694686.js"
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

            //작성중인 이력서 블러오기
            $(function(){
                $.ajax({
                    url: "/controller/resume/getWritingResume",
                    type: "post",
                    data: "formName=" + $(".formName").val(),
                    dataType: "json",
                    success: function(data){
                        $(".introduce").val(data.introduce);
                        $(".career").val(data.career);
                        $(".education").val(data.education);
                        $(".award").val(data.award);
                        $(".language").val(data.language);
                        $(".portfolio").val(data.fileName);
                        $(".writing").val(data.writing);
                    },
                    error: function(request, status, error, textStatus){
                        console.log("code: " + request.status);
                        console.log("message: " + request.responseText);
                        console.log("error: " + error);
                        console.log("textStatus: "+textStatus);
                    }
                });
            });
		
		</script>
</body>
</html>