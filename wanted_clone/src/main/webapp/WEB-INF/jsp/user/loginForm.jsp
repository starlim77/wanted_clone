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
  <body class="loginform">
    <input type="hidden" id="jobBoardSeq" value="${param.jobBoardSeq}" />
    <section class="loginform-id">
        <img class="loginform-id__login-logo" src="../img/logo/login_logo.png" alt="">
        <div class="loginform-id__div">
            <h2>
                나다운 일의 시작,원티드
            </h2>
            <h4>
                <p>취업, 이직, 커리어 콘텐츠까지</p>
                <p>커리어 성장의 모든 것</p>
            </h4>
            <div class="loginform-id__div__email"><span>이메일</span></div>
            <input class="loginform-id__div__input-id" type="email" placeholder="이메일을 입력해주세요.">
            <div id="idDiv"></div>
            <input class="loginform-id__div__input-submit" type="button" value="이메일로 계속하기"></input>
            <p class="loginform-id__div__or">또는</p>
            <div class="loginform-id__div__sns-login">
                <div class="loginform-id__div__sns-login__kakao">
                    <img src="" alt="kakao">
                    <span>Kakao</span>
                </div>
                <div id="naverIdLogin_loginButton">
                    <img src="" alt="naver">
                    <span>Naver</span>
                </div>
            </div>
            <hr class="loginform-id__div__hr">
            <div class="loginform-id__div__terms">
                <a href="#">이용약관</a>&nbsp;&nbsp;
                <a href="#">개인정보처리방침</a>
            </div>
            <p class="loginform-id__div__copyright">© Wantedlab, Inc.</p>
            <select class="loginform-id__div__select-country">
                <option value="kor">한국어</option>
                <option value="eng">English</option>
                <option value="jap">日本語</option>
            </select>
        </div>

    </section>
    <!-- 회원가입 -->
    <section class="loginform-signup">
        <form class="loginform-signup__form" action="">
            <div class="loginform-signup__header">
                <a class="loginform-signup__header__cancel-btn" href="#"><div>취소</div></a>
                <h2>회원가입</h2>
            </div>
            <div class="loginform-signup__input-name">이메일</div>
            <input class="loginform-signup__input-readonly loginform-signup__input" id="signup-id" type="text" name="id" readonly>
            <div class="loginform-signup__input-name">이름</div>
            <input class="loginform-signup__input" type="text" name="name" placeholder="이름을 입력해주세요.">
            <div class="loginform-signup__input-name">휴대폰 번호</div>
            <div class="loginform-signup__tel">
                <input class="loginform-signup__input-readonly loginform-signup__input" type="text" value="South Korea +82" readonly>
                <div class="loginform-signup__tel__certify">
                    <input class="loginform-signup__tel__certify__telnum loginform-signup__input" type="text" name="tel"  placeholder="(예시) 01013245768">
                    <input class="loginform-signup__tel__certify__get-certify loginform-signup__input" type="button" value="인증번호 받기">
                </div>
                <input class="loginform-signup__input" id="certify" type="text" placeholder="인증번호를 입력해주세요">
                <div id="certifyDiv"></div>
            </div>
            <div class="loginform-signup__input-name">비밀번호</div>
            <input class="loginform-signup__input" id="pwd" type="password" name="pwd" placeholder="비밀번호를 입력해주세요.">
            <input class="loginform-signup__input" id="repwd" type="password" placeholder="비밀번호를 다시 한번 입력해주세요.">
            <div id="pwdDiv"></div>
            <p class="loginform-signup__pwd-p">영문 대소문자, 숫자, 특수문자를 3가지 이상으로 조합해 8자 이상 <br>16자 이하로 입력해주세요.</p>
            <div class="loginform-signup__agree">
                <ul>
                    <li class="loginform-signup__agree__all-agree">
                        <input id="agree-all" type="checkbox">
                        <label for="agree-all">전체 동의</label>
                    </li>
                    <hr>
                    <li class="loginform-signup__agree__each-agree">
                        <input id="agree-14" type="checkbox">
                        <label for="agree-14">만 14세 이상입니다. (필수)</label>
                    </li>
                    <li class="loginform-signup__agree__each-agree">
                        <input id="agree-use" type="checkbox">
                        <label for="agree-use">OneID 및 원티드 이용약관 동의 (필수)</label>
                    </li>
                    <li class="loginform-signup__agree__each-agree">
                        <input id="agree-info" type="checkbox">
                        <label for="agree-info">OneID개인정보 수집 및 이용 동의 (필수)</label>
                    </li>
                </ul>
            </div>
            
            <input class="loginform-signup__signup-btn" type="button" value="가입하기">
        </form>
    </section>
    
    <!-- 로그인 -->
    <section class="loginform-pwd">
        <div class="loginform-pwd__header">
            <i class="loginform-pwd__header__cancel-btn fa-solid fa-chevron-left"></i>
            이메일로 로그인
        </div>
        <div class="loginform-pwd__input-name">비밀번호</div>
        <input class="loginform-pwd__input-pwd" type="text" placeholder="비밀번호를 입력해주세요.">
        <input class="loginform-pwd__input-next" type="button" value="다음">
        <div class="loginform-pwd__change-pwd">비밀번호 초기화/변경</div>
    </section>

    
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"></script>
    <script>
        



        var naverLogin = new naver.LoginWithNaverId({
    clientId: "jTI17Eg735RLpdY6fa9_",
    callbackUrl: "http://localhost:8080/controller/",
    isPopup: false /* 팝업을 통한 연동처리 여부 */,
    loginButton: {
        color: "green",
        type: 3,
        height: 62,
    } /* 로그인 버튼의 타입을 지정 */,
}); /* 설정정보를 초기화하고 연동을 준비 */
naverLogin.init();

    </script>
    <script
    src="https://kit.fontawesome.com/1f61694686.js"
    crossorigin="anonymous"
  ></script>
    <script
        src="https://code.jquery.com/jquery-3.6.1.js"
        integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
        crossorigin="anonymous"
    ></script>
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.1/kakao.min.js"
        integrity="sha384-eKjgHJ9+vwU/FCSUG3nV1RKFolUXLsc6nLQ2R1tD0t4YFPCvRmkcF8saIfOZNWf/" crossorigin="anonymous">
    </script>
 
    </script>
    <script src="../js/user/loginForm.js"></script>
    </body>
</html>
