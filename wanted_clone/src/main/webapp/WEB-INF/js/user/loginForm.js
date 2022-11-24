$(function () {
  $(".loginform-id__div__input-submit").attr("disabled", true);

  setInterval(function () {
    var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

    if ($(".loginform-id__div__input-id").val() != "") {
      $(".loginform-id__div__input-submit").addClass(
        "loginform-id__div__input-submit-enable"
      );
      $(".loginform-id__div__input-submit").attr("disabled", false);
      return;
    }
  }, 1000);
});

var id;
// 회원 유무 확인
$(".loginform-id__div__input-submit").click(function () {
  id = $(".loginform-id__div__input-id").val();
  if (!id) {
    $("#idDiv").html("아이디를 입력하세요");
    return;
  }
  $.ajax({
    type: "post",
    url: "/controller/user/checkId",
    data: "id=" + id,
    success: function (data) {
      var userDTO = data;
      if (userDTO == "") {
        $(".loginform-id").hide();
        $("#signup-id").val(id);
        $(".loginform-signup").show();
      } else {
        $(".loginform-id").hide();
        $(".loginform-pwd").show();
      }
    },
    error: function (err) {
      console.log(err);
    },
  });
});

//회원가입
$(".loginform-signup__signup-btn").click(function () {
  $.ajax({
    type: "post",
    url: "/controller/user/signUp",
    data: $(".loginform-signup__form").serialize(),
    success: function () {
      alert("회원가입이 완료되었습니다");
      location.href = "/controller/user/loginForm";
    },
    error: function (err) {
      console.log(err);
    },
  });
});
//회원가입 뒤로가기
$(".loginform-signup__header__cancel-btn").click(function () {
  if (
    confirm("회원가입을 취소하고 이전 화면으로 되돌아갑니다. 계속하시겠어요?")
  ) {
    location.href = "/controller/user/loginForm";
  }
});

// 로그인
$(".loginform-pwd__input-next").click(function () {
  var pwd = $(".loginform-pwd__input-pwd").val();
  $.ajax({
    type: "post",
    url: "/controller/user/login",
    data: "id=" + id + "&pwd=" + pwd,
    success: function (data) {
      if (!data == "") {
        location.href = "/controller/";
      } else {
        alert("틀린 비밀번호 입니다.");
      }
    },
    error: function (err) {
      console.log(err);
    },
  });
});
//로그인 뒤로가기
$(".loginform-pwd__header__cancel-btn").click(function () {
  location.href = "/controller/user/loginForm";
});

// 휴대폰 인증
$(".loginform-signup__tel__certify__get-certify").click(function () {
  $.ajax({
    type: "post",
    url: "/controller/user/smsCertify",
    data: "tel=" + $(".loginform-signup__tel__certify__telnum").val(),
    success: function (data) {
      console.log(data);
    },
    error: function (err) {
      console.log(err);
    },
  });
});

//
//
//카카오 소셜 로그인
// $(".loginform-id__div__sns-login__kakao").click(function () {
//   loginWithKakao();
// });

// function loginWithKakao() {
//   const scope = "account_email";
//   Kakao.Auth.login({
//     scope,
//     success: function (response) {
//       Kakao.Auth.setAccessToken(response.access_token);
//       alert(Kakao.Auth.getAccessToken());
//     },
//   });

//   Kakao.Auth.authorize({
//     redirectUri: "http://localhost:8080/controller/user/loginForm",
//   });
// }

// $(function () {
//   Kakao.Auth.setAccessToken();

//   alert(Kakao.Auth.getAccessToken());
//   Kakao.API.request({
//     url: "/v2/user/me",
//     // data: {
//     //   property_keys: ["kakao_account.email"],
//     // },
//     success: function (response) {
//       alert("hahahahhaha");
//     },
//     fail: function (err) {
//       console.log(err);
//     },
//   });
// });
