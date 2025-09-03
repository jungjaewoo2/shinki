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

         <h2 class="align-items-center align-items-lg-baseline d-flex flex-column gap-2 mb-4" style="font-size: 2rem; margin-top: 0.75rem;">
             <span class="pill">HBP</span>
             <div class="d-flex flex-column flex-lg-row gap-4 w-100">
                 <div>Hepatobiliary phase</div>
                 <div class="modality d-flex gap-1">
                     <span>CT</span>
                     <span>MR</span>
                 </div>
                 <div class="d-flex flex-fill justify-content-end">
                     <div class="align-items-end d-flex justify-content-end"><button class="btn btn-danger" onclick="location.href='request.jsp'">의뢰하기</button></div>
                 </div>
             </div>
         </h2>

         <!--<div>
             <div>
                 <a class="btn btn-primary" data-bs-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">Liver Analysis</a>
                 <div class="row">
                     <div class="col">
                         <div class="collapse multi-collapse" id="multiCollapseExample1">
                             <div class="card card-body">
                                 <ul>
                                     <li>- 조영 증강된 CT image 및 MRI image를 사용하여 Liver 및 Blood vessel region 등을 3D로 재구성하고 결과를 관찰할 수 있습니다.</li>
                                     <li>- 수동 및 자동으로 Lobe, Segment 및 임의의 territory를 분리할 수 있으며, 분리한 Region의 절제면, 절제면에서의 Vessel 및 territory의 volume 등을 측정할 수 있습니다.</li>
                                     <li>- 3D로 재구성 된 복합적인 장기들을 Laparascopic view로 관찰할 수 있습니다.</li>
                                 </ul>
                             </div>
                         </div>
                     </div>
                     <div class="col">
                         <div class="collapse multi-collapse" id="multiCollapseExample2">
                             <div class="card card-body">
                                 <ul>
                                     <li>- 조영 증강된 CT image 및 MRI image를 사용하여 Liver 및 Blood vessel region 등을 3D로 재구성하고 결과를 관찰할 수 있습니다.</li>
                                     <li>- 수동 및 자동으로 Lobe, Segment 및 임의의 territory를 분리할 수 있으며, 분리한 Region의 절제면, 절제면에서의 Vessel 및 territory의 volume 등을 측정할 수 있습니다.</li>
                                     <li>- 3D로 재구성 된 복합적인 장기들을 Laparascopic view로 관찰할 수 있습니다.</li>
                                 </ul>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
             <div></div>
         </div>-->


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