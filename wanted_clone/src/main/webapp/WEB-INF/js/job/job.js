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

var checkScroll1 = 0;
var checkScroll2 = 0;
// 채용 공고 리스트 무한스크롤
$(window).scroll(function () {
    var jobsort = $("#jobsort").val();
    var forData;
    if (!jobsort) {
        forData =
            "seq=" +
            $(
                '.job__content__list > li:last-child > input[type="hidden"]'
            ).val();
    } else {
        forData =
            "seq=" +
            $(
                '.job__content__list > li:last-child > input[type="hidden"]'
            ).val() +
            "&jobsort=" +
            jobsort;
    }

    if (
        $(window).scrollTop() >=
            $(document).height() - $(window).height() - 100 &&
        checkScroll1 == checkScroll2
    ) {
        checkScroll1++;
        $.ajax({
            type: "post",
            url: "/controller/job/moreJobList",
            data: forData,
            success: function (data) {
                console.log(JSON.stringify(data));
                checkScroll2++;

                for (let i in data) {
                    var li = $("<li>");

                    var a = $("<input>");
                    a.attr("type", "hidden");
                    a.val(data[i].seq);
                    li.append(a);

                    var div = $("<div>");

                    //전체
                    var card = $("<a>");
                    card.addClass("job__content__list__card");
                    card.attr("href", "#");

                    //img
                    var img = $("<img>");
                    img.addClass("job__content__list__card__img");
                    img.attr("src", "../img/job/" + data[i].img);

                    //card__letter
                    var card__letter = $("<div>");
                    card__letter.addClass("job__content__list__card__letter");

                    //position
                    var position = $("<div>");
                    position.addClass(
                        "job__content__list__card__letter__position"
                    );
                    position.html(data[i].subject);

                    //company
                    var company = $("<div>");
                    company.addClass(
                        "job__content__list__card__letter__company"
                    );
                    company.html(data[i].company);

                    //response
                    var response = $("<input>");
                    response.addClass(
                        "job__content__list__card__letter__response"
                    );
                    response.val("응답률 매우 높음");
                    //location
                    var location = $("<div>");
                    location.addClass(
                        "job__content__list__card__letter__location"
                    );
                    location.html(data[i].location);

                    //reward
                    var reward = $("<div>");
                    reward.addClass("job__content__list__card__reward");
                    reward.html("채용보상금 " + data[i].reward + " 원");

                    li.append(
                        card
                            .append(div.append(img))
                            .append(
                                card__letter.append(
                                    position
                                        .append(company)
                                        .append(response)
                                        .append(location)
                                        .append(reward)
                                )
                            )
                    );
                    $(".job__content__list").append(li);
                }
                var scrollNum = Number($("#scrollNum").val()) + 1;
                $("#scrollNum").val(scrollNum);
            },
            error: function (err) {
                console.log(err);
            },
        });
    }
});

// 직무 선택 모달 창 토글
$(".job__sort-bar__content__all-list__develop__job-list__icon").click(
    function () {
        $(".job__sort-bar__content__sort-select").toggle();
    }
);

// 선택한 정렬 조건들에 selected 클래스 넣기
for (
    var i = 0;
    i <=
    $(".job__sort-bar__content__sort-select__select-list__ul__button").length;
    i++
) {
    var jobsort = $(
        ".job__sort-bar__content__all-list__develop__job-list"
    ).text();
    //조건이 없으면 개발 전체에 클래스 넣어줌
    if (jobsort == "개발 전체") {
        $(
            ".job__sort-bar__content__sort-select__select-list__ul > li:nth-child(" +
                0 +
                ") > button"
        ).addClass(
            "job__sort-bar__content__sort-select__select-list__ul__button-selected"
        );
    }
    var span = $(
        ".job__sort-bar__content__sort-select__select-list__ul > li:nth-child(" +
            i +
            ")  span"
    ).text();
    // console.log(span);
    if (jobsort.includes(span)) {
        $(
            ".job__sort-bar__content__sort-select__select-list__ul > li:nth-child(" +
                i +
                ") > button"
        ).addClass(
            "job__sort-bar__content__sort-select__select-list__ul__button-selected"
        );
    }
}

var jobsortMax = $(
    ".job__sort-bar__content__sort-select__select-list__ul__button-selected"
).length;
// 버튼 클릭
$(".job__sort-bar__content__sort-select__select-list__ul__button").click(
    function () {
        //개발 전체 버튼 해제 기능
        if (
            $(
                ".job__sort-bar__content__sort-select__select-list__ul > li:first-child > button"
            ).hasClass(
                "job__sort-bar__content__sort-select__select-list__ul__button-selected"
            )
        ) {
            $(
                ".job__sort-bar__content__sort-select__select-list__ul > li:first-child > button"
            ).removeClass(
                "job__sort-bar__content__sort-select__select-list__ul__button-selected"
            );
            jobsortMax--;
        }
        //개발 전체 버튼 누를 때 다른 버튼 해제 기능;
        if ($(this).children().text() == "개발 전체") {
            $(
                ".job__sort-bar__content__sort-select__select-list__ul__button-selected"
            ).removeClass(
                "job__sort-bar__content__sort-select__select-list__ul__button-selected"
            );
            jobsortMax = 0;
        }
        if (
            $(this).hasClass(
                "job__sort-bar__content__sort-select__select-list__ul__button-selected"
            )
        ) {
            jobsortMax--;
            $(this).removeClass(
                "job__sort-bar__content__sort-select__select-list__ul__button-selected"
            );
        } else {
            if (jobsortMax >= 5) {
                alert("직무는 최대 5개까지 선택 가능합니다.");
                return;
            }
            jobsortMax++;
            $(this).addClass(
                "job__sort-bar__content__sort-select__select-list__ul__button-selected"
            );
        }
    }
);

// 직무 선택 sort 선택 버튼 클릭
$(".job__sort-bar__content__sort-select__submit-btn").click(function () {
    var all = $(
        ".job__sort-bar__content__sort-select__select-list__ul > li:first-child span"
    ).text();

    var select = $(
        ".job__sort-bar__content__sort-select__select-list__ul__button-selected > span"
    ).text();

    if (all == select) {
        location.href = "/controller/job/jobList";
        return;
    }
    var jobsortList = new Array();
    $(
        ".job__sort-bar__content__sort-select__select-list__ul__button-selected span"
    ).each(function () {
        var data = $(this).text();
        jobsortList.push(data);
    });
    var jobsort = jobsortList.join("/");

    location.href = "/controller/job/jobList?jobsort=" + jobsort;
});
