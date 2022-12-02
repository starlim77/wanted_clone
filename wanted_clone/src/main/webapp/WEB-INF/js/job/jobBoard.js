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
      /*
      icon: {
        url: "resources/img/marker.png", //아이콘 경로
        size: new naver.maps.Size(22, 36), //아이콘 크기
        origin: new naver.maps.Point(0, 0),
        anchor: new naver.maps.Point(11, 35),
      },
        */
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
  var id = $(".jobboard__apply__session-id").val();
  if(id!=""){
	  $(".jobboard__apply").hide();
	  $(".jobboard__submit").show();
  }else{
  	location.href="/controller/user/loginForm";
  }
  
});

$(".jobboard__submit__subject").click(function () {
  $(".jobboard__submit").hide();
  $(".jobboard__apply").show();
});

//새 이력서 버튼
$(".jobboard__submit__content__write").click(function(){
	location.href="/controller/resume/resumeForm?jobBoardSeq="+$(".jobboard__seq").val();
});

//파일 업로드 버튼
$(".jobboard__submit__content__upload").click(function(){
	$(".file-upload").trigger("click");
});
//포트폴리오 업로드
$("#portfolio").change(function(){
	var formData = new FormData($("#portfolio-form")[0]);
	$.ajax({
		type: "post",
		url: "/controller/resume/fileUpload",
		enctype: 'multipart/form-data',
		processData : false,
		contentType: false,
		data:  formData,
		success: function(){
			alert("업로드 성공");
			location.reload();
		},
		error: function(err){
			console.log(err);
		}
	});
});

//제출하기 버튼
$(".jobboard__submit__submit-btn").click(function(){
	
	  var jobsortList = new Array();
	    $(
	        ".jobboard__submit__content__file__each-select input[type='hidden']"
	    ).each(function () {
	        var data = $(this).val();
	        jobsortList.push(data);
	    });
	    var jobsort = jobsortList.join("/");
	    alert(jobsort);

	
	
	$.ajax({
		type: "post",
		url: "/controller/job/profileApply",
		data:{
			"seq": jobsort,
			"id" : $(".id").val(),
			"position" : $(".position").val(),
			"company": $("#company").text(),
		},
		success: function(){
			alert("");
			location.reload();
		},
		error: function(err){
			console.log(err);
		}
	});
});


var checkScroll1 = 0;
var checkScroll2 = 0;
// 채용 공고 리스트 무한스크롤
$(window).scroll(function () {
		if($(window).scrollTop() >= $(document).height() - $(window).height()-100 && checkScroll1==checkScroll2) {
			checkScroll1++;
			$.ajax({
				type:'post',
				url:'/controller/job/moreJobList',
				data:'seq=' + $('.job__content__list > li:last-child > input[type="hidden"]').val(),
				success:function(data){
					console.log(JSON.stringify(data));
					checkScroll2++;
				
				for(let i in data) {
					var li = $('<li>');
					
					var a = $("<input>");
					a.attr("type", "hidden");
					a.val(data[i].seq);
					li.append(a);
					
					var div = $('<div>');
	
					//전체
					var card = $('<a>');
					card.addClass('job__content__list__card');
					card.attr('href','#');
	
					//img
					var img = $('<img>');
					img.addClass('job__content__list__card__img');
					img.attr('src','../img/job/'+data[i].img);
	
	
					//card__letter
					var card__letter = $('<div>');
					card__letter.addClass('job__content__list__card__letter');
	
					//position
					var position = $('<div>');
					position.addClass('job__content__list__card__letter__position');
					position.html(data[i].subject);
	
					//company
					var company = $('<div>');
					company.addClass('job__content__list__card__letter__company');
					company.html(data[i].company);
	
					//response
					var response = $('<input>');
					response.addClass('job__content__list__card__letter__response');
					response.val("응답률 매우 높음")
					//location
					var location = $('<div>');
					location.addClass('job__content__list__card__letter__location');
					location.html(data[i].location);
	
					//reward
					var reward = $('<div>');
					reward.addClass('job__content__list__card__reward');
					reward.text('채용보상금 ' + data[i].reward + ' 원');
				
					li.append(card.append(div.append(img)).append(card__letter.append
					(position.append(company).append(response).append(location).append(reward))));
					$('.job__content__list').append(li);
				}
					var scrollNum = Number($('#scrollNum').val()) + 1;
					$('#scrollNum').val(scrollNum);
				},
				error:function(err){
					console.log(err);
				}
			});
		}
});