<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="../css/styles.css" />
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="../img/favicon-192x192.png" />
    <title>개발 채용 정보 | 원티드</title>
  </head>
  <body>


    <!-- <div class="job">
      <article class="jobgroup__container">
        <div class="jobgroup__body">
          <div>
            <button class="jobgroup__button">
              <span class="jobgroup__title">전체</span>
              <span class="jobgroup__title__button"><img /></span>
            </button>
          </div>
          <div class="jobgroup__category">
            <span class="jobgroup__category__button"></span>
          </div>
        </div>
      </article>

      <div class="job__nav-bar">
        <div class="job__nav-bar__scroll-left-icon">
          <i class="fa-solid fa-chevron-left"></i>
        </div>
        <ul class="job__nav-bar__list">
          <li>
            <button
              class="job__nav-bar__list__button"
              style="background: rgb(242, 251, 245)"
            >
              <span>연봉이 최고의 복지💰</span>
            </button>
          </li>
          <li>
            <button
              class="job__nav-bar__list__button"
              style="background: rgb(243, 249, 254)"
            >
              <span>재택근무🏠</span>
            </button>
          </li>
          <li>
            <button
              class="job__nav-bar__list__button"
              style="background: rgb(243, 242, 251)"
            >
              <span>퇴사율 10% 이하📌</span>
            </button>
          </li>
          <li>
            <button
              class="job__nav-bar__list__button"
              style="background: rgb(246, 248, 238)"
            >
              <span>급성장 중📈</span>
            </button>
          </li>
          <li>
            <button
              class="job__nav-bar__list__button"
              style="background: rgb(247, 242, 249)"
            >
              <span>병역특례</span>
            </button>
          </li>
          <li>
            <button
              class="job__nav-bar__list__button"
              style="background: rgb(238, 250, 249)"
            >
              <span>50인 이하⬇</span>
            </button>
          </li>
          <li>
            <button
              class="job__nav-bar__list__button"
              style="background: rgb(239, 241, 251)"
            >
              <span>50인 이상⬆</span>
            </button>
          </li>
          <li>
            <button
              class="job__nav-bar__list__button"
              style="background: rgb(242, 251, 245)"
            >
              <span>자유로운 휴가🌴</span>
            </button>
          </li>
          <li>
            <button
              class="job__nav-bar__list__button"
              style="background: rgb(243, 249, 254)"
            >
              <span>수평적 문화😍</span>
            </button>
          </li>
          <li>
            <button
              class="job__nav-bar__list__button"
              style="background: rgb(243, 242, 251)"
            >
              <span>식사.간식 제공☕</span>
            </button>
          </li>
          <li>
            <button
              class="job__nav-bar__list__button"
              style="background: rgb(246, 248, 238)"
            >
              <span>일한만큼 받는 보상😝</span>
            </button>
          </li>
        </ul>
        <div class="job__nav-bar__scroll-right-icon">
          <i class="fa-solid fa-chevron-right"></i>
        </div>
        <div class="job__nav-bar__show-all-icon">
          <i class="fa-solid fa-ellipsis"></i>
        </div>
        <div class="job__nav-bar__all-category"></div>
      </div>
      <hr />
    </div> -->


	<jsp:include page="../../jsp/component/header.jsp"></jsp:include>



	<section class="job__sort-bar">
		<div class="job__sort-bar__content">
			<ul class="job__sort-bar__content__all-list">
				<li class="job__sort-bar__content__all-list__develop">
					개발
				</li>
				<hr>
				<li class="job__sort-bar__content__all-list__develop__job-list">
					<c:if test="${empty param.jobsort}">
            개발 전체
          </c:if>
					<c:if test="${!empty param.jobsort}">
            ${param.jobsort}
          </c:if>
					<div class="job__sort-bar__content__all-list__develop__job-list__icon">
						<i class="fa-solid fa-chevron-down"></i>
					</div>

				</li>
			</ul>
			<div class="job__sort-bar__content__sort-select">
				<div class="job__sort-bar__content__sort-select__select-list">
					<p>직무를 선택해 주세요. (최대 5개 선택 가능)</p>
					<div>
						<ul class="job__sort-bar__content__sort-select__select-list__ul">
							<li>
								<button class="job__sort-bar__content__sort-select__select-list__ul__button">
									<span>개발 전체</span>
								</button>
							</li>
							<c:forEach var="position" items="${positionList}">
								<li>
									<button class="job__sort-bar__content__sort-select__select-list__ul__button">
										<span>${position}</span>
									</button>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
        <hr>
				<div class="job__sort-bar__content__sort-select__submit">
					<input class="job__sort-bar__content__sort-select__submit-btn" type="button" value="선택 완료하기">
				</div>
			</div>
		</div>
	</section>


    <!-- 채용 공고 -->
    <div class="job__content">
    	<input type="hidden" id="jobsort" value="${param.jobsort}">
      <ul class="job__content__list">
      	<c:forEach var="jobDTO" items="${jobList}">
	        <li>
	          <input type="hidden" value="${jobDTO.seq}">
	          <a class="job__content__list__card" href="/controller/job/jobBoard?seq=${jobDTO.seq}">
	            <div>
	              <img
	                class="job__content__list__card__img"
	                src="../img/job/${jobDTO.img}"
	                 />
	            </div>
	            <div class="job__content__list__card__letter">
	              <div class="job__content__list__card__letter__position">
	                ${jobDTO.subject}
	              </div>
	              <div class="job__content__list__card__letter__company">
	                ${jobDTO.company}
	              </div>
	              <input type="button" class="job__content__list__card__letter__response" value="응답률 매우 높음 ">

                </input>
	              <div class="job__content__list__card__letter__location">
	                ${jobDTO.location}
	              </div>
	              <div class="job__content__list__card__reward">
	                채용보상금
	                <fmt:formatNumber value="${jobDTO.reward}" pattern="#,###" />
	              	원
	              </div>
	            </div>
	          </a>
	        </li>
      	</c:forEach>

      </ul>
    </div>
	<jsp:include page="../component/footer.jsp"></jsp:include>
    <script
      src="https://kit.fontawesome.com/1f61694686.js"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://code.jquery.com/jquery-3.6.1.js"
      integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
      crossorigin="anonymous"
    ></script>
    <script src="../js/job/job.js"></script>
  </body>
</html>
