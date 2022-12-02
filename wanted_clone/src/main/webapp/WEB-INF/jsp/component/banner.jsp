<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <style>
            .carousel-wrapper {
                position: relative;
                display: block;
                overflow: hidden;
                justify-content: center;
            }

            .carousel-wrapper__container {
                display: flex;
                justify-content: center;
            }

            .carousel-wrapper__container__pic {
                width: 7560px;
            }

            .carousel-wrapper__container__pic img {
                float: left;
                display: block;
                width: 1060px;
                margin-left: 20px;
                margin-right: 20px;
            }

            .btn {
                display: flex;
                justify-content: center;
                position: absolute;
                top: 120px;
                width: 100%;
            }

            .btn-wrapper {
                display: flex;
                justify-content: space-between;
                width: 100%;
            }
            .left-span button {
                cursor: pointer;
                border: 0;
                display: flex;
                align-items: center;
                position: absolute;
                width: 30px;
                height: 60px;
                opacity: 0.5;
                border-radius: 15px;
                background-color: #fff;
                left: calc((100% - 1200px) / 2);
            }
            .left-span img {
                display: inline-block;
                fill: currentColor;
                width: 1em;
                height: 1em;
            }
            .right-span button {
                cursor: pointer;
                display: flex;
                align-items: center;
                position: absolute;
                width: 30px;
                height: 60px;
                border-radius: 15px;
                background-color: #fff;
                opacity: 0.5;
                border: 0;
                right: calc((100% - 1200px) / 2);
            }
            .right-span img {
                display: inline-block;
                fill: currentColor;
                width: 1em;
                height: 1em;
            }
        </style>
    </head>
    <body>
        <div class="carousel-wrapper">
            <div class="carousel-wrapper__container">
                <div class="carousel-wrapper__container__pic">
                    <img
                        src="/controller/img/banner_img/banner.webp"
                        alt="banner1"
                    />
                </div>
                <div class="carousel-wrapper__container__pic">
                    <img
                        src="/controller/img/banner_img/banner2.webp"
                        alt="banner2"
                    />
                </div>
                <div class="carousel-wrapper__container__pic">
                    <img
                        src="/controller/img/banner_img/banner3.webp"
                        alt="banner3"
                    />
                </div>
                <div class="carousel-wrapper__container__pic">
                    <img
                        src="/controller/img/banner_img/banner4.webp"
                        alt="banner4"
                    />
                </div>
                <div class="carousel-wrapper__container__pic">
                    <img
                        src="/controller/img/banner_img/banner5.webp"
                        alt="banner5"
                    />
                </div>
                <div class="carousel-wrapper__container__pic">
                    <img
                        src="/controller/img/banner_img/banner6.webp"
                        alt="banner6"
                    />
                </div>
                <div class="carousel-wrapper__container__pic">
                    <img
                        src="/controller/img/banner_img/banner7.webp"
                        alt="banner7"
                    />
                </div>
            </div>
            <div class="btn">
                <div class="btn-wrapper">
                    <span class="left-span">
                        <button type="button" class="left-span__btn">
                            <img
                                src="/controller/img/banner_img/chevron-left-solid.svg"
                                alt=""
                            />
                        </button>
                    </span>
                    <span class="right-span">
                        <button type="button" class="right-span__btn">
                            <img
                                src="/controller/img/banner_img/chevron-right-solid.svg"
                                alt=""
                            />
                        </button>
                    </span>
                </div>
            </div>
        </div>
        <script
            src="https://code.jquery.com/jquery-3.6.1.js"
            integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
            crossorigin="anonymous"
        ></script>
        <script
            src="https://kit.fontawesome.com/1f61694686.js"
            crossorigin="anonymous"
        ></script>
        <!-- <script>
      const rightBtn = document.querySelector(".right-span__btn");
      const leftBtn = document.querySelector(".left-span__btn");

      var index = 0;

      rightBtn.addEventListener("click", function(){
          if(index === 0) return;
          index -= 1;
      });
      leftBtn.addEventListener("click", function(){
          if(index === 6) return;
          index += 1;

      });

  </script> -->
    </body>
</html>
<!-- <body>
  <div class="window">
    <ul class="container">
      <li class="cell">
        <img src="/controller/img/banner_img/banner.webp" alt="banner1">
      </li>
      <li class="cell">
        <img src="/controller/img/banner_img/banner2.webp" alt="banner2">
      </li>
      <li class="cell">
        <img src="/controller/img/banner_img/banner3.webp" alt="banner3">
      </li>
      <li class="cell">
        <img src="/controller/img/banner_img/banner4.webp" alt="banner4">
      </li>
      <li class="cell">
        <img src="/controller/img/banner_img/banner5.webp" alt="banner5">
      </li>
      <li class="cell">
        <img src="/controller/img/banner_img/banner6.webp" alt="banner6">
      </li>
    </ul>
  </div>




  <script>
    const container = document.querySelector(".container");
    const prevBtn = document.querySelector(".prev");
    const nextBtn = document.querySelector(".next");

    (function addEvent() {
      prevBtn.addEventListener('click', translateContainer.bind(this, 1));
      nextBtn.addEventListener('click', translateContainer.bind(this, -1));
    })();

    function translateContainer(direction) {
      const selectedBtn = (direction === 1) ? 'prev' : 'next';
      container.style.transitionDuration = '500ms';
      container.style.transform = `translateX(${direction * (100 / 5)}%)`;
      container.ontransitionend = () => reorganizeEl(selectedBtn);
    }

    function reorganizeEl(selectedBtn) {
      container.removeAttribute('style');
      (selectedBtn === 'prev') ? container.insertBefore(container.lastElementChild, container.firstElementChild) : container.appendChild(container.firstElementChild);
    }

  </script>
</body>
</html> -->

<!-- <div id="banner-wrap">
  <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active" data-bs-interval="5000">
        <img src="/controller/img/banner_img/banner.webp" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item" data-bs-interval="5000">
        <img src="/controller/img/banner_img/banner2.webp" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item" data-bs-interval="5000">
        <img src="/controller/img/banner_img/banner3.webp" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item" data-bs-interval="5000">
        <img src="/controller/img/banner_img/banner4.webp" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item" data-bs-interval="5000">
        <img src="/controller/img/banner_img/banner5.webp" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item" data-bs-interval="5000">
        <img src="/controller/img/banner_img/banner6.webp" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item" data-bs-interval="5000">
        <img src="/controller/img/banner_img/banner7.webp" class="d-block w-100" alt="...">
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
  </div> -->
