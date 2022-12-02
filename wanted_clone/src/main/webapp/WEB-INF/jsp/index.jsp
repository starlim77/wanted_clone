<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <link rel="stylesheet" href="./css/styles.css" />
    <meta charset="UTF-8" />
    <title>원티드 - 나다운 일의 시작</title>
    <link rel="icon" href="./img/favicon-192x192.png" />
    <style type="text/css">
      .banner-div {
        margin-top: 70px;
      }

      #insight-div {
        margin-top: -30vh;
      }
    </style>

  <body>
    <!-- header 상단 메뉴 바 -->
    <jsp:include page="./component/header.jsp"></jsp:include>
    <article>
      <!-- <section>banner</section> -->
      <div class="banner-div">
        <jsp:include page="./component/banner.jsp"></jsp:include>
      </div>

      <!-- <section>   insight -->
      <div class="insight-div">
        <jsp:include page="./component/insight.jsp"></jsp:include>
      </div>

      <!-- <section>   insight -->

      <!-- <section>크리에이터 추천</section>
      <section>3분만에 읽는 아티클</section>
      <section>커리어 성장을 위한 맞춤 이벤트</section>
      <section>채용정보를 찾고 계셨나요</section> -->
    </article>

    <!-- footer -->

    <jsp:include page="./component/footer.jsp"></jsp:include>
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
    <script type="text/javascript">
    	/* get 방식 데이터들 삭제 기능 */
    	history.replaceState({}, null, location.pathname);
    </script>
  </body>

  </html>
