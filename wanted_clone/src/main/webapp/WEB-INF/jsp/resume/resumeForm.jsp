<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>원티드 이력서</title>
        <link rel="icon" href="../img/favicon-192x192.png" />
        <link rel="stylesheet" href="../css/styles.css" />
    </head>
    <body class="resumeForm_body">
        <!--  header -->
        <div>
            <jsp:include page="../../jsp/component/header.jsp"></jsp:include>
        </div>
        <div class="resume-body">
        <input type="hidden" id="jobBoardSeq" value="${param.jobBoardSeq}" />
        <div class="resume-form-wrapper">
            <div class="resume-form-cotainer">
                <div class="resumeForm-language-and-download">
                    <select class="resumeForm-language-select">
                        <option value="KR">한국어</option>
                        <option value="EN">English</option>
                        <option value="JP">日本語</option>
                        <option value="CH">繁體中文</option>
                    </select>
                    <div class="resumeForm-download">
                        다운로드 로고
                        <i class="fa-sharp fa-solid fa-down-to-bracket"></i>
                    </div>
                </div>

                <form name="resumeForm" class="resume-form">
                    <div class="resume-form__wrapper">
                        <input type="text" class="resume_seq" name="resume_seq" value="${param.resumeSeq}" style="visibility: hidden;" />
                        <input type="text" class="formName" name="formName" value="${writingResume.formName}" placeholder="이력서 제목을 입력하세요"/><br />
                        <input type="text" class="id" name="id" value="${id}" readonly /><br />
                        <input type="text" class="name" name="name" value="${name}" placeholder="이름을 입력하세요" /><br />
                        <input type="text" class="tel" name="tel" value="${tel}" placeholder="전화번호를 입력하세요" /><br />

                        <!-- 간단 소개글 -->
                        <div class="intorduce__txt">간단 소개글</div>
                        <div class="border"></div>
                        <div class="resume-form__introduce">
                            <div class="resume-form__describe">
                                <ul>
                                    <li>
                                        • 본인의 업무 경험을 기반으로 핵심역량과
                                        업무 스킬을 간단히 작성해주세요.
                                    </li>
                                    <li>
                                        • 3~5줄로 요약하여 작성하는 것을
                                        추천합니다!
                                    </li>
                                </ul>
                            </div>
                            <div class="introduce-div">
                                <textarea class="introduce" name="introduce" rows="10" placeholder="간단 소개글을 입력하세요" >${writingResume.introduce}</textarea><br />
                            </div>
                        </div>

                        <!-- 경력 추가 버튼 -->
                        <div class="intorduce__txt">경력</div>
                        <div class="border"></div>
                        <div class="resume-form__describe">
                            <ul>
                                <li>• 담당하신 업무 중 우선순위가 높은 업무를 선별하여 최신순으로 작성해주세요. </li>
                                <li>• 신입의 경우, 직무와 관련된 대외활동, 인턴, 계약직 경력 등이 있다면 작성해주세요. </li>
                                <li>• 업무 또는 활동 시 담당했던 역할과 과정, 성과에 대해 자세히 작성해주세요.</li>
                                <li>• 업무 성과는 되도록 구체적인 숫자 혹은 [%]로 표현해주세요.</li>
                                <li>• 커리어 조회 후 기업명이 실제와 다른 경우, 부서명/직책 란에 원하시는 기업명을 작성해주세요.</li>
                            </ul>
                        </div>
                        <div class="career-add-btn-wrapper">
                            <button type="button" class="add__btn">
                                <img alt="" src="/controller/img/resume/plus-solid.svg">
                                <div class="add__btn__txt">
                                    추가
                                </div>
                            </button>
                        </div>
                        <!-- 경력 추가 폼-->
                        <div class="add-form">
                            <div class="add-career">
                                <div class="add-career__date">
                                    <input type="text" name="startYear" class="year" maxlength="4" placeholder="YYYY" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
                                    .
                                    <input type="text" name="startMonth" class="month" maxlength="2" placeholder="MM" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
                                    -
                                    <input type="text" name="endYear" class="year" maxlength="4" placeholder="YYYY" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
                                    .
                                    <input type="text" name="endMonth" class="month" maxlength="2" placeholder="MM" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
                                </div>

                                <div class="company-name">
                                    <input type="text" name="companyName" class="company-name__input" placeholder="회사명">
                                    <button type="button" class="close-btn">
                                        X
                                    </button>
                                </div>
                                <div class="department-name">
                                    <input type="text" name="department" class="department__input" placeholder="부서/직책">
                                </div>
                                <!-- 주요 성과 추가 버튼 -->
                                <div class="add-detail-btn-wrapper">
                                    <button type="button" class="add-career__btn">
                                        <img alt="" src="/controller/img/resume/plus-solid.svg">
                                        <div class="add__btn__txt">
                                            주요 성과 추가
                                        </div>
                                    </button>
                                </div>
                                <!-- 주요 성과 폼 -->
                                <div class="detail-form">
                                    <div class="detail-name">
                                        <input type="text" name="outcome" class="detail-name__input detail-input" placeholder="중요 성과">
                                        <button type="button" class="close-detail-btn">
                                            X
                                        </button>
                                    </div>
                                    <div class="detail-date">
                                        <input type="text" name="startYear" class="year detail-input" maxlength="4" placeholder="YYYY" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
                                        .
                                        <input
                                            type="text" name="startMonth"class="month"maxlength="2"placeholder="MM"
                                            onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');"/>
                                        -
                                        <input type="text"name="endYear"class="year"maxlength="4"placeholder="YYYY"
                                            onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');"/>
                                        .
                                        <input type="text" name="endMonth"class="month"maxlength="2"placeholder="MM"
                                            onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');"/>
                                    </div>
                                    <div class="detail-content">
                                        <input type="text" class="detail-content__input" placeholder="상세 업무 내용과 성과를 기입해주세요">
                                    </div>
                                    <!-- 경력 추가 완료 버튼 -->
                                </div>
                                <div class="add-career__submit">
                                    <button type="button" class="submit-btn" value="0">
                                        추가하기
                                    </button>
                                </div>
                            </div>
                        </div>
                        <!-- 작성된 커리어 리스트 -->
                        <c:forEach var="careerDTO" items="${careerList}">
	                  	    <div class="new-add-form">
	                            <div class="add-career">
	                                <div class="add-career__date">
	                                    <input type="text" name="startYear" class="year" value="${careerDTO.startWorkYear }" maxlength="4" placeholder="YYYY" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
	                                    .
	                                    <input type="text" name="startMonth" class="month" value="${careerDTO.startWorkMonth }" maxlength="2" placeholder="MM" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
	                                    -
	                                    <input type="text" name="endYear" class="year" value="${careerDTO.endWorkYear }" maxlength="4" placeholder="YYYY" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
	                                    .
	                                    <input type="text" name="endMonth" class="month" value="${careerDTO.endWorkMonth }" maxlength="2" placeholder="MM" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
	                                </div>

	                                <div class="company-name">
	                                    <input type="text" name="companyName" value="${careerDTO.companyName }" class="company-name__input" placeholder="회사명">
	                                    <button type="button" class="delete-add-btn">
	                                        삭제
	                                    </button>
	                                </div>
	                                <div class="department-name">
	                                    <input type="text" name="department" value="${careerDTO.department }" class="department__input" placeholder="부서/직책">
	                                </div>
	                            	<c:if test="${!empty careerDTO.startOutcomeyear}">
		                                <!-- 주요 성과 폼 -->
		                                <div class="new-detail-form">
		                                    <div class="detail-name">
		                                        <input type="text" name="outcome" class="detail-name__input detail-input" value="${careerDTO.outcome }" placeholder="중요 성과">
		                                    </div>
		                                    <div class="detail-date">
		                                        <input type="text" name="startYear" class="year detail-input" maxlength="4" placeholder="YYYY" value="${careerDTO. startOutcomeyear}"
		                                        onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
		                                        .
		                                        <input
		                                            type="text" name="startMonth"class="month"maxlength="2"placeholder="MM" value="${careerDTO.startOutcomeMonth }"
		                                            onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');"/>
		                                        -
		                                        <input type="text"name="endYear"class="year"maxlength="4"placeholder="YYYY" value="${careerDTO.endOutcomeYear }"
		                                            onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');"/>
		                                        .
		                                        <input type="text" name="endMonth"class="month"maxlength="2"placeholder="MM" value="${careerDTO.endOutcomeMonth }"
		                                            onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');"/>
		                                    </div>
		                                    <div class="detail-content">
		                                        <input type="text" class="detail-content__input" placeholder="상세 업무 내용과 성과를 기입해주세요" value="${careerDTO.outcomeContent }">
		                                    </div>
		                                </div>
	                                </c:if>
	                            </div>
	                            <div class="new-border"></div>
	                        </div>
                        </c:forEach>

                        <!-- 학력 -->
                        <div class="education-wrapper">
                            <div class="intorduce__txt">학력</div>
                            <div class="border"></div>
                            <div class="resume-form__describe">
                                <ul>
                                    <li>• 최신순으로 작성해주세요.</li>
                                </ul>
                            </div>


                            <!-- 학력 추가 버튼 -->
                            <div class="education-add-btn-wrapper">
                                <button type="button" class="add__btn">
                                    <img alt="" src="/controller/img/resume/plus-solid.svg" />
                                    <div class="add__btn__txt">추가</div>
                                </button>
                            </div>
                            <!-- 학력 추가 폼-->
                            <div class="add-form">
                                <div class="add-career">
                                    <div class="add-career__date">
                                        <input type="text" name="startYear" class="year" maxlength="4" placeholder="YYYY"
                                            onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');"/>
                                        .
                                        <input type="text" name="startMonth" class="month" maxlength="2" placeholder="MM"
                                            onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" />
                                        -
                                        <input type="text" name="endYear" class="year" maxlength="4" placeholder="YYYY"
                                            onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" />
                                        .
                                        <input type="text" name="endMonth" class="month" maxlength="2" placeholder="MM"
                                            onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" />
                                    </div>

                                    <div class="company-name">
                                        <input type="text" name="schoolName" class="company-name__input" placeholder="학교명" />
                                        <button type="button" class="close-btn">
                                            X
                                        </button>
                                    </div>
                                    <div class="department-name">
                                        <input type="text" name="major" class="department__input" placeholder="전공 및 학위 (ex: 경영학과 학사)"/>
                                    </div>
                                    <div class="department-name">
                                        <input type="text"name="content"class="department__input"placeholder="이수 과목 또는 연구 내용"/>
                                    </div>
                                    <div class="add-career__submit">
                                        <button type="button"class="submit-btn"value="1">
                                            추가하기
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 수상 추가 폼-->
                        <div class="add-form">
                            <div class="add-career">
                                <div class="add-career__date">
                                    <input type="text" name="educationStartYear" class="year" maxlength="4" placeholder="YYYY" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
                                    .
                                    <input type="text" name="educationStartMonth" class="month" maxlength="2" placeholder="MM" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
                                    -
                                    <input type="text" name="educationEndYear" class="year" maxlength="4" placeholder="YYYY" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
                                    .
                                    <input type="text" name="educationEndMonth" class="month" maxlength="2" placeholder="MM" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
                                </div>

                                <div class="company-name">
                                    <input type="text" name="activityName" class="company-name__input" placeholder="활동명" />
                                    <button type="button" class="close-btn">
                                        X
                                    </button>
                                </div>
                                <div class="department-name">
                                    <input type="text" name="datail" class="department__input" placeholder="세부사항" />
                                </div>
                                <div class="add-career__submit">
                                    <button type="button" class="submit-btn" value="2">
                                        추가하기
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                   <!-- 수상 -->
                    <div class="intorduce__txt">
                        수상
                    </div>
                    <div class="border"></div>
                    <div class="resume-form__describe">
                        <ul>
                            <li>• 수상 이력, 직무 관련 자격증, 수료한 교육이나 참석한 외부활동 등이 있다면 간략히 작성해주세요.</li>
                            <li>• 지원하는 회사에서 요구하는 경우가 아니라면 운전면허증과 같은 자격증은 생략하는 것이 좋습니다!</li>
                        </ul>
                    </div>
                   <!-- 수상 추가 버튼 -->
                   <div class="award-wrapper">
                   <div class="award-add-btn-wrapper">
                    <button type="button" class="add__btn">
                        <img alt="" src="/controller/img/resume/plus-solid.svg">
                        <div class="add__btn__txt">
                            추가
                        </div>
                    </button>
                  </div>
                <!-- 수상 추가 폼-->
                <div class="add-form">
                    <div class="add-career">
                        <div class="add-career__date">
                            <input type="text" name="activityYear" class="year" maxlength="4" placeholder="YYYY" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
                            .
                            <input type="text" name="activityMonth" class="month" maxlength="2" placeholder="MM" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
                        </div>

                        <div class="company-name">
                            <input type="text" name="activityName" class="company-name__input" placeholder="활동명">
                            <button type="button" class="close-btn">
                                X
                            </button>
                        </div>
                        <div class="department-name">
                            <input type="text" name="detail" class="department__input" placeholder="세부사항">
                        </div>
                        <div class="add-career__submit">
                            <button type="button" class="submit-btn" value="2">추가하기</button>
                        </div>
                    </div>
                </div>
            </div>
                    <!-- 외국어 -->

                    <div class="intorduce__txt">
                        외국어
                    </div>
                    <div class="border"></div>
                    <div class="resume-form__describe">
                        <ul>
                            <li>• 외국어 자격증을 보유한 경우 작성해주세요. </li>
                            <li>• 활용 가능한 외국어가 있다면, 어느정도 수준인지 레벨을 선택해주세요.</li>
                        </ul>
                    </div>
                    <div class="language-wrapper">
                        <div class="language-add-btn-wrapper">
                            <button type="button" class="add__btn">
                                <img alt="" src="/controller/img/resume/plus-solid.svg"
                                />
                                <div class="add__btn__txt">추가</div>
                            </button>
                        </div>
                        <!-- 외국어 추가 폼-->
                        <div class="add-form">
                            <div class="add-career">
                                <div class="add-career__date"></div>

                                <div class="company-name">
                                    <select name="languageName" class="language-name">
                                        <option value="Korean">한국어</option>
                                        <option value="English">영어</option>
                                        <option value="German">독일어</option>
                                        <option value="Spanish">
                                            스페인어
                                        </option>
                                        <option value="프랑스어">프랑스어</option>
                                    </select>
                                    <button type="button" class="close-btn" style="margin-left: 600px">
                                        X
                                    </button>
                                </div>

                                <div class="department-name">
                                    <select name="standard"class="language-standard">
                                        <option value="">수준</option>
                                        <option value="유창함">유창함</option>
                                        <option value="비즈니스 회화">
                                            비즈니스 회화
                                        </option>
                                        <option value="일상회화">
                                            일상 회화
                                        </option>
                                    </select>
                                </div>
                                <div class="add-career__submit">
                                    <button type="button" class="submit-btn" value="3">추가하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                        <div class="link_txt">링크</div>
                        <div class="border"></div>
                        <div class="resume-form__describe">
                            <ul>
                                <li>
                                    • 깃헙, 노션으로 작성한 포트폴리오, 구글
                                    드라이브 파일 등 업무 성과를 보여줄 수 있는
                                    링크가 있다면 작성해주세요.
                                </li>
                            </ul>
                        </div>
                        <!-- 링크 추가 버튼 -->
                        <div class="link-wrapper">
                        <div class="link-add-btn-wrapper">
                            <button type="button" class="add__btn">
                                <img alt="" src="/controller/img/resume/plus-solid.svg"/>
                                <div class="add__btn__txt">추가</div>
                            </button>
                        </div>
                        <!-- 링크 추가 폼-->
                        <div class="add-form">
                            <div class="add-link">
                                <div class="company-name" style="padding-bottom: 30px;">
                                    <input type="text" name="link" class="company-name__input" placeholder="http://">
                                </div>
                                <div class="link-close-btn">
                                    <button type="button" class="close-btn">
                                        X
                                    </button>
                                </div>
                                <div class="add-link__submit">
                                    <button type="button" class="submit-btn" value="4">추가하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </form>
            </div>
        </div>
        <!— resume-form-footer —>
        <footer class="resume-form-footer">
            <button type="button" id="tempSave" class="writing" name="writing" value = "0">
                임시 저장
            </button>
            <button type="button" id="save" class="writing" name="writing"value = "1">
                작성 완료
            </button>
        </footer>
    </div>
        <script src="https://code.jquery.com/jquery-latest.min.js"></script>
        <script
            src="https://kit.fontawesome.com/1f61694686.js"
            crossorigin="anonymous"
        ></script>
        <script
            type="text/javascript"
            src="../js/resume/resumeForm.js"
        ></script>
    </body>
</html>
