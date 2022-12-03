<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/styles.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="communityBody">
<jsp:include page="../component/header.jsp"></jsp:include>


<container class="container">
  
  <div class="container_sub">
    <div class="container_sub__my_community__body">
      <div class="container_sub__my_community__body__title">MY 커뮤니티</div>
      <div class="container_sub__my_community__body__profile">
        <div class="container_sub__my_community__body__profile__login_condition">
          <img class="container_sub__my_community__body__profile__img" src="../img/profile_default.png">
          <a href = '/controller/user/loginForm'><span>로그인 해주세요</span></a>
        </div>
        <i id="container_sub__my_community__body__profile__tag" class="fa-solid fa-angle-right fa-lg"></i>
      </div>
    </div>

  </div>


    <div class="container_main__body">
    
        <div class="container_main__body__theme_body">
          <div class="container_main__body__theme">
          
	          <div class="container_main__body__theme__scroll-left-icon">
	       		<i class="fa-solid fa-chevron-left"></i>
	    	  </div>
	   		  <div class = "container_main__body__theme_body_action">
	      	    <section class="container_main__body__theme_body_section">
	           		<ul class="container_main__body__theme_list">
	              		<li>
		                    <input type="button" class="container_main__body__theme_list__button theme_list_style" value="전체">
		                    <input type="button" class="container_main__body__theme_list__button" value="커리어고민">
		                    <input type="button" class="container_main__body__theme_list__button" value="취업/이직">
		                    <input type="button" class="container_main__body__theme_list__button" value="회사생활">
		                    <input type="button" class="container_main__body__theme_list__button" value="인간관계">
		                    <input type="button" class="container_main__body__theme_list__button" value="개발">
		                    <input type="button" class="container_main__body__theme_list__button" value="데이터">
		                    <input type="button" class="container_main__body__theme_list__button" value="마케팅">
		                    <input type="button" class="container_main__body__theme_list__button" value="컨텐츠 제작">
		                    <input type="button" class="container_main__body__theme_list__button" value="IT/기술">
		                    <input type="button" class="container_main__body__theme_list__button" value="리더쉽">
		                    <input type="button" class="container_main__body__theme_list__button" value="조직문화">
	               		</li>
	           		</ul>
	       		</section>  
	   		 </div> 
		     <div class="container_main__body__theme__scroll-right-icon">
		         <i class="fa-solid fa-chevron-right"></i>
		     </div>
		     <div class="container_main__body__theme__show-all-icon">
		         <i class="fa-solid fa-ellipsis"></i>
		     </div>

          </div>
        </div>
        
        <div class="container_main__body__best_hit">
          <div class="container_main__body__best_hit__title">
            <h2>이번주 많이 본 글&nbsp;🏆</h2>
            <div class="container_main__body__best_hit__title_page">
              <span id="container_main__body__best_hit__title_page_number"><span id="title_page_number">1</span> / 3</span>
              
              <i id="pageleft" class="fa-regular fa-circle-left"></i>
              
              <i id="pageright" class="fa-regular fa-circle-right"></i>
            </div>
          </div>

          <div class="container_main__body__best_hit__content">
          
            <div class="container_main__body__best_hit__content__example">
                <div class="container_main__body__best_hit__content__example__title"><span>조회수 TOP</span></div>
               	<a>
               		<div class="container_main__body__best_hit__content__example__content"></div>
               	</a>
               	<div class="container_main__body__best_hit__content__example__id">
               		<img class="container_main__body__best_hit__content__example__id_img" src="../img/profile_default.png">
               		<span class="container_main__body__best_hit__content__example__id_name"></span>
           		</div>
            </div>

            <div class="container_main__body__best_hit__content__example">
	           <div class="container_main__body__best_hit__content__example__title"><span>조회수 TOP</span></div>
               	<a>
               		<div class="container_main__body__best_hit__content__example__content"></div>
               	</a>
               	<div class="container_main__body__best_hit__content__example__id">
               		<img class="container_main__body__best_hit__content__example__id_img" src="../img/profile_default.png">
               		<span class="container_main__body__best_hit__content__example__id_name"></span>
           		</div>
            </div>

            <div class="container_main__body__best_hit__content__example">
              	<div class="container_main__body__best_hit__content__example__title"><span>조회수 TOP</span></div>
               	<a>
               		<div class="container_main__body__best_hit__content__example__content"></div>
               	</a>
               	<div class="container_main__body__best_hit__content__example__id">
               		<img class="container_main__body__best_hit__content__example__id_img" src="../img/profile_default.png">
               		<span class="container_main__body__best_hit__content__example__id_name"></span>
           		</div>
           		
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
	                <span>추천 커뮤니티글 💘</span>
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

<div class="write_background"></div>

    <div id="writebody">
       <div class="writebody__top">
           <div class="writebody__top__tag">
                <i class="fa-regular fa-square-plus fa-2x"></i>
                <section id="button_section">
                    <div id ="write_tag">
                        <ul class="write_tag__ul">
                            <li>
                                <input type="button" class="write_tag__ul__button" value="커리어고민">
                                <input type="button" class="write_tag__ul__button" value="취업/이직">
                                <input type="button" class="write_tag__ul__button" value="회사생활">
                                <input type="button" class="write_tag__ul__button" value="인간관계">
                                <input type="button" class="write_tag__ul__button" value="개발">
                                <input type="button" class="write_tag__ul__button" value="데이터">
                                <input type="button" class="write_tag__ul__button" value="마케팅">
                                <input type="button" class="write_tag__ul__button" value="컨텐츠 제작">
                                <input type="button" class="write_tag__ul__button" value="IT/기술">
                                <input type="button" class="write_tag__ul__button" value="리더쉽">
                                <input type="button" class="write_tag__ul__button" value="조직문화">
                                <span> * 1~3 개를 선택해주세요</span>
                            </li>
                        </ul>    
                    </div>
                </section>
           </div>
           <div class="writebody__top__submit">
               <input type="button" id="writebody__writeBtn" value="등록하기" disabled="true">
           </div>
       </div>
   
       <input class="writebody__title" placeholder="제목을 입력해주세요"> </input>
       <hr class="write_hr">
       <textarea class="writebody__content" placeholder="내용을 입력해주세요"></textarea>

</div> 
<input type="hidden" id="session_id" value="${id }">



<script src="https://kit.fontawesome.com/1f61694686.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script><!-- CDN 방식 -->
<script type="text/javascript" src="../js/community/communityForm.js"></script>
<script type="text/javascript" src="../js/community/community_write.js"></script>

</body>
</html>	