$(function () {
  getScrollPosition();
  $(".job__nav-bar__list").on("scroll", getScrollPosition);
});

function getScrollPosition() {
  if ($(".job__nav-bar__list").scrollLeft() == 0) {
    $(".job__nav-bar__scroll-left-icon").hide();
  } else if ($(".job__nav-bar__list").scrollLeft() >= 709) {
    $(".job__nav-bar__scroll-right-icon").hide();
  } else {
    $(".job__nav-bar__scroll-left-icon").show();
    $(".job__nav-bar__scroll-right-icon").show();
  }
}

$(".job__nav-bar__scroll-right-icon").click(function () {
  var position = $(".job__nav-bar__list").scrollLeft();
  $(".job__nav-bar__list").animate(
    {
      scrollLeft: position + 300,
    },
    500
  );
});

$(".job__nav-bar__scroll-left-icon").click(function () {
  var position = $(".job__nav-bar__list").scrollLeft();
  $(".job__nav-bar__list").animate(
    {
      scrollLeft: position - 300,
    },
    500
  );
});

function changeIconBackgroundColor() {
  if ($(".job__nav-bar__all-category").is(":visible")) {
    $(".job__nav-bar__show-all-icon").css("background-color", "#3366ff");
    $(".job__nav-bar__show-all-icon").css("color", "white");
  } else {
    $(".job__nav-bar__show-all-icon").css("background-color", "white");
    $(".job__nav-bar__show-all-icon").css("color", "rgba(0,0,0,0.4)");
  }
}

$(function () {
  $(".job__nav-bar__all-category").hide();
  var a = $(".job__nav-bar__list").html();
  $(".job__nav-bar__all-category").html(a);
});

$(".job__nav-bar__show-all-icon").click(function () {
  $(".job__nav-bar__all-category").toggle();
  changeIconBackgroundColor();
});


$(".job__header__popup-icon").click(function () {
  $(".job__header__popup").show();
  return false;
});

$(".job__header__popup__first-line__close-icon").click(function () {
  $(".job__header__popup").hide();
});

$(".job__nav-bar__aside__close-icon").click(function () {
  $(".job__nav-bar__aside").hide();
});

$(".job__nav-bar__aside__recommand").click(function () {
  window.open(
    "https://docs.google.com/forms/d/e/1FAIpQLSfElPZfmbfV96-Jh21kfw62ecVzcBwsxOh-Wsrj-oUQcEhJ1g/viewform"
  );
});

$(window).scroll(function () { 

	if($(window).scrollTop() >= $(document).height() - $(window).height()-100) {
	
		$.ajax({
			type:'post',
			url:'/controller/job/moreJobList',
			data:'scrollPg=' + $('#scrollPg').val(),
			dataType:'JSON',
			success:function(data){
				console.log(JSON.stringify(data));
					
			for(let i in data) {
				var li = $('<li>');
				var div = $('<div>');
				
				//전체
				var card = $('<a>');
				card.addClass('job__content__list__card');
				card.attr('href','#');
				
				//img
				var img = $('<img>');
				img.addClass('job__content__list__card__img');
				img.attr('src',data[i].img);
				
								
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
				reward.addClass('job__content__list__card__letter__reward');
				
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




