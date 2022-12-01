<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="./css/styles.css" />
    <meta charset="UTF-8" />
    <title>원티드 - 나다운 일의 시작</title>
    <link rel="icon" href="./img/favicon-192x192.png" />
  <body>
    <!-- header 상단 메뉴 바 -->
    <jsp:include page="./component/header.jsp"></jsp:include>
    <article>
      <!-- <section>banner</section> -->

      <!-- <section>   insight -->

      <jsp:include page="./component/insight.jsp"></jsp:include>


      <!-- <section>   insight -->
	
      <!-- <section>크리에이터 추천</section>
      <section>3분만에 읽는 아티클</section>
      <section>커리어 성장을 위한 맞춤 이벤트</section>
      <section>채용정보를 찾고 계셨나요</section> -->
    </article>

    <!-- footer -->

    <jsp:include page="./component/footer.jsp"></jsp:include>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
    <script
      src="https://kit.fontawesome.com/1f61694686.js"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://code.jquery.com/jquery-3.6.1.js"
      integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
      crossorigin="anonymous"
    ></script>
    <script src="./js/component/header.js"></script>
    <script src="./js/component/insight__nav-bar.js"></script>
    <script>
      $(function(){
          var naver_id_login = new window.naver_id_login("jTI17Eg735RLpdY6fa9_", "http://localhost:8080/controller/");
          // 접근 토큰 값 출력
          alert('<h4>접속토큰:'+naver_id_login.oauthParams.access_token+'</h4>');
          // 네이버 사용자 프로필 조회
          naver_id_login.get_naver_userprofile(naverSignInCallback());
          // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
          function naverSignInCallback() {
            const email = naver_id_login.getProfileData("email");
            const nickname = naver_id_login.getProfileData('nickname');
            const name = naver_id_login.getProfileData('name');
            const age = naver_id_login.getProfileData('age');
            const gender = naver_id_login.getProfileData('gender');
            const birthday = naver_id_login.getProfileData('birthday');
            const mobile = naver_id_login.getProfileData('mobile');

          console.log('<h4>이메일:'+email+'</h4>');
          console.log('<h4>닉네임:'+nickname+'</h4>');
          console.log('<h4>이름:'+name+'</h4>');
          //body.append('<h4>나이:'+age+'</h4>');
          console.log('<h4>성별:'+gender+'</h4>');
          console.log('<h4>생일:'+birthday+'</h4>');
          console.log('<h4>전화번호:'+mobile+'</h4>');
          }

      });
    </script>
  </body>
</html>
