<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- header 상단 메뉴 바 -->


   <div class="header">
      <div class="nav-bar">
         <ul class="nav-bar__hamberger">

            <div class="nav-bar__hamberger-icon-container">
               <li>
                  <a href="#"> <img class="nav-bar__hamberger-icon"
                     src="/controller/img/nav_bar_hamberger_icon.webp"
                     alt="nav_bar_hamberger_icon" />
                  </a>
                  <ul class="nav-bar__hamberger__menu">
                     <li><a href="#">직군전체</a></li>
                     <li><a href="#">개발</a>
                        <ul class="nav-bar__hamberger__submenu">
                           <li><a href="#">개발전체</a></li>
                           <li><a href="#">웹개발자</a></li>
                           <li><a href="#">서버 개발자</a></li>
                           <li><a href="#">소프트웨어 엔지니어</a></li>
                           <li><a href="#">프론트엔드 개발자</a></li>
                           <li><a href="#">자바 개발자</a></li>
                           <li><a href="#">안드로이드 개발자</a></li>
                           <li><a href="#">C,C++ 개발자</a></li>
                           <li><a href="#">Node.js 개발자</a></li>
                           <li><a href="#">ios 개발자</a></li>
                           <li><a href="#">데이터 엔지니어</a></li>
                           <li><a href="#">파이썬 개발자</a></li>
                           <li><a href="#">시스템, 네트워크 관리자</a></li>
                           <li><a href="#">DevOps/ 시스템 관리자</a></li>
                           <li><a href="#">머신러닝 엔지니어</a></li>
                           <li><a href="#">기술지원</a></li>
                           <li><a href="#">개발 매니저</a></li>
                           <li><a href="#">빅데이터 엔지니어</a></li>
                           <li><a href="#">데이터 사이언티스트</a></li>
                           <li><a href="#">QA,테스트 엔지니어</a></li>
                           <li><a href="#">보안엔지니어</a></li>
                           <li><a href="#">프로덕트 매니저</a></li>
                           <li><a href="#">DBA</a></li>
                        </ul></li>
                     <li><a href="#">경영</a></li>
                     <li><a href="#">디자인</a></li>
                     <li><a href="#">영업</a></li>
                     <li><a href="#">고객서비스</a></li>
                     <li><a href="#">게임제작</a></li>
                     <li><a href="#">HR</a></li>
                     <li><a href="#">미디어</a></li>
                     <li><a href="#">엔지니어링</a></li>
                     <li><a href="#">금융</a></li>
                     <li><a href="#">교육</a></li>
                     <li><a href="#">의료</a></li>
                  </ul></li>
            </div>
            <div class="nav-bar__main-logo-container">
               <h1 class="nav-bar__main-logo">
                  <!-- 네비게이션바 메인 로고 -->
                  <a href="http://localhost:8080/controller/"> <!-- 캡쳐도구로 잘라서 넣어 상하 정렬이 맞지 않는 상태 추후 수정 예정 -->
                     <img class="nav-bar__main-logo__img"
                     src="/controller/img/logo/nav_bar_logo.png" alt="nav_bar_logo" />
                  </a>
               </h1>
         </ul>
      </div>
      <!--
          nav-bar__menu-list
        -->
      <ul class="nav-bar__menu-list__category">
         <li><a class="nav-bar__menu-list__category__link" href="http://localhost:8080/controller/job/jobList">채용
         </a></li>
         <li><a class="nav-bar__menu-list__category__link" href="#">직군별 연봉</a></li>
             <li><a class="nav-bar__menu-list__category__link" href="http://localhost:8080/controller/resume/">이력서</a>
         </li>
         <li><a class="nav-bar__menu-list__category__link" href="http://localhost:8080/controller/community/communityForm">커뮤니티</a>
         </li>
      </ul>
      <!--
           -->
      <ul class="nav-bar__menu-list__service">
         <li class="nav-bar__menu-list__service__list"><a href="#"> <i
               class="fa-solid fa-magnifying-glass"></i>
         </a></li>
         <li class="nav-bar__menu-list__service__list"><a href="#"> <i
               class="fa-regular fa-bell"></i>
         </a></li>
         <c:if test="${id==null}">
         	<li class="nav-bar__menu-list__service__list">
         		<input type="button" value="로그인/회원가입" onclick="location.href='/controller/user/loginForm'">
         	</li>
         </c:if>
           <c:if test="${id!=null}">
         	<li class="nav-bar__menu-list__service__list">
         	<a href="#"> 
         	<img
               class="nav-bar__menu-list__service__list__profile-img"
               src="/controller/img/profile_default.png" alt="profile_default" />    
         	</a>
         	<div class="nav-bar__menu-list__service__list__profile-popover">
         		<ul class="nav-bar__menu-list__service__list__profile-popover__menu">
         			<li class="nav-bar__menu-list__service__list__profile-popover__menu__list">
         			<a href="#">MY 원티드</a>
         			</li>
         			<li class="nav-bar__menu-list__service__list__profile-popover__menu__list">
         			<a href="#">프로필</a>
         			</li>
         			<li class="nav-bar__menu-list__service__list__profile-popover__menu__list">
         			<a href="#">로그아웃</a>
         			</li>
         		</ul>
         	</div>
         	</li>
         </c:if>

    
         <div class="nav-bar__menu-list__service__list__profile-popover__background"></div>
         
         <li><a href="#">
               <div class="nav-bar__menu-list__service__list__corperation-service">기업서비스</div>
         </a></li>
      </ul>
   </div>
   <!-- nav-bar -->
   </div>
   <script
      src="https://code.jquery.com/jquery-3.6.1.js"
      integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
      crossorigin="anonymous"
    ></script>
   <script type="text/javascript" src="/controller/js/component/header.js"></script>
