<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/styles.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../component/header.jsp"></jsp:include>


<container class="container">
  
  <div class="container_sub">
    <div class="container_sub__my_community__body">
      <div class="container_sub__my_community__body__title">MY 커뮤니티</div>
      <div class="container_sub__my_community__body__profile">

          <img class="container_sub__my_community__body__profile__img" src="../img/profile_default.png">


        <div class="container_sub__my_community__body__profile__login_condition">
          <span>로그인 해주세요.</span>
        </div>
        <i id="container_sub__my_community__body__profile__tag" class="fa-solid fa-angle-right fa-lg"></i>
      </div>
    </div>

  </div>


    <div class="container_main__body">
    
        <div class="container_main__body__theme_body">
          <div class="container_main__body__theme"></div>
        </div>
        
        <div class="container_main__body__best_hit">
          <div class="container_main__body__best_hit__title">
            <h2>이번주 많이 본 글&nbsp;<i class="fa-solid fa-trophy fa-lg"></i></h2>
            <div class="container_main__body__best_hit__title_page">
              <span id="container_main__body__best_hit__title_page_number"><span id="title_page_number">1</span> / 3</span>
              
              <i id="pageleft" class="fa-regular fa-circle-left"></i>
              
              <i id="pageright" class="fa-regular fa-circle-right"></i>
            </div>
          </div>

          <div class="container_main__body__best_hit__content">
          
            <div class="container_main__body__best_hit__content__example">
              <div class="container_main__body__best_hit__content__example__title"><span>조회수 TOP</span></div>
                <div class="container_main__body__best_hit__content__example__content"></div>
                <div class="container_main__body__best_hit__content__example__id"></div>
            </div>

            <div class="container_main__body__best_hit__content__example">
              <div class="container_main__body__best_hit__content__example__title"><span>조회수 TOP</span></div>
                <div class="container_main__body__best_hit__content__example__content"></div>
                <div class="container_main__body__best_hit__content__example__id"></div>
            </div>

            <div class="container_main__body__best_hit__content__example">
              <div class="container_main__body__best_hit__content__example__title"><span>조회수 TOP</span></div>
                <div class="container_main__body__best_hit__content__example__content"></div>
                <div class="container_main__body__best_hit__content__example__id"></div>
            </div>
          </div>
        </div>
        
        <div class="container_main__body__boardwrite">
          <img class="container_main__body__boardwrite__user_icon" src="../img/profile_default.png" />
          <button type="button" id="container_main__body__boardwrite">
             커리어와 라이프스타일에 대해 자유롭게 이야기 해주세요!
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
              <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
            </svg>
          </button>
        </div>

        <div class="container_main__body__boardlist">
        	<div class="container_main__body__boardlist__recommand">
	        	<div class="container_main__body__boardlist__recommand__title">
	                <span>추천 커뮤니티글 <i id="heart" class="fa-solid fa-heart"></i></span>
	            </div>
	            <div class="container_main__body__boardlist__recommand__tag">
	             	<span>#커리어고민</span>&nbsp;
	                <span>#취업/이직</span>&nbsp;
	                <span>#회사생활</span>&nbsp;
	                <span>#인간관계</span>&nbsp;
	                <span>#IT/기술</span>&nbsp;
	                <span>#라이프스타일</span>&nbsp;
	                <span>#리더십</span>&nbsp;
	                <span>#조직문화</span>&nbsp;&nbsp;
	                <i class="fa-solid fa-angle-right fa-lg"></i>
	            </div>
	            <hr class="hr">
        	</div>
        </div>
        
    </div>
    
    <input type="hidden" id="scrollPg" value="1">
</container>

<script src="https://kit.fontawesome.com/1f61694686.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script><!-- CDN 방식 -->
<script type="text/javascript" src="../js/community/communityForm.js"></script>

</body>
</html>	