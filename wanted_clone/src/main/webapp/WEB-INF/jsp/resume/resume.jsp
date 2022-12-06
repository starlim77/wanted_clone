<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>원티드 이력서</title>
        <link rel="icon" href="../img/favicon-192x192.png" />
        <link rel="stylesheet" href="../css/styles.css" />
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css"
        />
    </head>
    <body class="resume_body">
        <!--  header -->
        <div>
            <jsp:include page="../../jsp/component/header.jsp"></jsp:include>
        </div>
        <div id="resume-container">
            <input type="text" id="idDiv" style="visibility:hidden ;">
            <!-- banner -->
            <div id="resume-wrap">
                <div id="banner">
                    <button id="banner-btn">
                        <h5 id="banner-btn__txt">
                            이력서 작성이 쉬워진다! 1분 만에 채워지는 경력정보
                        </h5>
                        <div id="banner-btn__img">
                            <img
                                alt=""
                                src="/controller/img/resume/trio.webp"
                            />
                        </div>
                        <div id="banner-btn__inner-btn">
                            <div id="banner-btn__inner-btn__txt">
                                내 경력 불러오기
                            </div>
                        </div>
                    </button>
                </div>
                <!-- *************** -->
                <div id="middle-txt">
                    최근 문서
                    <div id="space"></div>
                    <div id="middle-txt__resume-intro">
                        <a href="#">원티드 이력서 소개</a>
                    </div>
                </div>

                <!-- 새 이력서 작성 -->
                <div class="resume">
                    <div
                        class="resume__btn"
                        onclick="location.href='resumeForm'"
                    >
                        <div id="my-new-resume__img">
                            <i
                                class="fa-regular fa-clone fa-xl"
                                id="new-resume-icon"
                            ></i>
                        </div>
                        <div class="resume__box__txt">
                            <h3>새 이력서 작성</h3>
                        </div>
                    </div>
                    <!-- 파일 업로드 -->
                    <div class="resume__file-upload">
                        <div class="resume__btn__upload-img">
                            <i
                                class="fa-light fa-folder-arrow-up"
                                id="resume__upload-icon"
                            ></i>
                        </div>
                        <div class="resume__box__txt">
                            <h3>파일 업로드</h3>
                        </div>
                    </div>

                    <!-- 등록된 이력서 -->
                    <!-- <div class="old-resume">	
					<div class="resume-box-top">
						<div class="resume-box-top__h3">
							asdfasfdsfa
						</div>
						<div class="resume-box-top__p">
							<p>sdfgfdsfsfd</p>
						</div>
					</div>
					<div class="resume-box-bottom">
						작성중
					</div>
				</div> -->
                    <!-- --------- -->
                    <form action="" id="portfolio-form">
                        <input
                            type="file"
                            class="file-upload"
                            name="portfolio"
                            id="portfolio"
                        />
                    </form>
                    <!--  -->
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-latest.min.js"></script>
        <script
            src="https://kit.fontawesome.com/1f61694686.js"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://code.jquery.com/jquery-3.6.1.js"
            integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
            crossorigin="anonymous"
        ></script>
        <script
            type="text/javascript"
            src="../js/resume/resumeMain.js"
        ></script>
    </body>
</html>
