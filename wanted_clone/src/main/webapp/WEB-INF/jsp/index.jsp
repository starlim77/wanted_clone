<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="css/styles.css" />
    <meta charset="UTF-8" />
    <title>원티드 - 나다운 일의 시작</title>
    <link rel="icon" href="./img/favicon-192x192.png" />
  </head>
  <body>
    <!-- header 상단 메뉴 바 -->
    <jsp:include page="./component/header.jsp"></jsp:include>
    <article>
      <!-- <section>banner</section> -->

      <p>${id}</p>
      <!-- <section>   insight -->
      <jsp:include page="./component/insight.jsp"></jsp:include>

      <!-- <section>크리에이터 추천</section>
      <section>3분만에 읽는 아티클</section>
      <section>커리어 성장을 위한 맞춤 이벤트</section>
      <section>채용정보를 찾고 계셨나요</section> -->
    </article>

    <!-- footer -->

    <jsp:include page="./component/footer.jsp"></jsp:include>

    <%-- <%@ include file="./jsp/component/footer.jsp" %> --%>
    <!-- 	<footer class="footer">
  <hr />
  <div class="footer__clickevent">
    <div class="footer__clickevent__nav-bar">
      <img
        class="footer__clickevent__nav-bar__logo"
        src="img/logo/footer_logo.webp"
        alt="footer_logo"
      />
      <ul>
        <li><a href="#">기업소개</a></li>
        <li><a href="#">이용약관</a></li>
        <li><a href="#">개인정보 처리방침</a></li>
        <li><a href="#">고객센터</a></li>
      </ul>
    </div>
    <div class="footer__clickevent__white_space"></div>
    <br />
    <div class="footer__clickevent__nav-bar__icon">
      <a href="https://www.instagram.com/wantedjobs.kr/" target="_blank"
        ><img src="img/sns_icon/instagram.webp" alt="instagram icon"
      /></a>
      <a
        href="https://www.youtube.com/channel/UC0tGZ6MqieGG2m5lA5PeQsw"
        target="_blank"
        ><img src="img/sns_icon/youtube.webp" alt="youtube icon"
      /></a>
      <a href="https://www.facebook.com/wantedkr" target="_blank"
        ><img src="img/sns_icon/facebook.webp" alt="facebook icon"
      /></a>
      <a href="https://blog.naver.com/wantedlab" target="_blank"
        ><img src="img/sns_icon/naver_blog.webp" alt="naver_blog icon"
      /></a>
      <a href="https://pf.kakao.com/_XqCIxl" target="_blank"
        ><img
          src="img/sns_icon/kakaotalk_channel.webp"
          alt="kakaotalk_channel icon"
      /></a>
      <a href="https://post.naver.com/my.nhn?memberNo=18284175" target="_blank"
        ><img src="img/sns_icon/naver_post.webp" alt="naver_post icon"
      /></a>
      <a href="https://apps.apple.com/kr/app/id1074569961" target="_blank"
        ><img src="img/sns_icon/apple_appstore.webp" alt="apple_appstore icon"
      /></a>
      <a
        href="https://play.google.com/store/apps/details?id=com.wanted.android.wanted&pli=1"
        target="_blank"
        ><img
          src="img/sns_icon/android_playstore.webp"
          alt="android_playstore icon"
      /></a>
    </div>
  </div>

  <hr />

  <div class="footer__imformation">
    <pre class="footer__imformation__company">
          (주)원티드랩 (대표이사:이복기) | 서울특별시 송파구 올림픽로 300 롯데월드타워 35층 | 통신판매번호 : 2020-서울송파-0000
          유료직업소개사업등록번호 : (국내) 제0000-0000000-00-0-00000호 | 사업자등록번호 : 00-00-00000 | 02-000-0000
          © Wantedlab, Inc.
        </pre
    >
    <div class="footer__imformation__country">
      <select
        class="footer__imformation__country__language"
        id="footer__imformation__country__language"
      >
        <option value="KR">한국 (한국어)</option>
        <option value="JP">日本 (日本語)</option>
        <option value="WW">Worldwide (English)</option>
        <option value="SG">Singapore (English)</option>
      </select>
    </div>
  </div>
</footer> -->

    <script
      src="https://kit.fontawesome.com/1f61694686.js"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://code.jquery.com/jquery-3.6.1.js"
      integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
      crossorigin="anonymous"
    ></script>
    <script src="./js/component/insight__nav-bar.js"></script>
  </body>
</html>
