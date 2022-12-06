//날짜 입력에 숫자만 입력 강제
function checkNumber(event) {
    if (event.key >= 0 && event.key <= 9) {
        return true;
    }
    return false;
}

//추가 폼 생성
$(".add__btn").click(function () {
    $(this).parent().nextAll(".add-form").css("display", "flex");
});

//닫기 버튼
$(".close-btn").click(function () {
    $(this).parents(".add-form").css("display", "none");
});
//주요 성과 닫기 버튼
$(".close-detail-btn").click(function () {
    $(".detail-form").css("display", "none");
});

// 경력 주요 성과 폼 생성
$(".add-career__btn").click(function () {
    $(".detail-form").css("display", "flex");
});

//textarea 크기 자동 조절
$(document).ready(function () {
    $('.introduce-div').on('keyup keydown', 'textarea', function (e) {
        $(this).css('height', 'auto');
        $(this).height(this.scrollHeight);
    });
    $('.introduce-div').find('textarea').keyup();
});

//이력서 저장
$(".writing").click(function () {
    var jobBoardSeq = $("#jobBoardSeq").val();
    if ($(".formName").val() === "") {
        alert("이력서 제목을 입력하세요")
    } else if ($(".name").val() === "") {
        alert("이름을 입력하세요")
    } else if ($(".email").val() === "") {
        alert("이메일을 입력하세요")
    } else if ($(".tel").val() === "") {
        alert("전화번호를 입력하세요")
    } else {
        if($(".resume_seq").val() === ""){
            $.ajax({
                type: "post",
                url: "/controller/resume/resumeSave",
                data: {
                    "resume_seq": $(".resume_seq").val(),
                    "formName": $(".formName").val(),
                    "id": $(".id").val(),
                    "name": $(".name").val(),
                    "email": $(".email").val(),
                    "tel": $(".tel").val(),
                    "introduce": $(".introduce").val(),
                    "writing": $(this).val()
                },
                success: function () {
                    if (!jobBoardSeq) {
                        location.href = "http://localhost:8080/controller/resume/";
                    } else {
                        location.href = "/controller/job/jobBoard?seq=" + jobBoardSeq;
                    }
                },
                error: function (request, status, error, textStatus) {
                    console.log("code: " + request.status);
                    console.log("message: " + request.responseText);
                    console.log("error: " + error);
                    console.log("textStatus: " + textStatus);
                }
            });
        } else {
            $.ajax({
                type: "post",
                url: "/controller/resume/writingResumeSave",
                data: {
                    "resume_seq": $(".resume_seq").val(),
                    "formName": $(".formName").val(),
                    "id": $(".id").val(),
                    "name": $(".name").val(),
                    "email": $(".email").val(),
                    "tel": $(".tel").val(),
                    "introduce": $(".introduce").val(),
                    "writing": $(this).val()
                },
                success: function () {
                    if (!jobBoardSeq) {
                        location.href = "http://localhost:8080/controller/resume/";
                    } else {
                        location.href = "/controller/job/jobBoard?seq=" + jobBoardSeq;
                    }
                },
                error: function (request, status, error, textStatus) {
                    console.log("code: " + request.status);
                    console.log("message: " + request.responseText);
                    console.log("error: " + error);
                    console.log("textStatus: " + textStatus);
                }
            });
        }
    }
});

// 경력, 학력, 외국어 추가 submit
$(".submit-btn").click(function () {
    if (this.value === "0") {
        var dateInput = $(this).parent().siblings(".add-career__date").find("input");
        var companyNameInput = $(this).parent().siblings(".company-name").find("input");
        var departmentNameInput = $(this).parent().siblings(".department-name").find("input");
        var detailNameInput = $(this).parent().siblings(".detail-form").find("div:eq(0)").find("input");
        var datailDateInput = $(this).parent().siblings(".detail-form").find("div:eq(1)").find("input");
        var datailContentInput = $(this).parent().siblings(".detail-form").find("div:eq(2)").find("input");
        $.ajax({
            url: "/controller/resume/careerSave",
            type: "post",
            data: { 
                "startWorkYear": dateInput.eq(0).val(),
                "startWorkMonth": dateInput.eq(1).val(),
                "endWorkYear": dateInput.eq(2).val(),
                "endWorkMonth": dateInput.eq(3).val(),
                "id": $(".id").val(),
                "companyName": companyNameInput.val(),
                "department": departmentNameInput.val(),
                "outcome": detailNameInput.val(),
                "outcomeContent": datailContentInput.val(),
                "startOutcomeyear": datailDateInput.eq(0).val(),
                "startOutcomeMonth": datailDateInput.eq(1).val(),
                "endOutcomeYear": datailDateInput.eq(2).val(),
                "endOutcomeMonth": datailDateInput.eq(3).val()
            },
            success: function () {
                alert("경력 등록 성공")
            },
            error: function (request, status, error, textStatus) {
                console.log("code: " + request.status);
                console.log("message: " + request.responseText);
                console.log("error: " + error);
                console.log("textStatus: " + textStatus);
            }
        });

    } else if (this.value === "1") {
        var dateInput = $(this).parent().siblings(".add-career__date").find("input");
        var schoolNameInput = $(this).parent().siblings(".company-name").find("input");
        var majorInput = $(this).parent().siblings(".department-name:eq(0)").find("input");
        var contentNameInput = $(this).parent().siblings(".department-name:eq(1)").find("input");
        $.ajax({
            url: "/controller/resume/educationSave",
            type: "post",
            data: {
                "educationStartYear": dateInput.eq(0).val(),
                "educationStartMonth": dateInput.eq(1).val(),
                "educationEndYear": dateInput.eq(2).val(),
                "educationEndMonth": dateInput.eq(3).val(),
                "id": $(".id").val(),
                "schoolName": schoolNameInput.val(),
                "major": majorInput.val(),
                "content": contentNameInput.val()
            },
            success: function () {
            	alert("학력 등록 성공");
                //location.reload();
            },
            error: function (request, status, error, textStatus) {
                console.log("code: " + request.status);
                console.log("message: " + request.responseText);
                console.log("error: " + error);
                console.log("textStatus: " + textStatus);
            }
        });
    } else if (this.value === "2") {
        var dateInput = $(this).parent().siblings(".add-career__date").find("input");
        var activityNameInput = $(this).parent().siblings(".company-name").find("input");
        var detailInput = $(this).parent().siblings(".department-name").find("input");

        $.ajax({
            url: "/controller/resume/activitySave",
            type: "post",
            data: {
                "activityYear": dateInput.eq(0).val(),
                "activityMonth": dateInput.eq(1).val(),
                "id": $(".id").val(),
                "activityName": activityNameInput.val(),
                "detail": detailInput.val(),
            },
            success: function () {
            	alert("수상 등록 성공");
                //location.reload();
            },
            error: function (request, status, error, textStatus) {
                console.log("code: " + request.status);
                console.log("message: " + request.responseText);
                console.log("error: " + error);
                console.log("textStatus: " + textStatus);
            }
        });
    } else if (this.value === "3") {
        var dateInput = $(this).parent().siblings(".company-name").find("select");
        var activityNameInput = $(this).parent().siblings(".department-name").find("select");

        $.ajax({
            url: "/controller/resume/languageSave",
            type: "post",
            data: {
                "languageName": dateInput.val(),
                "standard": activityNameInput.val(),
                "id": $(".id").val(),
            },
            success: function () {
            	alert("외국어 등록 성공");
                //location.reload();
            },
            error: function (request, status, error, textStatus) {
                console.log("code: " + request.status);
                console.log("message: " + request.responseText);
                console.log("error: " + error);
                console.log("textStatus: " + textStatus);
            }
        });
    } else if (this.value === "4") {
        var linkInput = $(this).parent().siblings(".company-name").find("input");

        $.ajax({
            url: "/controller/resume/linkSave",
            type: "post",
            data: {
                "link": linkInput.val(),
                "id": $(".id").val()
            },
            success: function () {
            	alert("링크 등록 성공");
                //location.reload();
            },
            error: function (request, status, error, textStatus) {
                console.log("code: " + request.status);
                console.log("message: " + request.responseText);
                console.log("error: " + error);
                console.log("textStatus: " + textStatus);
            }
        });
    }
});





// $(document).on("click",".delete-add-btn",function(){
//     if(".delete-add-btn" === "0"){
//         $.ajax({
//         url: "/controller/resume/deleteCareer",
//         type: "post",
//         data: "career_seq=" + $(".career_seq").val(),
//         dataType: "json",
//         success: function(){
//             location.reload();
//         },
//         error: function(request, status, error, textStatus){
//             console.log("code: " + request.status);
//             console.log("message: " + request.responseText);
//             console.log("error: " + error);
//             console.log("textStatus: "+textStatus);
//         }
//         });

//     }
// });
