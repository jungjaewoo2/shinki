<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta property="og:image" content="/assets/images/logo_B.png">
    <title>SHINKISA - Medical-grade 3D Visualization</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="/assets/css/style.css">

    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<!-- 메인 스와이퍼&텍스트 CSS -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

</head>

<body>
    <div class="container-fluid p-0">
        <!-- Navigation -->
        <nav class="top-nav navbar navbar-expand-lg">
            <div class="nav-container container-fluid">
                <div class="logo" onclick="location.href='index.jsp'">
                    <img src="/assets/images/logo_W.png">
                    <!--<span class="fs-4">SYNAPSE 3D</span>-->
                </div>

                <div class="nav-menu">
                    <button class="nav-link" onclick="location.href='index.jsp'">HOME</button>
                    <button class="nav-link navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation" onclick="location.href='application.jsp'"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <button class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                    Application
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="application.html">HBP</a></li>
                                    <li><a class="dropdown-item" href="#">LUNG</a></li>
                                    <li><a class="dropdown-item" href="#">CARDIAC</a></li>
                                    <li><a class="dropdown-item" href="#">KNEE</a></li>
                                    <li><a class="dropdown-item" href="#">All Application</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <button class="nav-link" onclick="location.href='mypage/request.jsp'">Request</button>
                    <button class="nav-link navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation" onclick="location.href='application.jsp'"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <button class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                    Contact
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">문의하기</a></li>
                                    <li><a class="dropdown-item" href="#">문의내역조회</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>

                </div>

                <div class="d-none d-lg-block">
                    <div class="d-flex align-items-center gap-3">
                        <!--<div class=""><a href="#" class="pe-auto">LOGOUT</a></div>-->
                        <!--<div class=""><a href="#" class="pe-auto">MYPAGE</a></div>-->
                        <!--<div class=""><a href="#" class="pe-auto text-decoration-underline">신기사님</a></div>-->
                    </div>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            신기사님
                        </button>
                        <ul class="dropdown-menu">
                            <li>
                                <a class="dropdown-item d-flex align-items-center gap-2" href="#">

                                    <div><i class="bi bi-person-circle fs-5"></i></div>
                                    <div>마이페이지</div>
                                </a>
                            </li>
                            <li>
                                <a class="d-flex dropdown-item align-items-center gap-2" href="#">

                                    <div><i class="bi bi-box-arrow-right fs-5"></i></div>
                                    <div>로그아웃</div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
                    <i class="bi bi-list fs-2 text-white"></i>
                </button>

            </div>
        </nav>
        <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
            <div class="offcanvas-header bg-black">
                <h5 class="offcanvas-title" id="offcanvasExampleLabel"><img src="/assets/images/logo_w.png"></h5>
                <button type="button" class="btn-close bg-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div class="">
                    <button class="nav-link" onclick="location.href='index.jsp'">HOME</button>
                    <div class="collapse navbar-collapse show" id="navbarNavDarkDropdown">
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <button class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                    Application
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="application.jsp">HBP</a></li>
                                    <li><a class="dropdown-item" href="#">LUNG</a></li>
                                    <li><a class="dropdown-item" href="#">CARDIAC</a></li>
                                    <li><a class="dropdown-item" href="#">KNEE</a></li>
                                    <li><a class="dropdown-item" href="#">All Application</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <button class="nav-link" onclick="location.href='mypage/request.jsp'">Request</button>
                    <div class="collapse navbar-collapse show" id="navbarNavDarkDropdown">
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <button class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                    Contact
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">문의하기</a></li>
                                    <li><a class="dropdown-item" href="#">문의내역조회</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>

                </div>
                <div class="d-flex flex-column gap-3 position-absolute top-50" style="padding: 0.5rem 0.75rem;">
                    <div class=""><a href="#" class="pe-auto">LOGOUT</a></div>
                    <div class=""><a href="#" class="pe-auto">MYPAGE</a></div>
                </div>
            </div>
        </div>
