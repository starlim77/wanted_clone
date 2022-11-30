<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/styles.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../component/header.jsp"></jsp:include>
    <container>
      <div class="board_body">
        <div class="community_board">
          <div class="community_board__profile">
            <img class="profile_img" src="../img/profile_default.png" /><span class="profile_id">asd</span>
          </div>
		  <div id ="update_hidden_box">
	          <div class="community_board__title">
	            
	          </div>
	
	          <div class="community_board__content">
	            
	          </div>
		  </div>
          <div class="community_board__theme">
              <div class="community_board__theme_tag">태그</div>
              <div class="community_board__theme_btn">
              	<input type="button" id="community_board__update_complete_btn" value="수정완료">
                <input type="button" id="community_board__update_btn" value="글 수정하기">
                <input type="button" id="community_board__delete_btn" value="글 삭제하기"> 
              </div>
            </div>

          <div class="community_board__bottom">
            <div class="community_board__bottom__like"><i class="fa-regular fa-thumbs-up fa-2x"></i><span></span></div>
            <div class="community_board__bottom__coment"><i class="fa-regular fa-comment fa-2x"></i><span></span>1</div>
            <div class="community_board__bottom__blank"></div>
            <div class="community_board__bottom__icon">
              <i class="fa-regular fa-share-from-square fa-2x"></i><i class="fa-solid fa-ellipsis fa-2x"></i>
            </div>
          </div>


        </div>
        <div class="community_comment">
          <div class="community_comment_bean">

			<c:forEach var="commentDTO" items="${commentList}">
            <div class="community_comment_dto">
              <div class="community_comment__profile">
                <div class="community_comment__profile__name"><img class="profile_img" src="../img/profile_default.png" /><span>${commentDTO.id_ }</span></div>
                <i class="fa-solid fa-ellipsis fa-2x"></i>
              </div>
              <div class="community_comment__content">${commentDTO.comment_ }</div>
            </div>
            <hr class="comment_hr">
            
            
            </c:forEach>
          </div>
          
          <div class="community_comment__write">
            <div class="community_comment__profile">
              <div class="community_comment__profile__name"><img class="profile_img" src="../img/profile_default.png" /><span></span></div>
              <i class="fa-solid fa-ellipsis fa-2x"></i>
            </div>
            <div class="community_comment__write__content_body">
              <textarea class="community_comment__write__content"></textarea>
              <div class="community_comment__write__content_body__btn"><input type="button" id="community_comment__write__content_body__btn" value="등록"></div>
            </div>
          </div>
          <div class="community_comment__bottom"><input type="button" class="community_comment__bottom_button" value="목록으로"></div>

        </div>
      </div>
    </container>
    
    <input type="hidden" id="session_id" value="${id }">
    <input type="hidden" id="sortnum" value="${sortnum }">
<script src="https://kit.fontawesome.com/1f61694686.js" crossorigin="anonymous"></script>

<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script><!-- CDN 방식 -->
<script type="text/javascript" src="../js/community/communityBoard.js"></script>
</body>
</html>