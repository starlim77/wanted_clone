<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
    <link rel="stylesheet" href="../css/styles.css" />
    <meta charset="UTF-8" />
    <link rel="icon" href="../img/favicon-192x192.png" />
    <title>${jobDTO.subject}</title>
  </head>
  <body>
  	<jsp:include page="../component/header.jsp"></jsp:include>
  
  
    <section class="jobboard">
      <input type="hidden" class="jobboard__seq" value="${param.seq}">
       <input class="position" type="hidden" value="${jobDTO.position}">	 
      <div class="jobboard__all-content">
        <div class="jobboard__all-content__information">
          <img src="../img/job/${jobDTO.img}" />
          <div class="jobboard__all-content__information__subject">
            ${jobDTO.subject}
          </div>
          <div class="jobboard__all-content__information__detail">
            <span id="company" >${jobDTO.company}</span>
            <span class="jobboard__all-content__information__detail__location"
              > ${jobDTO.location}</span
            >
          </div>
          <div class="jobboard__all-content__content">
            <pre>${jobDTO.content}</pre>
          </div>
          <div class="jobboard__all-content__date-location">
            <div>마감일</div>
            <div>상시</div>
          </div>
          <div class="jobboard__all-content__date-location"">
            <div>근무지역</div>
            <div id="companylocation">${jobDTO.companylocation}</div>
          </div>
          <div class="jobboard__all-content__map" id="map">
        </div>

      </div>



      <div class="jobboard__apply">
        <h4>채용보상금</h4>
        <div class="jobboard__apply__reward">
          <div>
            <span>추천인</span>
            <p>${jobDTO.reward}원</p>
          </div>
          <div>
            <span>지원자</span>
            <p>${jobDTO.reward}원</p>
          </div>
        </div>
        <input type="hidden" class="jobboard__apply__session-id" value="${id}">
        <input class="jobboard__apply__apply-btn" type="button" value="지원하기" />
      </div>



      <div class="jobboard__submit">
        <div class="jobboard__submit__subject">
          <h3>지원하기</h3>
          <h4>뒤로</h4>
        </div>
        <div class="jobboard__submit__content">
          <div class="jobboard__submit__content__tip">
            <p>주요 업무 내용을 한 번 더 확인해 주세요.</p>
            <p>직무와 맞는 포지션일수록 서류합격률이 높아져요.</p>
          </div>
          <h5 class="jobboard__submit__content__subject">지원 정보</h5>
          <div class="jobboard__submit__content__form">
            <h4>이름</h4>
            <input type="text" readonly value="${name}">
          </div>
          <div class="jobboard__submit__content__form">
            <h4>이메일</h4>
            <input class="id" type="text" readonly value="${id}">
          </div>
          <div class="jobboard__submit__content__form">
            <h4>휴대폰 번호</h4>
            <input class="jobboard__submit__content__form__phone" type="text" value="${tel}">
            <i class="fa-solid fa-chevron-right"></i>
          </div>
          <h5 class="jobboard__submit__content__subject">첨부파일</h5>
          <div class="jobboard__submit__content__file">
          	
        
          	<c:forEach var="resumeDTO" items="${list}">
          		<c:if test="${!empty resumeDTO.fileName}">
          			<div class="jobboard__submit__content__file__each">
		              <div class="jobboard__submit__content__file__checkbox">
		              	<input type="hidden" value="${resumeDTO.resume_seq}">
		                <input id="file-checkbox${resumeDTO.resume_seq}" type="checkbox">
		                <label class="jobboard__submit__content__file__checkbox__label" for="file-checkbox${resumeDTO.resume_seq}"><i class="fa-solid fa-check"></i></label>
		              </div>
		              <div class="jobboard__submit__content__file__each__information">
		                <span>${resumeDTO.fileName}</span>
		                <div>
		                  <span>${resumeDTO.logtime}</span>
		                  <span>첨부파일</span>
		                </div>
		              </div>
		            </div>
          		</c:if>
          		<c:if test="${empty resumeDTO.fileName && resumeDTO.writing=='1'}">
          			<div class="jobboard__submit__content__file__each">
		              <div class="jobboard__submit__content__file__checkbox">
		              	<input type="hidden" value="${resumeDTO.resume_seq}">
		                <input id="file-checkbox${resumeDTO.resume_seq}" type="checkbox">
		                <label class="jobboard__submit__content__file__checkbox__label" for="file-checkbox${resumeDTO.resume_seq}"><i class="fa-solid fa-check"></i></label>
		              </div>
		              <div class="jobboard__submit__content__file__each__information">
		                <span>${resumeDTO.formName}</span>
		                <div>
		                  <span>${resumeDTO.logtime}</span>
		                  <span>작성완료</span>
		                </div>
		              </div>
		            </div>
          		</c:if>
          		<c:if test="${empty resumeDTO.fileName && resumeDTO.writing=='0'}">
          			<div class="jobboard__submit__content__file__each-disable">
		              <div class="jobboard__submit__content__file__checkbox-disable">
		              	<input type="hidden" value="${resumeDTO.resume_seq}">
		                <input id="file-checkbox${resumeDTO.resume_seq}" type="checkbox">
		                <label class="jobboard__submit__content__file__checkbox__label-disable" for="file-checkbox${resumeDTO.resume_seq}"><i class="fa-solid fa-check"></i></label>
		              </div>
		              <div class="jobboard__submit__content__file__each__information">
		                <span>${resumeDTO.formName}</span>
		                <div>
		                  <span>${resumeDTO.logtime}</span>
		                  <span>작성 중</span>
		                </div>
		              </div>
		            </div>
          		</c:if>
          	</c:forEach>
            
          </div>
          <input class="jobboard__submit__content__upload" type="button" value="파일 업로드">
          <form  id="portfolio-form" >
		  	<input type="file" class="file-upload" name="portfolio" id="portfolio">
		  </form>
          <input class="jobboard__submit__content__write" type="button" value="새 이력서 작성">
          <p class="jobboard__submit__content__last-tip">원티드 이력서로 지원하면 최종합격률이 40% 높아집니다.</p>
        </div>
        <input class="jobboard__submit__submit-btn" type="button" value="제출하기">
      </div>

    </section>

    <h2 class="see-more">채용 공고 더 보기</h2>
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
      src="https://code.jquery.com/jquery-3.6.1.js"
      integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
      crossorigin="anonymous"
    ></script>
    <script
      src="https://kit.fontawesome.com/1f61694686.js"
      crossorigin="anonymous"
    ></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=894dddd5929cb9481f751a3bd0c05a42&libraries=services"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=4jkzld2vgn"></script>
    <script src="../js/job/jobBoard.js"></script>
  </body>
  </body>
</html>

