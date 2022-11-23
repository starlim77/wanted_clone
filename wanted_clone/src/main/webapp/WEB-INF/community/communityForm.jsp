<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="controller/img/favicon-192x192.png" />
<link rel="stylesheet" type="text/css" href="../css/styles.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../jsp/component/header.jsp"></jsp:include>


<container class="container">
  
  <div class="container_sub">
    <div class="container_sub__my_community__body">
      <div class="container_sub__my_community__body__title">MY 커뮤니티</div>
      <div class="container_sub__my_community__body__profile">
        <div class="container_sub__my_community__body__profile__img">
          <i id="container_sub__my_community__body__profile__img" class="fa-regular fa-user fa-lg"></i>
        </div>

        <div class="container_sub__my_community__body__profile__login_condition">
          <span>로그인 해주세요</span>
        </div>
        <i id="container_sub__my_community__body__profile__tag" class="fa-solid fa-angle-right fa-lg"></i>
      </div>
    </div>

  </div>


    <div class="container_main__body">
        <div class="container_main__body__theme"></div>
        <div class="container_main__body__best_hit">
          <div class="container_main__body__best_hit__title">
            <h2>이번주 많이 본 글&nbsp;<i class="fa-solid fa-trophy fa-lg"></i></h2>
            <div class="container_main__body__best_hit__title_page">
              <span id="container_main__body__best_hit__title_page_number">1 / 3</span>
              
              <i class="fa-regular fa-circle-left"></i>
              
              <i class="fa-regular fa-circle-right"></i>
            </div>
          </div>

          <div class="container_main__body__best_hit__content">
            <div class="container_main__body__best_hit__content__example">
              <div class="container_main__body__best_hit__content__example__title"><span>&nbsp;&nbsp;조회수 TOP</span></div>
            </div>
            <div class="container_main__body__best_hit__content__example"></div>
            <div class="container_main__body__best_hit__content__example"></div>
          </div>
          
        </div>
        <div class="container_main__body__boardwrite">
          <div class="container_main__body__boardwrite__user_icon"></div>
          <button tpye="button" id="container_main__body__boardwrite">
             커리어와 라이프스타일에 대해 자유롭게 이야기 해주세요!
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
              <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
            </svg>
          </button>
        </div>
    </div>
</container>

<script src="https://kit.fontawesome.com/1f61694686.js" crossorigin="anonymous"></script>
</body>
</html>	