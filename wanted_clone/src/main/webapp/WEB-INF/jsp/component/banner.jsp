<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">
    
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    
        <style>
            .slide-body{
                width: 100vw;
                display: flex;
                justify-content: center;
                flex-wrap: wrap;
            }
            .slides li {
                list-style-type: none;
            }
    
            /* 보여줄 구간의 높이와 넓이 설정 */
            #slideShow {
                /*전체 컨테이너*/
                height: 300px;
                width: 100%;
                position: relative;
                overflow: hidden;
                display: flex;
                justify-content: center;
            }
    
            .slides {
                /*이미지들이 담겨있는 슬라이드 컨테이너*/
                display: flex;
                justify-content: center;
                position: absolute;
                left: 0;
                top: 0;
                width: 1100px;
                /* 슬라이드할 사진과 마진 총 넓이 */
                transition: 0.5s ease-out;
                /*ease-out: 처음에는 느렸다가 점점 빨라짐*/
            }
    
            /* 첫 번째 슬라이드 가운데에 정렬하기위해 첫번째 슬라이드만 margin-left조정 */
            .slides li:first-child {
                /* margin-left: 750px */
                margin-left: 2.05%;
            }
    
            .slides li:not(:last-child) {
                float: left;
            }
    
            .slide-img {
                display: flex;
                width: 1060px;
                margin-left: 20px;
                margin-right: 20px;
            }
    
            .slides li {
                display: flex;
                justify-content: center;
            }
    
    
            /* 슬라이드들 옆으로 정렬 */
            .slides li:not(:last-child) {
                display: flex;
            }
    
    
            /* -------------------------------- */
            /* 화살표 */
            .controller-wrapper {
                display: flex;
                justify-content: center;
                width: 1300px;
            }
    
            .controller {
                display: flex;
                width: 1000px;
            }
    
            .controller span {
                position: absolute;
                background-color: transparent;
                color: black;
                text-align: center;
                border-radius: 50%;
                padding: 10px 20px;
                top: 50%;
                font-size: 1.3em;
                cursor: pointer;
            }
    
            /* 이전, 다음 화살표에 마우스 커서가 올라가 있을때 */
            .controller span:hover {
                background-color: rgba(128, 128, 128, 0.11);
            }
    
            .prev {
                left: 10px;
            }
    
            /* 이전 화살표에 마우스 커서가 올라가 있을때 이전 화살표가 살짝 왼쪽으로 이동하는 효과*/
            .next {
                right: 10px;
            }
    
            /* 다음 화살표에 마우스 커서가 올라가 있을때 이전 화살표가 살짝 오른쪽으로 이동하는 효과*/
        </style>
    </head>
    
    <body class="slide-body">
        <div id="slideShow">
            <ul class="slides">
                <li>
                    <div class="slide-img">
                        <img src="/controller/img/banner_img/banner.webp" alt="banner1">
                    </div>
                </li>
                <li>
                    <div class="slide-img">
                        <img src="/controller/img/banner_img/banner2.webp" alt="banner2">
                    </div>
                </li>
                <li>
                    <div class="slide-img">
                        <img src="/controller/img/banner_img/banner3.webp" alt="banner3">
                    </div>
                </li>
                <li>
                    <div class="slide-img">
                        <img src="/controller/img/banner_img/banner4.webp" alt="banner4">
                    </div>
                </li>
                <li>
                    <div class="slide-img">
                        <img src="/controller/img/banner_img/banner5.webp" alt="banner5">
                    </div>
                </li>
                <li>
                    <div class="slide-img">
                        <img src="/controller/img/banner_img/banner6.webp" alt="banner6">
                    </div>
                </li>
                <li>
                    <div class="slide-img">
                        <img src="/controller/img/banner_img/banner7.webp" alt="banner7">
                    </div>
                </li>
            </ul>
            <div class="controller-wrapper">
                <p class="controller">
                    <!-- &lang: 왼쪽 방향 화살표 &rang: 오른쪽 방향 화살표 -->
                    <span class="prev">&lang;</span>
                    <span class="next">&rang;</span>
                </p>
            </div>
        </div>
    
        <script src="https://code.jquery.com/jquery-3.6.1.js"
            integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/1f61694686.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.1.js"
            integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
        <script src="/controller/js/component/banner.js"></script>
    </body>
    
    </html>