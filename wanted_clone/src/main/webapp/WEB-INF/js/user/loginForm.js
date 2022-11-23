var id;

// 회원 유무 확인
$("#loginIdBtn").click(function () {
  id = $("#id").val();
  if (!id) {
    $("#idDiv").html("입력하세요");
    return;
  }
  $.ajax({
    type: "post",
    url: "/controller/user/checkId",
    data: "id=" + $("#id").val(),
    success: function (data) {
      var userDTO = data;
      if (userDTO == "") {
        $(".loginform-id").hide();
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
$("#signUpBtn").click(function () {
  $.ajax({
    type: "post",
    url: "/controller/user/signUp",
    data: $(".loginform-signup__form").serialize(),
    success: function () {
      alert("회원가입이 완료되었습니다");
      location.href = "/controller/user/login";
    },
    error: function (err) {
      console.log(err);
    },
  });
});

// 로그인
$("#loginPwdBtn").click(function () {
  var pwd = $("#loginPwd").val();
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

//카카오 소셜 로그인
$(".loginform-id__div__sns-login__kakao-login").click(function () {
  loginWithKakao();
});

function loginWithKakao() {
  Kakao.Auth.authorize({
    redirectUri: "http://localhost:8080/controller/user/loginForm",
  });
}

$(function () {

  Kakao.Auth.setAccessToken('${ACCESS_TOKEN}');
  if(Kakao.Auth.getAccessToken()){
  	console.log("hah");
  }
  
  Kakao.API.request({
    url: '/v2/user/me',
  })
    .then(function (response) {
      console.log(response);
    })
    .catch(function (error) {
      console.log(error);
    });
    
});
