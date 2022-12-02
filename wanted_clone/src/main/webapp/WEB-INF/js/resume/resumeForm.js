//작성중인 이력서 블러오기
$(function () {
    $.ajax({
        url: "/controller/resume/getWritingResume",
        type: "post",
        data: "resumeSeq=" + $(".resume_seq").val(),
        dataType: "json",
        success: function (data) {
            $(".formName").val(data.formName);
            $(".introduce").val(data.introduce);
            $(".resume_seq").val(data.resume_seq);
            $(".career").val(data.career);
            $(".education").val(data.education);
            $(".award").val(data.award);
            $(".language").val(data.language);
            $(".portfolio").val(data.fileName);
        },
        error: function (request, status, error, textStatus) {
            console.log("code: " + request.status);
            console.log("message: " + request.responseText);
            console.log("error: " + error);
            console.log("textStatus: " + textStatus);
        },
    });
});

//날짜 입력에 숫자만 입력 강제
function checkNumber(event) {
    if (event.key >= 0 && event.key <= 9) {
        return true;
    }
    return false;
}

//추가 폼 생성
$(".add__btn").click(function(){
    $(this).parent().nextAll(".add-form").css("display", "flex");

});

//닫기 버튼
$(".close-btn").click(function () {
    $(this).parents(".add-form").css("display", "none");
});
//주요 성과 닫기 버튼
$(".close-detail-btn").click(function(){
    $(this).parent().nextAll(".detail-form").css("display", "none");
});

// 경력 주요 성과 폼 생성
$(".add-career__btn").click(function () {
    $(".detail-form").css("display", "flex");
});

//textarea 크기 자동 조절
$(document).ready(function () {
    $(".introduce-div").on("keyup keydown", "textarea", function (e) {
        $(this).css("height", "auto");
        $(this).height(this.scrollHeight);
    });
    $(".introduce-div").find("textarea").keyup();
});

//이력서 저장
$(".writing").click(function () {
    var jobBoardSeq = $("#jobBoardSeq").val();
    console.log(jobBoardSeq);
    $.ajax({
        type: "post",
        url: "/controller/resume/resumeSave",
        data: {
            resume_seq: $(".resume_seq").val(),
            formName: $(".formName").val(),
            id: $(".id").val(),
            name: $(".name").val(),
            email: $(".email").val(),
            tel: $(".tel").val(),
            introduce: $(".introduce").val(),
            writing: $(this).val(),
        },
        success: function () {
            alert("저장 성공");
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
        },
    });
});

// 경력, 학력, 외국어 추가 submit
$(".submit-btn").click(function(){
    if(this.value === "0"){
        var dateInput = $(this).parent().siblings(".add-career__date").find("input");
        var companyNameInput = $(this).parent().siblings(".company-name").find("input");
        var departmentNameInput = $(this).parent().siblings(".department-name").find("input");
        var detailNameInput = $(this).parent().siblings("detail-form").find("div:eq(0)").find("input");
        var datailDateInput = $(this).parent().siblings(".detail-form").find("div:eq(1)").find("input");
        var datailContentInput = $(this).parent().siblings(".detail-form").find("div:eq(2)").find("input");
        alert(dateInput.attr("class"))
        $.ajax({
            url: "/controller/resume/careerSave",
            type: "post",
            data: {
                startWorkYear: dateInput.eq(0).val(),
                startWorkMonth: dateInput.eq(1).val(),
                endWorkYear: dateInput.eq(2).val(),
                endWorkMonth: dateInput.eq(3).val(),
                id: $(".id").val(),
                companyName: companyNameInput.val(),
                department: departmentNameInput.val(),
                outcome: detailNameInput.val(),
                outcomeComment: datailContentInput.val(),
                startOutcomeyear: datailDateInput.eq(0).val(),
                startOutcomeMonth: datailDateInput.eq(1).val(),
                endOutcomeYear: datailDateInput.eq(2).val(),
                endOutcomeMonth: datailDateInput.eq(3).val(),
            },
            success: function(){
                location.reload();
            },
            error: function(request, status, error, textStatus){
                console.log("code: " + request.status);
                console.log("message: " + request.responseText);
                console.log("error: " + error);
                console.log("textStatus: " + textStatus);
            },
        });

    } else if(this.value === "1"){
        var dateInput = $(this).parent().siblings(".add-career__date").find("input");
        var schoolNameInput = $(this).parent().siblings(".company-name").find("input");
        var majorInput = $(this).parent().siblings(".department-name:eq(0)").find("input");
        var contentNameInput = $(this).parent().siblings(".department-name:eq(1)").find("input");
        $.ajax({
            url: "/controller/resume/educationSave",
            type: "post",
            data: {
                "educationStartYear" : dateInput.eq(0).val(),
                "educationStartMonth" : dateInput.eq(1).val(),
                "educationEndYear" : dateInput.eq(2).val(),
                "educationEndMonth" : dateInput.eq(3).val(),
                "id" : $(".id").val(),
                "schoolName" : schoolNameInput.val(),
                "major": majorInput.val(),
                "content" : contentNameInput.val()
            },
            success: function(){
                location.reload();
            },
            error: function(request, status, error, textStatus){
                console.log("code: " + request.status);
                console.log("message: " + request.responseText);
                console.log("error: " + error);
                console.log("textStatus: "+textStatus);
            }
        });
    } else if(this.value === "2"){
        var dateInput = $(this).parent().siblings(".add-career__date").find("input");
        var activityNameInput = $(this).parent().siblings(".company-name").find("input");
        var detailInput = $(this).parent().siblings(".department-name").find("input");

        $.ajax({
            url: "/controller/resume/activitySave",
            type: "post",
            data: {
                "activityYear" : dateInput.eq(0).val(),
                "activityMonth" : dateInput.eq(1).val(),
                "id" : $(".id").val(),
                "activityName" : activityNameInput.val(),
                "detail": detailInput.val(),
            },
            success: function(){
                location.reload();
            },
            error: function(request, status, error, textStatus){
                console.log("code: " + request.status);
                console.log("message: " + request.responseText);
                console.log("error: " + error);
                console.log("textStatus: "+textStatus);
            }
        });
    } else if(this.value === "3"){
        var dateInput = $(this).parent().siblings(".company-name").find("select");
        var activityNameInput = $(this).parent().siblings(".department-name").find("select");

        $.ajax({
            url: "/controller/resume/languageSave",
            type: "post",
            data: {
                "languageName" : dateInput.val(),
                "standard" : activityNameInput.val(),
                "id" : $(".id").val(),
            },
            success: function(){
                location.reload();
            },
            error: function(request, status, error, textStatus){
                console.log("code: " + request.status);
                console.log("message: " + request.responseText);
                console.log("error: " + error);
                console.log("textStatus: "+textStatus);
            }
        });
    } else if(this.value === "4"){
        var linkInput = $(this).parent().siblings(".company-name").find("input");

        $.ajax({
            url: "/controller/resume/linkSave",
            type: "post",
            data: {
                "link" : linkInput.val(),
                "id" : $(".id").val()
            },
            success: function(){
                location.reload();
            },
            error: function(request, status, error, textStatus){
                console.log("code: " + request.status);
                console.log("message: " + request.responseText);
                console.log("error: " + error);
                console.log("textStatus: "+textStatus);
            }
        });
    }
});

// 추가 커리어 생성
$(function(){
    $.ajax({
        url: "/controller/resume/getCareer",
        type: "post",
        data: "id=" + $(".id").val(),
        dataType: "json",
        success: function(data){
            data.forEach(function(index){
                // $(".add-btn-wrapper").after(newAddFormDiv.append(addCareerDiv.append(detailNameDiv).append(addCareerDateDiv).append(companyNameDiv).append(departmentDiv).append(detailNameDiv).append(detailFormDiv).append($("<div/>").addClass("border"))));
                var newAddFormDiv = $("<div/>").addClass("new-add-form"); // 1dep
                var addCareerDiv = $("<div/>").addClass("add-career"); //2dep

                //date
                var startWorkYearInput = $("<input/>").addClass("year").val(index.startWorkYear+" .")
                var startWorkMonthInput = $("<input/>").addClass("month").val(index.startWorkMonth+" -")
                var endWorkYearInput = $("<input/>").addClass("year").val(index.endWorkYear+" .")
                var endWorkMonthInput = $("<input/>").addClass("month").val(index.endWorkMonth)
                var addCareerDateDiv = $("<div/>").addClass("new-add-career__date").append(startWorkYearInput).append(startWorkMonthInput).append(endWorkYearInput).append(endWorkMonthInput); //2dep
                var companyNameInput = $("<div/>").addClass("company-name__input").html(index.companyName);
                var companyNameDiv = $("<div/>").addClass("new-company-name").append(companyNameInput);
                //departmentName
                var departmentNameInput = $("<input/>").addClass("department__input").val(index.department);
                var departmentDiv = $("<div/>").addClass("new-department-name").append(departmentNameInput);

                if(index.outcome !== null){
                    //detailForm - detailName
                    var detailNameInput = $("<input/>").addClass("detail-name__input").val(index.outcome);
                    var detailNameDiv = $("<div/>").addClass("detail-name").append(detailNameInput);

                    //detailForm - detailDate
                    var startOutcomeyearInput = $("<input/>").addClass("year").val(index.startOutcomeyear+" .");
                    var startOutcomeMonthInput = $("<input/>").addClass("month").val(index.startOutcomeMonth+" -");
                    var endOutcomeYearInput = $("<input/>").addClass("year").val(index.endOutcomeYear+" .");
                    var endOutcomeMonthInput = $("<input/>").addClass("month").val(index.endOutcomeMonth);
                    var detailDateDiv = $("<div/>").addClass("detail-date").append(startOutcomeyearInput).append(startOutcomeMonthInput).append(endOutcomeYearInput).append(endOutcomeMonthInput)

                    //detailForm - detailDetailContent
                    var detailContentInput = $("<input/>").addClass("detail-content__input").val(index.outcomeContent);
                    var detailContentDiv = $("<div/>").addClass("detail-content").append(detailContentInput);

                    var detailFormDiv = $("<div/>").addClass("new-detail-form").append(detailNameDiv).append(detailDateDiv).append(detailContentDiv);
                }
                var border = $("<div/>").addClass("border");
                var newForm = $(".career-add-btn-wrapper").after(newAddFormDiv.append(addCareerDiv.append(addCareerDateDiv).append(companyNameDiv).append(departmentDiv).append(detailFormDiv)).append(border))
                newForm
            });
        },
        error: function(request, status, error, textStatus){
            console.log("code: " + request.status);
            console.log("message: " + request.responseText);
            console.log("error: " + error);
            console.log("textStatus: "+textStatus);
        },
    });

});

// 추가 학력 생성
$(function(){
    $.ajax({
        url: "/controller/resume/getEducation",
        type: "post",
        data: "id=" + $(".id").val(),
        dataType: "json",
        success: function(data){
            data.forEach(function(index){
                var newAddFormDiv = $("<div/>").addClass("new-add-form"); // 1dep
                var addCareerDiv = $("<div/>").addClass("add-career"); //2dep
                //educationDate
                var startWorkYearInput = $("<input/>").addClass("year").val(index.educationStartYear+" .")
                var startWorkMonthInput = $("<input/>").addClass("month").val(index.educationStartMonth+" -")
                var endWorkYearInput = $("<input/>").addClass("year").val(index.educationEndYear+" .")
                var endWorkMonthInput = $("<input/>").addClass("month").val(index.educationEndMonth)
                var addCareerDateDiv = $("<div/>").addClass("new-add-career__date").append(startWorkYearInput).append(startWorkMonthInput).append(endWorkYearInput).append(endWorkMonthInput); //2dep
                //schoolName
                var companyNameInput = $("<input/>").addClass("company-name__input").val(index.schoolName);
                var companyNameDiv = $("<div/>").addClass("new-company-name").append(companyNameInput);
                //majorName
                var departmentNameInput = $("<input/>").addClass("department__input").val(index.major);
                var departmentDiv = $("<div/>").addClass("new-department-name").append(departmentNameInput);
                //contentName
                var contentInput = $("<input/>").addClass("department__input").val(index.content);
                var contentDiv = $("<div/>").addClass("new-department-name").append(contentInput);

                var border = $("<div/>").addClass("border");
                var newForm = $(".education-add-btn-wrapper").after(newAddFormDiv.append(addCareerDiv.append(addCareerDateDiv).append(companyNameDiv).append(departmentDiv).append(contentDiv)).append(border))
                newForm
            });
        },
        error: function (request, status, error, textStatus) {
            console.log("code: " + request.status);
            console.log("message: " + request.responseText);
            console.log("error: " + error);
            console.log("textStatus: "+textStatus);
        }

    });
});

// 추가 수상 생성
$(function(){
    $.ajax({
        url: "/controller/resume/getAward",
        type: "post",
        data: "id=" + $(".id").val(),
        dataType: "json",
        success: function(data){
            data.forEach(function(index){
                var newAddFormDiv = $("<div/>").addClass("new-add-form"); // 1dep
                var addCareerDiv = $("<div/>").addClass("add-career"); //2dep

                //date
                var activityYearInput = $("<input/>").addClass("year").val(index.activityYear+" .")
                var activityMonthInput = $("<input/>").addClass("month").val(index.activityMonth+" ")
                var activityDateDiv = $("<div/>").addClass("add-career__date").append(activityYearInput).append(activityMonthInput);

                //activityName
                var activityNameInput = $("<input/>").addClass("department__input").val(index.activityName);
                var activityNameDiv = $("<div/>").addClass("new-department-name").append(activityNameInput);

                //detail
                var detailInput = $("<input/>").addClass("department__input").val(index.detail);
                var detailDiv = $("<div/>").addClass("new-department-name").append(detailInput);

                var border = $("<div/>").addClass("border");
                var newForm = $(".award-add-btn-wrapper").after(newAddFormDiv.append(addCareerDiv.append(activityDateDiv).append(activityNameDiv).append(detailDiv)).append(border))
                newForm
            });
        },
        error: function(request, status, error, textStatus){
            console.log("code: " + request.status);
            console.log("message: " + request.responseText);
            console.log("error: " + error);
            console.log("textStatus: "+textStatus);
        },
    });

});
// 추가 언어 생성
$(function(){
    $.ajax({
        url: "/controller/resume/getLanguage",
        type: "post",
        data: "id=" + $(".id").val(),
        dataType: "json",
        success: function(data){
            data.forEach(function(index){
                var newAddFormDiv = $("<div/>").addClass("new-add-form"); // 1dep
                var addCareerDiv = $("<div/>").addClass("add-career"); //2dep

                //languageName
                var languageNameInput = $("<input/>").addClass("new-language-name").val(index.languageName)
                var languageNameDiv = $("<div/>").addClass("new-company-name").append(languageNameInput);

                //activityName
                var standardInput = $("<input/>").addClass("new-language-standard").val(index.standard);
                var standardDiv = $("<div/>").addClass("new-department-name").append(standardInput);

                var border = $("<div/>").addClass("border");
                var newForm = $(".language-add-btn-wrapper").after(newAddFormDiv.append(addCareerDiv.append($("<div/>").addClass("add-career__date")).append(languageNameDiv).append(standardDiv)).append(border))
                newForm
            });
        },
        error: function(request, status, error, textStatus){
            console.log("code: " + request.status);
            console.log("message: " + request.responseText);
            console.log("error: " + error);
            console.log("textStatus: "+textStatus);
        },
    });

});
// 추가 링크 생성
$(function(){
    $.ajax({
        url: "/controller/resume/getLink",
        type: "post",
        data: "id=" + $(".id").val(),
        dataType: "json",
        success: function(data){
            data.forEach(function(index){
                var newAddFormDiv = $("<div/>").addClass("new-add-form"); // 1dep
                var addCareerDiv = $("<div/>").addClass("add-link"); //2dep

                //link
                var linkInput = $("<input/>").addClass("company-name__input").val(index.link)
                var linkDiv = $("<div/>").addClass("new-company-name").append(linkInput);

                var border = $("<div/>").addClass("border");
                var newForm = $(".link-add-btn-wrapper").after(newAddFormDiv.append(addCareerDiv.append(linkDiv)).append(border))
                newForm
            });
        },
        error: function(request, status, error, textStatus){
            console.log("code: " + request.status);
            console.log("message: " + request.responseText);
            console.log("error: " + error);
            console.log("textStatus: "+textStatus);
        },
    });

});
