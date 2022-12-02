<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/styles.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../component/header.jsp"></jsp:include>

	<section class="profile">
		<h2 class="profile__title">MY 원티드</h2>
		<div class="profile__title__container">
			<aside class="profile__title__container__aside">
				<div class="profile__title__container__aside__sub">
					<div class="sub__profile">
						<img class="sub__profile__img"
							src="/controller/img/profile_default.png" alt="profile_default">
					</div>
					<a>
						<div class="sub__profile__name">${name}</div>
						<div class="sub__profile__email">${id}</div>
						<div class="sub__profile__phone">${tel}</div>
					</a>
				</div>
			</aside>
			<section class="profile__title__container__body">
				<div class="profile__title__container__body__summary">
					<h2 class="summary__apply">지원 현황</h2>
					<ul class="summary__content">
						<li><a> <em class>${count}</em> <span>지원 완료</span>
						</a></li>
						<li><a> <em class>0</em> <span>이력서 열람</span>
						</a></li>
						<li><a> <em class>0</em> <span>최종 합격</span>
						</a></li>
						<li><a> <em class>0</em> <span>불합격</span>
						</a></li>
					</ul>
				</div>
				<div class="profile__title__container__Body__table">
					<div class="table__list">
						<ul class="table__list__header__content">
							<div class="table__list__header">
								<span class="table__list__header__company">지원회사</span> 
								<span class="table__list__header__position">지원 포지션</span> 
								<span class="table__list__header__period">작성시간</span> 
								<span class="table__list__header__progress">진행상태</span>
							</div>
							<c:forEach var="jobApplyDTO" items="${list}">
							<li>
								<div>
									<span class="table__list__header__company">${jobApplyDTO.company}</span>
								</div>
								<div>
									<span class="table__list__header__position">${jobApplyDTO.position}</span>
								</div>
								<div>
									<span class="table__list__header__period">${jobApplyDTO.logtime}</span>
								</div>
								<div>
									<span class="table__list__header__progress">${jobApplyDTO.apply}</span>
								</div>
							</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</section>
		</div>
	</section>
	<jsp:include page="../component/footer.jsp"></jsp:include>
	<script src="https://kit.fontawesome.com/1f61694686.js"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.1.js"
		integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
		crossorigin="anonymous"></script>
	<script src="../js/job/job.js"></script>
</body>
</html>