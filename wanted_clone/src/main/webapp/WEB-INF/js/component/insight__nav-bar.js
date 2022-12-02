$(function () {
    getScrollPosition();
    $(".insight__nav-bar__list").on("scroll", getScrollPosition);
});

function getScrollPosition() {
    if ($(".insight__nav-bar__list").scrollLeft() == 0) {
        $(".insight_nav-bar__icon_wrap-left").hide();
    } else if ($(".insight__nav-bar__list").scrollLeft() >= 709) {
        $(".insight_nav-bar__icon_wrap").hide();
    } else {
        $(".insight_nav-bar__icon_wrap-left").show();
        $(".insight_nav-bar__icon_wrap").show();
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
});

$(".insight__nav-bar__show-all-icon").click(function () {
    var a = $(".insight__nav-bar__list").html();
    $(".insight__nav-bar__all-category").html(a);
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

// index 실행시 4개 중 한가지의 insight 테이블 list를 가져온다
var insightSortName = ["개발", "IT/기술", "회사생활", "UX/UI"];
var insightSortPicked =
    insightSortName[Math.floor(Math.random() * insightSortName.length)];
console.log(insightSortPicked);
$(function () {
    getInsightData(insightSortPicked);
});

// insight 데이터 넣기
function getInsightData(insightSort) {
    $(".insight__content__list").empty();
    $.ajax({
        type: "post",
        url: "/controller/insight/insightList",
        data: "insightSort=" + insightSort,
        success: function (data) {
            console.log(JSON.stringify(data));
            for (let i in data) {
                addInsightData(
                    data[i].link,
                    data[i].img,
                    data[i].subject,
                    data[i].content,
                    data[i].channel,
                    data[i].channelname
                );
            }
        },
        error: function (err) {
            console.log(err);
        },
    });
}

function addInsightData(
    link,
    thumnail,
    subject,
    content,
    channel,
    channelname
) {
    var li = $("<li/>");
    var a = $("<a/>");
    a.addClass("insight__content__list__card");
    a.attr("href", link);
    var div1 = $("<div/>");
    var img = $("<img/>");
    img.addClass("insight__content__list__card__thumnail");
    img.attr("src", "/controller/img/insight/" + thumnail);
    var div2 = $("<div/>");
    div2.addClass("insight__content__list__card__letter");
    var h3 = $("<h3/>");
    h3.addClass("insight__content__list__card__letter__subject");
    h3.text(subject);
    var p = $("<p/>");
    p.addClass("insight__content__list__card__letter__content");
    p.text(content);
    var div3 = $("<div/>");
    div3.addClass("insight__content__list__card__source");
    var imgSmall = $("<img/>");
    imgSmall.addClass("insight__content__list__card__source__image");
    if (channel == "youtube") {
        imgSmall.attr("src", "/controller/img/sns_icon/youtube_color.webp");
    } else {
        imgSmall.attr("src", "/controller/img/sns_icon/branch.webp");
    }
    var span = $("<span/>");
    span.addClass("insight__content__list__card__source__name");
    span.text(channelname);

    div1.append(img);
    div3.append(imgSmall).append(span);

    div2.append(h3).append(p).append(div3);
    a.append(div1).append(div2);

    li.append(a);

    $(".insight__content__list").append(li);
}

//인사이트 sort 버튼 클릭
$(".insight__nav-bar__list__button").click(function () {
    $(".insight__nav-bar__all-category").hide();
    $(".insight__nav-bar__list__button").removeClass(
        "insight__nav-bar__list__button-selected"
    );
    $(this).addClass("insight__nav-bar__list__button-selected");

    var insightSort = $(this).children().text();
    getInsightData(insightSort);
});
