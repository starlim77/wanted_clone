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
    <title>Wanted Job</title>
  </head>
  <body>
	<jsp:include page="../../jsp/component/header.jsp"></jsp:include>
	
	<section class="job__sort-bar">
		<div class="job__sort-bar__content">
			<ul class="job__sort-bar__content__all-list">
				<li class="job__sort-bar__content__all-list__develop">
					개발
				</li>
				<hr>
				<li class="job__sort-bar__content__all-list__develop__job-list">
					개발 전체
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
				<div>
					<input type="button" value="선택하기">
				</div>
			</div>
		</div>
		<hr>
	</section>

    <!-- 채용 공고 -->
    <div class="job__content">
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
