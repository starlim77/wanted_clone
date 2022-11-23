<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="../css/styles.css" />
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Wanted OneID</title>
    <link rel="icon" href="../img/favicon-192x192.png" />
  </head>
  </head>
  <body>
    <section class="loginform-id">
        <img src="../img/logo/login_logo.png" alt="">
        <div class="loginform-id__div">
            <h2>
                나다운 일의 시작,원티드
            </h2>
            <h4>
                <p>취업, 이직, 커리어 콘텐츠까지</p>
                <p>커리어 성장의 모든 것</p>
            </h4>
            <div>이메일</div>
            <input type="email" id = "id" placeholder=" 이메일을 입력해주세요.">
            <div id="idDiv"></div>
            <input type="button" value="이메일로 계속하기" id="loginIdBtn"></input>
            <p>또는</p>
            <div class="loginform-id__div__sns-login">
                <div class="loginform-id__div__sns-login__kakao-login">
                    <img src="" alt="kakao">
                    <span>Kakao</span>
                </div>
                <p id="token-result"></p>
                <div>
                    <img src="" alt="kakao">
                    <span>Kakao</span>
                </div>
                <div>
                    <img src="" alt="kakao">
                    <span>Kakao</span>
                </div>
                <div>
                    <img src="" alt="kakao">
                    <span>Kakao</span>
                </div>
            </div>
            <hr>
            <div>
                <a href="#">이용약관</a>
                <a href="#">개인저보처리방침</a>
            </div>
            <p>© Wantedlab, Inc.</p>
            <select name="" id="">
                <option value="kor">한국어</option>
                <option value="eng">English</option>
                <option value="jap">日本語</option>
            </select>
        </div>

    </section>

    <section class="loginform-signup">
        <form class="loginform-signup__form" action="">
            <div>이메일</div>
            <input type="text" name="id">
            <div>이름</div>
            <input type="text" name="name" placeholder="이름을 입력해주세요.">
            <div>휴대폰 번호</div>
            <div>
                <input type="text" value="South Korea +82" readonly>
                <input type="text" name="tel"  placeholder="(예시) 01013245768">
                <input type="text" placeholder="인증번호를 입력해주세요">
            </div>
            <div>비밀번호</div>
            <input type="password" name="pwd" placeholder="비밀번호를 입력해주세요.">
            <input type="password" placeholder="비밀번호를 다시 한번 입력해주세요.">
            <p>영문 대소문자, 숫자, 특수문자를 3가지 이상으로 조합해 8자 이상 16자 이하로 입력해주세요.</p>
            <div>
                <input type="checkbox">
                <label for="">전체 동의</label>
            </div>
            <input type="button" id="signUpBtn" value="가입하기">
        </form>
    </section>
    
    <section class="loginform-pwd">
        <div>이메일로 로그인</div>
        <div>비밀번호</div>
        <input type="text" id="loginPwd" placeholder="비밀번호를 입력해주세요.">
        <input type="button" name="" id="loginPwdBtn" value="다음">
        <div>비밀번호 초기화/변경</div>
    </section>

    <script
        src="https://code.jquery.com/jquery-3.6.1.js"
        integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
        crossorigin="anonymous"
    ></script>
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.1/kakao.min.js"
        integrity="sha384-eKjgHJ9+vwU/FCSUG3nV1RKFolUXLsc6nLQ2R1tD0t4YFPCvRmkcF8saIfOZNWf/" crossorigin="anonymous">
    </script>
    <script>
    Kakao.init('894dddd5929cb9481f751a3bd0c05a42');
    </script>
    <script src="../js/user/loginForm.js"></script>
    </body>
</html>
