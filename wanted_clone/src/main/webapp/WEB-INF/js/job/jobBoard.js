//지도 API
var geocoder = new kakao.maps.services.Geocoder();
geocoder.addressSearch($("#companylocation").text(), function (result, status) {
  // 정상적으로 검색이 완료됐으면
  if (status === kakao.maps.services.Status.OK) {
    // 좌표 검색
    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    var la = coords.La;
    var ma = coords.Ma;

    var mapOptions = {
      center: new naver.maps.LatLng(ma, la),
      zoom: 17,
    };
    var map = new naver.maps.Map("map", mapOptions);

    var markerOptions = {
      position: new naver.maps.LatLng(ma, la), //마커찍을 좌표
      map: map,
      icon: {
        url: "resources/img/marker.png", //아이콘 경로
        size: new naver.maps.Size(22, 36), //아이콘 크기
        origin: new naver.maps.Point(0, 0),
        anchor: new naver.maps.Point(11, 35),
      },
    };

    // 마커 생성
    var marker = new naver.maps.Marker(markerOptions);
    //   var mapDiv = document.getElementById("map");
  }
});

$(function () {
  $(".jobboard__submit__content__file__checkbox > input").change(function () {
    if (
      $(".jobboard__submit__content__file__checkbox > input").is(":checked")
    ) {
      $(this)
        .parent()
        .parent()
        .addClass("jobboard__submit__content__file__each-select");
    } else {
      $(this)
        .parent()
        .parent()
        .removeClass("jobboard__submit__content__file__each-select");
    }
  });

  //이력서 제출 화면 숨김
  $(".jobboard__submit").hide();

  //이력서 제출 버튼 비활성화
  $(".jobboard__submit__submit-btn").prop("disabled", true);

  //이력서 제출 버튼 활성화
  setInterval(function () {
    if (
      $(".jobboard__submit__content__file__checkbox > input").is(":checked")
    ) {
      $(".jobboard__submit__submit-btn").prop("disabled", false);
      $(".jobboard__submit__submit-btn").addClass(
        "jobboard__submit__submit-btn-enable"
      );
    } else {
      $(".jobboard__submit__submit-btn").prop("disabled", true);
      $(".jobboard__submit__submit-btn").removeClass(
        "jobboard__submit__submit-btn-enable"
      );
    }
  }, 500);
});

// 지원하기 버튼 클릭
$(".jobboard__apply__apply-btn").click(function () {
  console.log("ha");
  $(".jobboard__apply").hide();
  $(".jobboard__submit").show();
});

$(".jobboard__submit__subject").click(function () {
  $(".jobboard__submit").hide();
  $(".jobboard__apply").show();
});
