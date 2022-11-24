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


