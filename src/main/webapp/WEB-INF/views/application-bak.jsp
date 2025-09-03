<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

 <style>
     /* Swiper를 .container의 배경으로 설정하기 위한 CSS */
     .page-section {
         position: relative;
         overflow: hidden;
     }

     .swiper.mySwiper {
         position: absolute;
         top: 0;
         left: 0;
         width: 100%;
         height: 100%;
         z-index: -1;
     }

     .swiper-slide video {
         width: 100%;
         height: 100%;
         object-fit: cover;
     }

     .swiper-slide-active {
         opacity: 1 !important;
     }

     .swiper-slide {
         opacity: 0;
         transition: opacity 2s cubic-bezier(0.33, 1, 0.68, 1);
     }

     .container>.text-center,
     .container>.feature-grid {
         position: relative;
         z-index: 10;
     }

     /* Swiper 페이지 네비게이션 스타일링 */
     .swiper-pagination,
     .swiper-pagination2 {
         z-index: 2;
     }

     .swiper-button-prev,
     .swiper-button-next,
     .swiper-button-prev2,
     .swiper-button-next2,
     .swiper-button-prev3,
     .swiper-button-next3 {
         color: #fff;
         z-index: 10;
     }

     .swiper.mySwiper2 {
         position: absolute;
         /*top: 0;*/
         left: 0;
         width: 100%;
         height: 100%;
         z-index: -1;
     }

     .swiper.mySwiper2 .swiper-slide {
         width: 100%;
         height: 100%;
         object-fit: cover;
     }

     /* Swiper2 styling for carousel layout */
     .swiper.mySwiper2 {
         position: relative;
         /* Changed from absolute to relative for proper container integration */
         width: 100%;
         height: auto;
         /* Allow height to adjust based on content */
         z-index: 1;
         /* Ensure it’s above other elements but not overlapping unintentionally */
     }

     .swiper.mySwiper2 .swiper-slide {
         width: 100%;
         /* Default to full width for single slide on mobile */
         height: auto;
         /* Allow height to adjust based on content */
         display: flex;
         /* Ensure content inside slide is flexible */
         justify-content: center;
         /* Center content horizontally */
         align-items: center;
         /* Center content vertically */
         opacity: 1;
         /* Ensure all slides are visible by default */
         transition: opacity 0.5s ease;
         /* Smooth transition for active slide */
     }

     .swiper.mySwiper2 .swiper-slide-active {
         opacity: 1;
         /* Ensure active slide is fully visible */
     }

     .use-box {
         width: 100%;
         max-width: 400px;
         /* Limit max width for each slide */
         margin: 0 auto;
         /* Center the content */
         box-sizing: border-box;
         /* Ensure padding doesn’t affect width */
     }

     .swiper.mySwiper3 {
         position: absolute;
         /*top: 0;*/
         left: 0;
         width: 100%;
         /*height: 100%;*/
     }

     /* Responsive breakpoints for larger screens */
     @media (min-width: 768px) {
         .swiper.mySwiper2 .swiper-slide {
             width: 33.33%;
             /* Show 3 slides per view on larger screens */
         }
     }

     .swiper-button-prev2,
     .swiper-button-next2 {
         color: #fff !important;
         z-index: 10;
     }

     .swiper-button-next2,
     .swiper-button-prev2 {
         position: absolute;
         top: var(--swiper-navigation-top-offset, 50%);
         width: calc(var(--swiper-navigation-size) / 44 * 27);
         height: var(--swiper-navigation-size);
         margin-top: calc(0px - (var(--swiper-navigation-size) / 2));
         z-index: 10;
         cursor: pointer;
         display: flex;
         align-items: center;
         justify-content: center;
         color: #888 !important;
     }

     .swiper-button-prev2,
     .swiper-rtl .swiper-button-next2 {
         /*left: var(--swiper-navigation-sides-offset, 10px);
        right: auto;*/
         left: unset;
         right: 50px;
     }

     .swiper-button-next2,
     .swiper-rtl .swiper-button-prev2 {
         right: var(--swiper-navigation-sides-offset, 10px);
         left: auto;
     }

     .swiper-button-prev2:after,
     .swiper-rtl .swiper-button-next2:after {
         content: 'prev';
     }

     .swiper-button-next2:after,
     .swiper-rtl .swiper-button-prev2:after {
         content: 'next';
     }

     .swiper-button-next2:after,
     .swiper-button-prev2:after {
         font-family: swiper-icons;
         font-size: 30px;
         text-transform: none !important;
         letter-spacing: 0;
         font-variant: initial;
         line-height: 1;
     }

     .mask {
         position: absolute;
         top: 0;
         left: 0;
         width: 100%;
         background-color: #000;
         z-index: 1;
         height: 100%;
         opacity: .3;
     }

     /* application css */

     #home-tab-pane .carousel-content {
         display: flex;
         width: 100%;
         transition: transform 0.5s ease-in-out;
         /* 부드러운 슬라이드 전환 */
     }

     #home-tab-pane .carousel-item {
         flex: 0 0 100%;
         /* 각 아이템이 전체 너비를 차지 */
         display: none;
         /* 기본적으로 숨김 */
     }

     #home-tab-pane .carousel-item.active {
         display: block;
         /* 활성 슬라이드만 표시 */
     }

 </style>

 <!-- Application Page -->
 <section id="application" class="page-section">
     <div class="dynamic-backdrop">
         <div class="gradient-glow"></div>
     </div>

     <div class="container">

         <h2 class="align-items-center align-items-lg-baseline d-flex flex-column gap-2 mb-4" style="font-size: 2rem; margin-top: 0.75rem;"><span class="pill">Application</span> 임상 워크플로우를 위한 전용 애플리케이션</h2>
         <div class="d-flex flex-column flex-md-row flex-lg-row gap-2 gap-lg-0">
             <ul class="nav nav-tabs gap-2 flex-fill border-bottom-0" id="myTab" role="tablist">
                 <li class="nav-item hbp" role="presentation">
                     <button class="nav-link active align-items-end d-flex justify-content-center" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">HBP</button>
                 </li>
                 <li class="nav-item lung" role="presentation">
                     <button class="nav-link align-items-end d-flex justify-content-center" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">LUNG</button>
                 </li>
                 <li class="nav-item cardiac" role="presentation">
                     <button class="nav-link align-items-end d-flex justify-content-center" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">CARDIAC</button>
                 </li>
                 <li class="nav-item knee" role="presentation">
                     <button class="nav-link align-items-end d-flex justify-content-center" id="disabled-tab" data-bs-toggle="tab" data-bs-target="#disabled-tab-pane" type="button" role="tab" aria-controls="disabled-tab-pane" aria-selected="false">KNEE</button>
                 </li>
             </ul>
             <div class="align-items-end d-flex justify-content-end"><button class="btn btn-danger" onclick="location.href='request.jsp'">의뢰하기</button></div>
         </div>
         <div class="tab-content" id="myTabContent">
             <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
                 <div class="carousel">
                     <div class="carousel-content">
                         <div class="carousel-item active text-center h-100">
                             <div class="d-flex align-items-center flex-column flex-lg-row justify-content-between gap-5 h-100">
                                 <div class="align-items-baseline d-flex flex-column gap-3">
                                     <div class="txt-lg">LIVER</div>
                                     <div class="txt-sub">
                                         <div>혈관 선택에 따라 구역 나누기.</div>
                                         <div>Region 부위의 volume 측정.</div>
                                     </div>
                                 </div>
                                 <div class="volume-list d-flex flex-column h-100 justify-content-between text-start">
                                     <div>Simulation images<br>160mA(500 msec)</div>
                                     <div>
                                         <div style="color: #cc66ff;">Cut area of liver: 35cm²</div>
                                         <div style="color: #faa61a;">Total volume of liver: 1125ml</div>
                                         <div style="color: #faa61a;"># Liver: 1072ml(95.3%)</div>
                                         <div style="color: #ff85de;"># Portal</div>
                                         <div style="color: #cc66ff;"># Vein</div>
                                         <div style="color: #ccff33;"># Bile duct</div>
                                         <div style="color: #00f5d4;"># PV1: 53ml(4.7%)</div>
                                     </div>
                                 </div>
                                 <div class="d-flex flex-column flex-fill h-100 justify-content-between position-relative">
                                     <div class="swiper mySwiper3">
                                         <div class="swiper-wrapper">
                                             <div class="swiper-slide">
                                                 <img src="assets/images/tab1-cont-img01.png" width="">
                                             </div>
                                             <div class="swiper-slide">
                                                 <img src="assets/images/tab1-cont-img01.png" width="">
                                             </div>
                                             <div class="swiper-slide">
                                                 <img src="assets/images/tab1-cont-img01.png" width="">
                                             </div>
                                         </div>
                                         <!--<div class="swiper-pagination2"></div>-->
                                     </div>
                                     <div class="position-absolute bottom-0 end-0 button-group justify-content-center justify-content-lg-end px-3 px-lg-5"><button class="btn-secondary" onclick="location.href='application.jsp'" style="padding: 0.5rem 1.25rem;">Learn more</button></div>
                                 </div>
                             </div>
                         </div>
                         <div class="carousel-item active text-center">
                             <div class="d-flex align-items-center flex-column flex-lg-row justify-content-between gap-5">
                                 <div class="align-items-baseline d-flex flex-column gap-3">
                                     <div class="txt-lg">PANCREAS</div>
                                     <div class="txt-sub">
                                         <div></div>
                                         <div></div>
                                     </div>
                                 </div>
                                 <div class="d-flex flex-column flex-fill h-100 justify-content-center gap-3">
                                     <div>
                                         <!--<img src="assets/images/tab1-cont-img02.png" width="">-->
                                     </div>
                                     <div class="button-group justify-content-center justify-content-lg-end px-3 px-lg-5"><button class="btn-secondary" onclick="location.href='application.jsp'" style="padding: 0.5rem 1.25rem;">Learn more</button></div>
                                 </div>
                             </div>
                         </div>
                     </div>
                     <div class="carousel-controls">
                         <button class="carousel-prev fs-1" onclick="prevSlide()"><img class="w-75" src="assets/images/arrow-right.png"></button>
                         <button class="carousel-next fs-1" onclick="nextSlide()"><img class="w-75" src="assets/images/arrow-left.png"></button>
                     </div>
                     <div class="carousel-dots">
                         <button class="carousel-dot active" onclick="setCarouselSlide(0)"></button>
                         <button class="carousel-dot" onclick="setCarouselSlide(1)"></button>
                     </div>
                 </div>
             </div>
             <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
                 <div class="carousel">
                     <div class="carousel-content">
                         <div class="carousel-item active text-center">
                             <div class="d-flex align-items-center flex-column flex-lg-row justify-content-between gap-5">
                                 <div class="align-items-baseline d-flex flex-column gap-3">
                                     <div class="txt-lg">LUNG</div>
                                 </div>
                                 <div class="d-flex flex-column flex-fill h-100 justify-content-center">
                                     <div class="button-group justify-content-end px-3 px-lg-5"><button class="btn-secondary" onclick="location.href='#'" style="padding: 0.5rem 1.25rem;">Learn more</button></div>
                                 </div>
                             </div>
                         </div>
                     </div>
                     <div class="carousel-dots">
                         <button class="carousel-dot active" onclick="setCarouselSlide(0)"></button>
                     </div>
                 </div>
             </div>
             <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
                 <div class="carousel">
                     <div class="carousel-content">
                         <div class="carousel-item active text-center">
                             <div class="d-flex align-items-center flex-column flex-lg-row justify-content-between gap-5">
                                 <div class="align-items-baseline d-flex flex-column gap-3">
                                     <div class="txt-lg">CARDIAC</div>
                                 </div>
                                 <div class="d-flex flex-column flex-fill h-100 justify-content-center">
                                     <div class="button-group justify-content-end px-3 px-lg-5"><button class="btn-secondary" onclick="location.href='#'" style="padding: 0.5rem 1.25rem;">Learn more</button></div>
                                 </div>
                             </div>
                         </div>
                     </div>
                     <div class="carousel-dots">
                         <button class="carousel-dot active" onclick="setCarouselSlide(0)"></button>
                     </div>
                 </div>
             </div>
             <div class="tab-pane fade" id="disabled-tab-pane" role="tabpanel" aria-labelledby="disabled-tab" tabindex="0">
                 <div class="carousel">
                     <div class="carousel-content">
                         <div class="carousel-item active text-center">
                             <div class="d-flex align-items-center flex-column flex-lg-row justify-content-between gap-5">
                                 <div class="align-items-baseline d-flex flex-column gap-3">
                                     <div class="txt-lg">KNEE</div>
                                 </div>
                                 <div class="d-flex flex-column flex-fill h-100 justify-content-center">
                                     <div class="button-group justify-content-end px-3 px-lg-5"><button class="btn-secondary" onclick="location.href='#'" style="padding: 0.5rem 1.25rem;">Learn more</button></div>
                                 </div>
                             </div>
                         </div>
                     </div>
                     <div class="carousel-dots">
                         <button class="carousel-dot active" onclick="setCarouselSlide(0)"></button>
                     </div>
                 </div>
             </div>
         </div>


     </div>
 </section>

 <!-- Swiper JS -->
 <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
 <script>
     var swiper3 = new Swiper(".mySwiper3", {
         slidesPerView: 1,
         /* Default to 1 slide per view on mobile */
         spaceBetween: 10,
         pagination: {
             el: ".swiper-pagination2",
             clickable: true,
         },
         breakpoints: {
             768: {
                 slidesPerView: 1,
                 /* Show 3 slides on screens >= 768px */
                 spaceBetween: 25.4,
             },
         },
         loop: true,
     });

 </script>

<jsp:include page="footer.jsp" />