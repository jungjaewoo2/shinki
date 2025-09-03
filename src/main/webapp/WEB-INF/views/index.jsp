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


<div class="">
    <!-- Home Page -->
    <section id="home" class="page-section active">
        <div class="dynamic-backdrop">
            <div class="gradient-glow"></div>
            <div class="moving-blob-1"></div>
            <div class="moving-blob-2"></div>
        </div>

        <div class="container">
            <!-- Swiper (배경으로 사용) -->
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <video autoplay muted loop playsinline>
                            <source src="/assets/images/main-video.mp4" type="video/mp4">
                        </video>
                        <div class="main-title text-center" style="margin: 0 auto;">
                            <h1>Synapse 3D</h1>
                            <p class="subtitle m-5">
                                Synapse 3D는 최신 3D 영상 재구성 기술을 통해 CT, MRI 등에서 얻은 의료 영상을<br>
                                정밀하게 시각화하고 분석할 수 있는 강력한 도구입니다.
                            </p>
                            <div class="button-group">
                                <button class="btn-secondary" onclick="location.href='application.html'" style="padding: 0.5rem 1.25rem;">
                                    Learn more
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <video autoplay muted loop playsinline>
                            <source src="/assets/images/main-video2.mp4" type="video/mp4">
                        </video>
                        <div class="main-title text-center" style="margin: 0 auto;">
                            <h1>Beyond<br>Visual<br>Beyond<br>Limits.</h1>
                            <p class="subtitle m-5">
                                Accurate, high-resolution 3D visualization for better diagnostics.<br>
                                더나은 진단을 위한 정확성과 고해상도의 3D 시각화.
                            </p>
                            <div class="button-group">
                                <button class="btn-secondary" onclick="location.href='application.html'" style="padding: 0.5rem 1.25rem;">
                                    Learn more
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <video autoplay muted loop playsinline>
                            <source src="/assets/images/main-video3.mp4" type="video/mp4">
                        </video>
                        <div class="main-title text-center" style="margin: 0 auto;">
                            <h1>Visualize<br>the Invisible.</h1>
                            <p class="subtitle m-5">
                                정확성의 새로운 기준, Synapse 3D로 의료진단의 혁신을 경험하세요.
                            </p>
                            <div class="button-group">
                                <button class="btn-secondary" onclick="location.href='application.html'" style="padding: 0.5rem 1.25rem;">
                                    Learn more
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="swiper-pagination"></div>
            <!--<div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>-->
            <!--<div class="mask"></div>-->


            <!--<div class="feature-grid">
                <div class="feature-card">
                    <div class="feature-icon">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M12 2L2 7v10c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V7l-10-5z" />
                        </svg>
                    </div>
                    <h4>Accurate Volumetry</h4>
                    <p>분리된 영역의 부피/길이/면적을 자동 계산하고 리포트합니다.</p>
                </div>

                <div class="feature-card">
                    <div class="feature-icon">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z" />
                        </svg>
                    </div>
                    <h4>AI Segmentation</h4>
                    <p>간/폐/심장/관절 등 주요 장기/구조를 고정밀 분할.</p>
                </div>

                <div class="feature-card">
                    <div class="feature-icon">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M20 16.58A5 5 0 0 0 18 7h-1.26A8 8 0 1 0 4 15.25" />
                            <polyline points="8 16 12 12 16 16" />
                        </svg>
                    </div>
                    <h4>Multi‑format I/O</h4>
                    <p>DICOM, 3D PDF, STL 등 다양한 포맷을 지원합니다.</p>
                </div>
            </div>-->
        </div>
    </section>
    <section id="application" class="page-section">
        <div class="dynamic-backdrop">
            <div class="gradient-glow"></div>
        </div>

        <div class="container">
            <h2 class="align-items-center d-flex flex-column justify-content-center gap-2 mb-4" style="font-size: 2rem; margin-top: 0.75rem;"><span class="pill">Application</span> 애플리케이션</h2>
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
                                                    <img src="/assets/images/tab1-cont-img01.png" width="">
                                                </div>
                                                <div class="swiper-slide">
                                                    <img src="/assets/images/tab1-cont-img01.png" width="">
                                                </div>
                                                <div class="swiper-slide">
                                                    <img src="/assets/images/tab1-cont-img01.png" width="">
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
                            <button class="carousel-prev fs-1" onclick="prevSlide()"><img class="w-75" src="/assets/images/arrow-right.png"></button>
                            <button class="carousel-next fs-1" onclick="nextSlide()"><img class="w-75" src="/assets/images/arrow-left.png"></button>
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
    <section id="business" class="page-section transition-transform-bg">
        <div class="container">
            <h2 class="align-items-center d-flex flex-column justify-content-center gap-2 mb-4" style="font-size: 2rem; margin-top: 0.75rem;"><span class="pill">Feature introduction</span> 기능 소개</h2>
            <div class="align-items-center d-flex gap-1 justify-content-end mb-3">
                <img src="/assets/images/feature-icon.png">
                <span>REiLI의 독보적인 AI기술력과 함께합니다.</span>
            </div>
            <div class="d-flex flex-wrap justify-content-between">
                <div class="business-box border rounded-4 d-flex align-items-center gap-3 p-4">
                    <div><img src="/assets/images/business-icon01.png" width="88"></div>
                    <div>
                        <div class="feature-title">One click Extraction</div>
                        <div>Fujifilm의 Unique한 AI support를 통한 높은 정확도의 Auto Extraction</div>
                    </div>
                </div>
                <div class="business-box border rounded-4 d-flex align-items-center gap-3 p-4">
                    <div><img src="/assets/images/business-icon02.png" width="88"></div>
                    <div>
                        <div class="feature-title">Accurate Volumetry</div>
                        <div>분리한 Region의 Volume을 자동으로 측정</div>
                    </div>
                </div>
                <div class="business-box border rounded-4 d-flex align-items-center gap-3 p-4">
                    <div><img src="/assets/images/business-icon03.png" width="88"></div>
                    <div>
                        <div class="feature-title">Segmentation of territory</div>
                        <div>One click으로 territory area를 자동 분리 추출</div>
                    </div>
                </div>
                <div class="business-box border rounded-4 d-flex align-items-center gap-3 p-4">
                    <div><img src="/assets/images/business-icon04.png" width="88"></div>
                    <div>
                        <div class="feature-title">Pre-operative Simulation</div>
                        <div>수술 전 Region division을 통한 수술 계획 설정</div>
                    </div>
                </div>
                <div class="business-box border rounded-4 d-flex align-items-center gap-3 p-4">
                    <div><img src="/assets/images/business-icon05.png" width="88"></div>
                    <div>
                        <div class="feature-title">3D Reconstruction</div>
                        <div>정확한 해부학적 구조의 시각화를 통해 직관적인 관찰</div>
                    </div>
                </div>
                <div class="business-box border rounded-4 d-flex align-items-center gap-3 p-4">
                    <div><img src="/assets/images/business-icon06.png" width="88"></div>
                    <div>
                        <div class="feature-title">Various Visualization Tool</div>
                        <div>다양한 시각화 도구를 통한 영상 분석 및 시각화</div>
                    </div>
                </div>
                <div class="business-box border rounded-4 d-flex align-items-center gap-3 p-4">
                    <div><img src="/assets/images/business-icon07.png" width="88"></div>
                    <div>
                        <div class="feature-title">Fast Data Processing</div>
                        <div>대용량 의료 Data를 고속으로 처리</div>
                    </div>
                </div>
                <div class="business-box border rounded-4 d-flex align-items-center gap-3 p-4">
                    <div><img src="/assets/images/business-icon08.png" width="88"></div>
                    <div>
                        <div class="feature-title">Intuitive Interface</div>
                        <div>직관적인 Interface를 통한 효과적인 사용</div>
                    </div>
                </div>
                <div class="business-box border rounded-4 d-flex align-items-center gap-3 p-4">
                    <div><img src="/assets/images/business-icon09.png" width="88"></div>
                    <div>
                        <div class="feature-title">Support for Various Data Formats</div>
                        <div>DCM format 외 3D PDF, Offline VR,STL file 등 다양한 File Format 지원</div>
                    </div>
                </div>
            </div>
            <div class="text-center m-5"><button class="btn btn-info text-white" onclick="location.href='#'">View all application</button></div>
        </div>
    </section>
    <section id="type" class="page-section transition-transform-bg">
        <div class="container">
            <h2 class="align-items-center d-flex flex-column justify-content-center gap-2 mb-4" style="font-size: 2rem; margin-top: 0.75rem;"><span class="pill">Type introduction</span> 타입 소개</h2>
            <div class="d-flex flex-column flex-lg-row justify-content-between gap-3 gap-lg-0">
                <div class="type-box border p-4 p-lg-5">
                    <div class="type-title">Server/Client Type</div>
                    <div class="type-sub">Server H/W 및 S/W 안전성이 우수하고 <span>다수 Client (CCU 최대 10대)에서 Synapse 구동이 가능.</span></div>
                    <div class="type-img"><img src="/assets/images/type1-img01.png"></div>
                    <div class="text-center"><button class="btn btn-secondary" onclick="location.href='#'">Learn more</button></div>
                </div>
                <div class="type-box border p-4 p-lg-5">
                    <div class="type-title">Stand-only Type</div>
                    <div class="type-sub"><span>단일 PC</span>에서 네트워크 환경에 설치된 장비(CT, MR, PACS 등) 연동 통해 촬영 데이터 (Dicom file)를 송/수신하고 3D 영상 가공 작업이 진행됨.</div>
                    <div class="type-img"><img src="/assets/images/type1-img02.png"></div>
                    <div class="text-center"><button class="btn btn-secondary" onclick="location.href='#'">Learn more</button></div>
                </div>
            </div>
            <div class="text-center m-5"><button class="btn btn-info text-white" onclick="location.href='#'">의뢰하기</button></div>
        </div>
    </section>
    <section id="use-cases" class="page-section transition-transform-bg">
        <div class="container d-flex flex-column position-relative">
            <h2 class="align-items-center d-flex flex-column justify-content-center gap-2 mb-4" style="font-size: 2rem; margin-top: 0.75rem;"><span class="pill">Use-cases</span> 활용 사례</h2>

            <div class="swiper mySwiper2 p-3">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="use-box border p-4 p-lg-4 shadow-sm">
                            <div class="use-title">참고 논문1</div>
                            <div class="use-sub"><span>단일 PC</span>에서 네트워크 환경에 설치된 장비(CT, MR, PACS 등) 연동 통해 촬영 데이터 (Dicom file)를 송/수신하고 3D 영상 가공 작업이 진행됨.</div>
                            <div class="use-link align-items-center d-flex gap-2 justify-content-end"><i class="bi bi-arrow-up-right-circle-fill fs-1 d-flex"></i></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="use-box border p-4 p-lg-4 shadow-sm">
                            <div class="use-title">참고 논문2</div>
                            <div class="use-sub"><span>단일 PC</span>에서 네트워크 환경에 설치된 장비(CT, MR, PACS 등) 연동 통해 촬영 데이터 (Dicom file)를 송/수신하고 3D 영상 가공 작업이 진행됨.</div>
                            <div class="use-link align-items-center d-flex gap-2 justify-content-end"><i class="bi bi-arrow-up-right-circle-fill fs-1 d-flex"></i></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="use-box border p-4 p-lg-4 shadow-sm">
                            <div class="use-title">참고 논문3</div>
                            <div class="use-sub"><span>단일 PC</span>에서 네트워크 환경에 설치된 장비(CT, MR, PACS 등) 연동 통해 촬영 데이터 (Dicom file)를 송/수신하고 3D 영상 가공 작업이 진행됨.</div>
                            <div class="use-link align-items-center d-flex gap-2 justify-content-end"><i class="bi bi-arrow-up-right-circle-fill fs-1 d-flex"></i></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="use-box border p-4 p-lg-4 shadow-sm">
                            <div class="use-title">참고 논문4</div>
                            <div class="use-sub"><span>단일 PC</span>에서 네트워크 환경에 설치된 장비(CT, MR, PACS 등) 연동 통해 촬영 데이터 (Dicom file)를 송/수신하고 3D 영상 가공 작업이 진행됨.</div>
                            <div class="use-link align-items-center d-flex gap-2 justify-content-end"><i class="bi bi-arrow-up-right-circle-fill fs-1 d-flex"></i></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="use-box border p-4 p-lg-4 shadow-sm">
                            <div class="use-title">참고 논문5</div>
                            <div class="use-sub"><span>단일 PC</span>에서 네트워크 환경에 설치된 장비(CT, MR, PACS 등) 연동 통해 촬영 데이터 (Dicom file)를 송/수신하고 3D 영상 가공 작업이 진행됨.</div>
                            <div class="use-link align-items-center d-flex gap-2 justify-content-end"><i class="bi bi-arrow-up-right-circle-fill fs-1 d-flex"></i></div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="bottom-0 position-absolute" style="right: 16px">
                <div class="swiper-button-next2"></div>
                <div class="swiper-button-prev2"></div>
            </div>
        </div>
    </section>
</div>


<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<!-- Initialize Swiper -->
<script>
    var swiper = new Swiper(".mySwiper", {
        effect: "fade",
        fadeEffect: {
            crossFade: true
        },
        spaceBetween: 0,
        /*autoplay: {
            delay: 4000,
            disableOnInteraction: false,
        },*/
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        speed: 500,
        loop: true,
    });

</script>

<script>
    var swiper2 = new Swiper(".mySwiper2", {
        slidesPerView: 1,
        /* Default to 1 slide per view on mobile */
        spaceBetween: 10,
        navigation: {
            nextEl: ".swiper-button-next2",
            prevEl: ".swiper-button-prev2",
        },
        breakpoints: {
            768: {
                slidesPerView: 3,
                /* Show 3 slides on screens >= 768px */
                spaceBetween: 25.4,
            },
        },
        loop: true,
    });

</script>

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

<!-- Application JS -->
<script>
    let currentSlide = 0;
    const slides = document.querySelectorAll('#home-tab-pane .carousel-item');
    const dots = document.querySelectorAll('#home-tab-pane .carousel-dot');
    const totalSlides = slides.length;

    function showSlide(index) {
        slides.forEach((slide, i) => {
            slide.classList.remove('active');
            dots[i].classList.remove('active');
            if (i === index) {
                slide.classList.add('active');
                dots[i].classList.add('active');
            }
        });
    }

    function nextSlide() {
        currentSlide = (currentSlide + 1) % totalSlides;
        showSlide(currentSlide);
    }

    function setCarouselSlide(index) {
        currentSlide = index;
        showSlide(currentSlide);
    }

    // Auto-slide every 3 seconds
    //setInterval(nextSlide, 3000);

    // Initial display
    showSlide(currentSlide);

</script>

<script>
    window.addEventListener('scroll', () => {
        const section = document.querySelector('.section');
        const scrollPosition = window.scrollY;
        if (scrollPosition > 500) { // 특정 스크롤 위치에서
            section.style.backgroundColor = '#007bff';
        } else {
            section.style.backgroundColor = '#ffffff';
        }
    });

</script>

<!-- business JS -->
<script>
    document.addEventListener('DOMContentLoaded', () => {
        // 초기 body 배경색 설정
        document.body.style.backgroundColor = '#070b1a';

        // 대상 섹션 선택
        const businessSection = document.querySelector('#business');
        const useCasesSection = document.querySelector('#use-cases');

        // 색상 변경 함수
        const updateBackground = () => {
            if (!businessSection || !useCasesSection) return;

            const businessRect = businessSection.getBoundingClientRect();
            const useCasesRect = useCasesSection.getBoundingClientRect();

            // #business의 상단이 뷰포트 상단(0)에 도달하거나 위로 올라갔고, #use-cases의 하단이 뷰포트에 아직 보일 때
            if (businessRect.top <= 0 && useCasesRect.bottom > 0) {
                document.body.style.backgroundColor = '#fff';
                document.body.style.color = '#333';
            } else {
                document.body.style.backgroundColor = '#070b1a';
                document.body.style.color = ''; // 기본 텍스트 색상으로 복원
            }
        };

        // 스크롤 이벤트 리스너 추가
        window.addEventListener('scroll', updateBackground);

        // 초기 상태 확인 (페이지 로드 시)
        updateBackground();
    });

</script>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        // 초기 body 배경색 설정 및 트랜지션 추가
        document.body.style.backgroundColor = '#070b1a';
        document.body.style.transition = 'background-color 0.5s ease, color 0.5s ease';

        // 대상 섹션 및 버튼 선택
        const businessSection = document.querySelector('#business');
        const useCasesSection = document.querySelector('#use-cases');
        const prevButton = document.querySelector('.swiper-button-prev2');
        const nextButton = document.querySelector('.swiper-button-next2');

        // 색상 변경 함수
        const updateBackground = () => {
            if (!businessSection || !useCasesSection || !prevButton || !nextButton) return;

            const businessRect = businessSection.getBoundingClientRect();
            const useCasesRect = useCasesSection.getBoundingClientRect();

            // #business의 상단이 뷰포트 상단(0)에 도달하거나 위로 올라갔고, #use-cases의 하단이 뷰포트에 아직 보일 때
            if (businessRect.top <= 0 && useCasesRect.bottom > 0) {
                document.body.style.backgroundColor = '#fff';
                document.body.style.color = '#333';
                prevButton.style.color = '#333'; // Swiper prev 버튼 색상 변경
                nextButton.style.color = '#333'; // Swiper next 버튼 색상 변경
            } else {
                document.body.style.backgroundColor = '#070b1a';
                document.body.style.color = ''; // 기본 텍스트 색상으로 복원
                prevButton.style.color = ''; // 기본 버튼 색상으로 복원
                nextButton.style.color = ''; // 기본 버튼 색상으로 복원
            }
        };

        // 스크롤 이벤트 리스너 추가
        window.addEventListener('scroll', updateBackground);

        // 초기 상태 확인 (페이지 로드 시)
        updateBackground();
    });

</script>


<!-- 메인 스와이퍼&텍스트 JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
    // 애니메이션 적용 함수
    function applyAnimationToActiveSlide(swiperInstance) {
        console.log('Applying animation, realIndex:', swiperInstance.realIndex); // 디버깅: 호출 확인
        // 모든 main-title에서 animate 클래스 제거
        document.querySelectorAll('.swiper-slide .main-title').forEach(title => {
            title.classList.remove('animate');
            console.log('Removed animate class from:', title); // 디버깅: 클래스 제거
        });

        // 활성 슬라이드의 main-title 찾기
        const activeSlide = document.querySelector(`.swiper-slide[data-swiper-slide-index="${swiperInstance.realIndex}"] .main-title`);
        if (activeSlide) {
            activeSlide.classList.add('animate');
            console.log('Added animate class to:', activeSlide); // 디버깅: 클래스 추가
        } else {
            console.log('No main-title found for realIndex:', swiperInstance.realIndex); // 디버깅: 요소 없음
        }
    }

    // Swiper 초기화
    try {
        const swiper = new Swiper('.mySwiper', {
            loop: true,
            autoplay: {
                delay: 5000,
                disableOnInteraction: false,
            },
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
            effect: 'fade',
            fadeEffect: {
                crossFade: true,
            },
            on: {
                init: function() {
                    console.log('Swiper initialized, slides:', this.slides.length); // 디버깅: 초기화 완료
                    setTimeout(() => applyAnimationToActiveSlide(this), 100); // 초기화 후 지연
                },
                slideChangeTransitionEnd: function() {
                    console.log('Slide transition ended, realIndex:', this.realIndex); // 디버깅: 전환 완료
                    applyAnimationToActiveSlide(this);
                },
                paginationUpdate: function() {
                    console.log('Pagination updated, realIndex:', this.realIndex); // 디버깅: 페이지네이션 업데이트
                    applyAnimationToActiveSlide(this);
                },
            },
        });

        // 페이지네이션 클릭 이벤트
        document.addEventListener('click', function(event) {
            if (event.target.classList.contains('swiper-pagination-bullet')) {
                console.log('Pagination bullet clicked, bullet index:', event.target.getAttribute('aria-label')); // 디버깅: 클릭
                setTimeout(() => applyAnimationToActiveSlide(swiper), 200); // 클릭 후 지연
            }
        });

        // 페이지 로드 시 초기 애니메이션
        document.addEventListener('DOMContentLoaded', function() {
            console.log('DOM fully loaded'); // 디버깅: DOM 로드
            if (swiper && swiper.initialized) {
                console.log('Swiper already initialized, applying animation');
                applyAnimationToActiveSlide(swiper);
            } else {
                console.log('Swiper not yet initialized, waiting...');
                setTimeout(() => applyAnimationToActiveSlide(swiper), 300); // Swiper 대기
            }
        });
    } catch (error) {
        console.error('Swiper initialization failed:', error); // 디버깅: 초기화 에러
    }

</script>




<jsp:include page="footer.jsp" />