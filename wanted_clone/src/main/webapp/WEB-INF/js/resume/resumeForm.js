//작성중인 이력서 블러오기
$(function(){
    $.ajax({
        url: "/controller/resume/getWritingResume",
        type: "post",
        data: "resumeSeq=" + $(".resume_seq").val(),
        dataType: "json",
        success: function(data){
            $(".formName").val(data.formName);
            $(".introduce").val(data.introduce);
            $(".resume_seq").val(data.resume_seq);
            $(".career").val(data.career);
            $(".education").val(data.education);
            $(".award").val(data.award);
            $(".language").val(data.language);
            $(".portfolio").val(data.fileName);
        },
        error: function(request, status, error, textStatus){
            console.log("code: " + request.status);
            console.log("message: " + request.responseText);
            console.log("error: " + error);
            console.log("textStatus: "+textStatus);
        }
    });
});

//날짜 입력에 숫자만 입력 강제
function checkNumber(event) {
    if(event.key >= 0 && event.key <= 9) {
        return true;
    }
    return false;
}

//추가 폼 생성
$(".add__btn").click(function(){
    $(this).parent().next().css("display", "flex");
});

//닫기 버튼
$(".close-btn").click(function(){
    $(this).parents(".add-form").css("display", "none");
});
//주요 성과 닫기 버튼
$(".close-detail-btn").click(function(){
    $(this).parent().next(".detail-form").css("display", "none");
});

// 경력 주요 성과 폼 생성
$(".add-career__btn").click(function(){
    $(".detail-form").css("display", "flex");
});

//textarea 크기 자동 조절
$(document).ready(function() {
    $('.introduce-div').on( 'keyup keydown', 'textarea', function (e){
      $(this).css('height', 'auto' );
      $(this).height( this.scrollHeight );
    });
    $('.introduce-div').find( 'textarea' ).keyup();
  });

  //이력서 저장
$(".writing").click(function(){
    $.ajax({
        type: "post",
        url: "/controller/resume/resumeSave",
        data: {
            "resume_seq": $(".resume_seq").val(), 
            "formName" : $(".formName").val(),
            "id" : $(".id").val(),
            "name" : $(".name").val(),
            "email": $(".email").val(),
            "tel" : $(".tel").val(),
            "introduce" : $(".introduce").val(),
            "writing": $(this).val()
        },
        success: function(){
            alert("저장 성공")
            location.href = "http://localhost:8080/controller/resume/"
        },
        error: function(request, status, error, textStatus){
            console.log("code: " + request.status);
            console.log("message: " + request.responseText);
            console.log("error: " + error);
            console.log("textStatus: "+textStatus);
        }
    });
});

// 경력, 학력 외국어 추가 submit
$(".submit-btn").click(function(){
    if(this.value === "0"){
        var dateInput = $(this).parent().siblings("div:eq(0)").find("input");
        var companyNameInput = $(this).parent().siblings("div:eq(1)").find("input");
        var departmentNameInput = $(this).parent().siblings("div:eq(2)").find("input");
        var detailNameInput = $(this).parent().siblings("div:eq(4)").find("div:eq(0)").find("input");
        var datailDateInput = $(this).parent().siblings("div:eq(4)").find("div:eq(1)").find("input");
        var datailContentInput = $(this).parent().siblings("div:eq(4)").find("div:eq(2)").find("input");
        $.ajax({
            url: "/controller/resume/careerSave",
            type: "post",
            data: {
                "startWorkYear" : dateInput.eq(0).val(),
                "startWorkMonth" : dateInput.eq(1).val(),
                "endWorkYear" : dateInput.eq(2).val(), 
                "endWorkMonth" : dateInput.eq(3).val(),
                "id" : $(".id").val(),
                "companyName" : companyNameInput.val(),
                "department": departmentNameInput.val(),
                "outcome" : detailNameInput.val(),
                "outcomeComment" : datailContentInput.val(),
                "startOutcomeyear": datailDateInput.eq(0).val(),
                "startOutcomeMonth" : datailDateInput.eq(1).val(),
                "endOutcomeYear" : datailDateInput.eq(2).val(),
                "endOutcomeMonth" : datailDateInput.eq(3).val()
            },
            success: function(){
               
            },
            error: function(request, status, error, textStatus){
                console.log("code: " + request.status);
                console.log("message: " + request.responseText);
                console.log("error: " + error);
                console.log("textStatus: "+textStatus);
            }
        });

    } else if(this.value === "1"){
        alert(this.value)
    } else if(this.value === "2"){
        alert(this.value)
    } else if(this.value === "3"){
        alert(this.value)
    }
});

$(".intorduce__txt").click(function(){
    $.ajax({
        url: "/controller/resume/getCareer",
        type: "post",
        data: "id=" + $(".id").val(),
        dataType: "json",
        success: function(data){
            data.forEach(function(index){
                var addFormDiv = $("</div>").addClass("add-form"); // 1dep
                var addCareerDiv = $("</div>").addClass("add-career"); //2dep
                //date
                var startWorkYearInput = $("</input>").addClass("year").html(index.startWorkYear)
                var startWorkMonthInput = $("</input>").addClass("year").html(index.startWorkMonth)
                var endWorkYearInput = $("</input>").addClass("year").html(index.endWorkYear)
                var endWorkMonthInput = $("</input>").addClass("year").html(index.endWorkMonth)
                var addCareerDateDiv = $("</div>").addClass("add-career__date").append(startWorkYearInput).append(startWorkMonthInput).append(endWorkYearInput).append(endWorkMonthInput); //2dep
                //companyName
                var companyNameInput = $("</div>").addClass("company-name").html(index.companyName);
                var companyNameDiv = $("</div>").addClass("company-name").append(companyNameInput);
                //departmentName
                var departmentNameInput = $("</input>").addClass("department__input").html(index.department);
                var departmentDiv = $("</div>").addClass("department-name").append(departmentNameInput);
                //detailForm - detailName
                var detailNameInput = $("<input>").addClass("detail-name__input detail-input").html(index.outcome);
                var detailNameDiv = $("</div>").addClass("detail-name").append(detailNameInput);
                //detailForm - detailDate
                var startOutcomeyearInput = $("</input>").addClass("year").html(index.startOutcomeyear);
                var startOutcomeMonthInput = $("</input>").addClass("month").html(index.startOutcomeMonth);
                var endOutcomeYearInput = $("</input>").addClass("year").html(index.endOutcomeYear);
                var endOutcomeMonthInput = $("</input>").addClass("month").html(index.endOutcomeMonth);
                var detailDateDiv = $("</div>").addClass("detail-date").append(startOutcomeyearInput).append(startOutcomeMonthInput).append(endOutcomeYearInput).append(endOutcomeMonthInput)
                //detailForm - detailDetailContent
                var detailContentInput = $("</input>").addClass("detail-content__input").html(index.outcomeComment);
                var detailFormDiv = $("</div>").addClass("detail-form");
            });
        },
        error: function(request, status, error, textStatus){
            console.log("code: " + request.status);
            console.log("message: " + request.responseText);
            console.log("error: " + error);
            console.log("textStatus: "+textStatus);
        }
    });
});