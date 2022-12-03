<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/styles.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="../component/header.jsp"></jsp:include>

<container class="my_community_container">
    <div class="my_community_body">
        <div class="my_community_body__head"><span>MY 커뮤니티</span></div>

        <div class="my_community_body__user_imformation">
            <div class="my_community_body__user_imformation__profile">
              <img class="my_community_body__user_imformation__profile__img" src="../img/profile_default.png">
              <span>아이디란</span> 
            </div>
            <hr class="my_community_hr">
            <div class="my_community_body__user_imformation__favorite">
                <div class="my_community_body__user_imformation__favorite_title">관심주제</div>
                <div class="my_community_body__user_imformation__favorite_tag">
                    <input type="button" class="favorite_tag" value="취업/이직">
                    <input type="button" class="favorite_tag" value="개발">
                    <input type="button" class="favorite_tag" value="데이터">
                    <input type="button" class="favorite_tag" value="IT/기술">
                </div>
            </div>
        </div>
        
        <div class="my_community_body__my_action">
            <div class="my_community_body__my_action_title"><h2>내 활동</h2></div>
            <ul class="my_community_body__my_action_kind">
                <li>작성글</li>
                <li>작성댓글</li>
            </ul>
        </div>

        <div class="my_community_body__content_body">
              

         </div>

    </div>
<input type="hidden" id="session_id" value="${id }">
</container>
<script src="https://kit.fontawesome.com/1f61694686.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="../js/community/myCommunity.js"></script>

</body>
</html>