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
