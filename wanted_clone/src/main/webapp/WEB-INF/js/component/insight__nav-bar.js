$(function () {
    getScrollPosition();
    $(".insight__nav-bar__list").on("scroll", getScrollPosition);
});

function getScrollPosition() {
    if ($(".insight__nav-bar__list").scrollLeft() == 0) {
        $(".insight__nav-bar__scroll-left-icon").hide();
    } else if ($(".insight__nav-bar__list").scrollLeft() >= 709) {
        $(".insight__nav-bar__scroll-right-icon").hide();
    } else {
        $(".insight__nav-bar__scroll-left-icon").show();
        $(".insight__nav-bar__scroll-right-icon").show();
    }
}

$(".insight__nav-bar__scroll-right-icon").click(function () {
    var position = $(".insight__nav-bar__list").scrollLeft();
    $(".insight__nav-bar__list").animate(
        {
            scrollLeft: position + 300,
        },
        500
    );
});

$(".insight__nav-bar__scroll-left-icon").click(function () {
    var position = $(".insight__nav-bar__list").scrollLeft();
    $(".insight__nav-bar__list").animate(
        {
            scrollLeft: position - 300,
        },
        500
    );
});

function changeIconBackgroundColor() {
    if ($(".insight__nav-bar__all-category").is(":visible")) {
        $(".insight__nav-bar__show-all-icon").css(
            "background-color",
            "#3366ff"
        );
        $(".insight__nav-bar__show-all-icon").css("color", "white");
    } else {
        $(".insight__nav-bar__show-all-icon").css("background-color", "white");
        $(".insight__nav-bar__show-all-icon").css("color", "rgba(0,0,0,0.4)");
    }
}

$(function () {
    $(".insight__nav-bar__all-category").hide();
    var a = $(".insight__nav-bar__list").html();
    $(".insight__nav-bar__all-category").html(a);
});

$(".insight__nav-bar__show-all-icon").click(function () {
    $(".insight__nav-bar__all-category").toggle();
    changeIconBackgroundColor();
});

// $("body").on("click", function (e) {
//   if (
//     $(".insight__nav-bar__all-category").has(e.target).length === 0 &&
//     $(".insight__nav-bar__all-category").is(":visible")
//   ) {
//     $(".insight__nav-bar__all-category").hide();
//     changeIconBackgroundColor();
//   }
// });

$(".insight__header__popup-icon").click(function () {
    $(".insight__header__popup").show();
    return false;
});

$(".insight__header__popup__first-line__close-icon").click(function () {
    $(".insight__header__popup").hide();
});

$(".insight__nav-bar__aside__close-icon").click(function () {
    $(".insight__nav-bar__aside").hide();
});

$(".insight__nav-bar__aside__recommand").click(function () {
    window.open(
        "https://docs.google.com/forms/d/e/1FAIpQLSfElPZfmbfV96-Jh21kfw62ecVzcBwsxOh-Wsrj-oUQcEhJ1g/viewform"
    );
});

$(function () {
    $(".insight__content__other-content").hide();
    for (i = 9; i <= 20; i++) {
        $(".insight__content__list > li:nth-child(" + i + ")").hide();
    }
});

// 더 많은 콘텐츠 보기 버튼 클릭
$(".insight__content__more-content__open").click(function () {
    for (i = 9; i <= 20; i++) {
        $(".insight__content__list > li:nth-child(" + i + ")").show();
    }
    $(".insight__content__more-content").hide();
    $(".insight__content__other-content").show();
});

//인사이트 sort 버튼 클릭
$(".insight__nav-bar__list__button").click(function () {
    $(".insight__nav-bar__list__button").removeClass(
        "insight__nav-bar__list__button-selected"
    );
    $(this).addClass("insight__nav-bar__list__button-selected");

    var insightSort = $(this).children().text();
    console.log(insightSort);
});
