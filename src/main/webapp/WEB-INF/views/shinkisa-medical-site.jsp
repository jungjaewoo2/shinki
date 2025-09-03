<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHINKISA - Medical-grade 3D Visualization</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background: #070b1a;
            color: white;
            min-height: 100vh;
            overflow-x: hidden;
        }

        /* Navigation */
        .top-nav {
            position: sticky;
            top: 0;
            z-index: 50;
            background: rgba(7, 11, 26, 0.6);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .nav-container {
            max-width: 1280px;
            margin: 0 auto;
            padding: 0 1rem;
            height: 56px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            cursor: pointer;
            text-decoration: none;
            color: white;
        }

        .brand-icon {
            width: 28px;
            height: 28px;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 8px;
            display: grid;
            place-items: center;
        }

        .nav-menu {
            display: flex;
            gap: 0.5rem;
        }

        .nav-link {
            padding: 0.5rem 0.75rem;
            background: none;
            border: none;
            color: rgba(255, 255, 255, 0.7);
            cursor: pointer;
            transition: color 0.2s;
            font-size: 0.875rem;
        }

        .nav-link:hover, .nav-link.active {
            color: white;
        }

        .btn-primary {
            background: white;
            color: #070b1a;
            border: none;
            padding: 0.375rem 0.75rem;
            border-radius: 0.75rem;
            font-size: 0.875rem;
            cursor: pointer;
            transition: transform 0.2s;
        }

        .btn-primary:hover {
            transform: translateY(-1px);
        }

        /* Page sections */
        .page-section {
            display: none;
            position: relative;
            min-height: calc(100vh - 56px);
        }

        .page-section.active {
            display: block;
        }

        /* Dynamic Background */
        .dynamic-backdrop {
            position: absolute;
            inset: 0;
            z-index: -10;
            overflow: hidden;
        }

        .gradient-glow {
            position: absolute;
            inset: 0;
            background: radial-gradient(80% 60% at 50% 0%, rgba(75, 130, 255, 0.25), transparent 60%);
        }

        .moving-blob-1, .moving-blob-2 {
            position: absolute;
            border-radius: 50%;
            filter: blur(48px);
            animation: float 20s infinite ease-in-out;
        }

        .moving-blob-1 {
            top: -96px;
            left: -96px;
            width: 320px;
            height: 320px;
            background: conic-gradient(from 90deg, rgba(80, 160, 255, 0.25), transparent);
        }

        .moving-blob-2 {
            bottom: -96px;
            right: -96px;
            width: 448px;
            height: 448px;
            background: radial-gradient(circle, rgba(150, 200, 255, 0.18), transparent);
            animation-duration: 25s;
            animation-delay: -5s;
        }

        @keyframes float {
            0%, 100% { transform: translate(0, 0) rotate(0deg); }
            25% { transform: translate(40px, -20px) rotate(30deg); }
            50% { transform: translate(-20px, 30px) rotate(-15deg); }
            75% { transform: translate(30px, 10px) rotate(20deg); }
        }

        /* Canvas backgrounds */
        .canvas-container {
            position: absolute;
            inset: 0;
            z-index: -5;
        }

        canvas {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

        /* Content */
        .container {
            max-width: 1280px;
            margin: 0 auto;
            padding: 4rem 1rem;
        }

        .text-center {
            text-align: center;
        }

        .pill {
            display: inline-flex;
            align-items: center;
            padding: 0.25rem 0.75rem;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 9999px;
            font-size: 0.75rem;
            color: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(4px);
        }

        h1 {
            font-size: clamp(2rem, 5vw, 3.75rem);
            font-weight: 600;
            line-height: 1.2;
            margin-top: 1rem;
            letter-spacing: -0.02em;
        }

        .subtitle {
            color: rgba(255, 255, 255, 0.75);
            margin-top: 1rem;
            line-height: 1.6;
            max-width: 42rem;
            margin-left: auto;
            margin-right: auto;
        }

        .button-group {
            display: flex;
            flex-wrap: wrap;
            gap: 0.75rem;
            justify-content: center;
            margin-top: 2rem;
        }

        .btn-secondary {
            background: rgba(255, 255, 255, 0.1);
            color: white;
            border: 1px solid rgba(255, 255, 255, 0.2);
            padding: 0.5rem 1.25rem;
            border-radius: 0.75rem;
            cursor: pointer;
            transition: background 0.2s;
            font-size: 0.875rem;
        }

        .btn-secondary:hover {
            background: rgba(255, 255, 255, 0.15);
        }

        /* Feature Cards */
        .feature-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1rem;
            margin-top: 4rem;
        }

        .feature-card {
            background: linear-gradient(to bottom, rgba(255, 255, 255, 0.05), rgba(255, 255, 255, 0.03));
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 1rem;
            padding: 1.5rem;
            position: relative;
            overflow: hidden;
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 0.5s forwards;
        }

        .feature-card:nth-child(2) { animation-delay: 0.1s; }
        .feature-card:nth-child(3) { animation-delay: 0.2s; }

        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .feature-icon {
            width: 40px;
            height: 40px;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 0.75rem;
            display: grid;
            place-items: center;
            margin-bottom: 1rem;
        }

        .feature-card h4 {
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .feature-card p {
            font-size: 0.875rem;
            color: rgba(255, 255, 255, 0.7);
            line-height: 1.5;
        }

        /* Application Carousel */
        .carousel {
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 1.5rem;
            overflow: hidden;
            margin-top: 2rem;
        }

        .carousel-content {
            aspect-ratio: 16/7;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }

        .carousel-item {
            display: none;
            animation: slideIn 0.6s ease;
        }

        .carousel-item.active {
            display: block;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .carousel-dots {
            display: flex;
            gap: 0.5rem;
            justify-content: center;
            padding: 1rem;
        }

        .carousel-dot {
            width: 24px;
            height: 6px;
            background: rgba(255, 255, 255, 0.3);
            border: none;
            border-radius: 3px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .carousel-dot.active {
            background: white;
        }

        /* Forms */
        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.04);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 1rem;
            padding: 1.5rem;
        }

        .form-input, .form-textarea {
            width: 100%;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 0.75rem;
            padding: 0.75rem 1rem;
            color: white;
            font-size: 0.875rem;
            margin-bottom: 1rem;
            transition: border-color 0.2s;
        }

        .form-input:focus, .form-textarea:focus {
            outline: none;
            border-color: rgba(255, 255, 255, 0.3);
        }

        .form-textarea {
            resize: vertical;
            min-height: 120px;
        }

        /* Floating Button */
        .floating-btn {
            position: fixed;
            bottom: 24px;
            right: 24px;
            z-index: 40;
            background: white;
            color: #070b1a;
            padding: 0.75rem 1rem;
            border-radius: 9999px;
            border: none;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: transform 0.2s;
        }

        .floating-btn:hover {
            transform: translateY(-2px);
        }

        /* Footer */
        footer {
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            padding: 2.5rem 1rem;
            text-align: center;
            color: rgba(255, 255, 255, 0.6);
            font-size: 0.875rem;
        }

        .footer-content {
            max-width: 1280px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 1rem;
        }

        .footer-links {
            display: flex;
            gap: 1rem;
        }

        .footer-links a {
            color: rgba(255, 255, 255, 0.6);
            text-decoration: none;
            transition: color 0.2s;
        }

        .footer-links a:hover {
            color: white;
        }

        @media (min-width: 768px) {
            .footer-content {
                flex-direction: row;
                justify-content: space-between;
            }
        }

        @media (max-width: 768px) {
            .nav-menu {
                display: none;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="top-nav">
        <div class="nav-container">
            <button class="brand" onclick="navigateTo('home')">
                <div class="brand-icon">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <rect x="4" y="4" width="16" height="16" rx="2"/>
                        <path d="M9 9h6v6h-6z"/>
                    </svg>
                </div>
                <span style="font-weight: 600;">SHINKISA</span>
            </button>
            
            <div class="nav-menu">
                <button class="nav-link" onclick="navigateTo('home')">HOME</button>
                <button class="nav-link" onclick="navigateTo('application')">Application</button>
                <button class="nav-link" onclick="navigateTo('request')">Request</button>
                <button class="nav-link" onclick="navigateTo('contact')">Contact</button>
                <button class="nav-link" onclick="navigateTo('login')">로그인</button>
            </div>
            
            <button class="btn-primary" onclick="navigateTo('request')">문의하기</button>
        </div>
    </nav>

    <!-- Home Page -->
    <section id="home" class="page-section active">
        <div class="dynamic-backdrop">
            <div class="gradient-glow"></div>
            <div class="moving-blob-1"></div>
            <div class="moving-blob-2"></div>
        </div>
        
        <div class="canvas-container">
            <canvas id="neuroCanvas"></canvas>
            <canvas id="gridCanvas"></canvas>
        </div>
        
        <div class="container">
            <div class="text-center" style="max-width: 48rem; margin: 0 auto;">
                <span class="pill">Beyond Visual. Beyond Limits.</span>
                <h1>Medical‑grade 3D Visualization & Quantification</h1>
                <p class="subtitle">
                    SHINKISA는 CT/MRI 등 의료 영상을 정밀하게 재구성하고 정량화하여 임상 의사결정을 지원합니다.
                </p>
                <div class="button-group">
                    <button class="btn-primary" onclick="navigateTo('application')" style="padding: 0.5rem 1.25rem;">
                        Explore Application →
                    </button>
                    <button class="btn-secondary" onclick="navigateTo('request')">Request</button>
                </div>
            </div>
            
            <div class="feature-grid">
                <div class="feature-card">
                    <div class="feature-icon">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M12 2L2 7v10c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V7l-10-5z"/>
                        </svg>
                    </div>
                    <h4>Accurate Volumetry</h4>
                    <p>분리된 영역의 부피/길이/면적을 자동 계산하고 리포트합니다.</p>
                </div>
                
                <div class="feature-card">
                    <div class="feature-icon">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
                        </svg>
                    </div>
                    <h4>AI Segmentation</h4>
                    <p>간/폐/심장/관절 등 주요 장기/구조를 고정밀 분할.</p>
                </div>
                
                <div class="feature-card">
                    <div class="feature-icon">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M20 16.58A5 5 0 0 0 18 7h-1.26A8 8 0 1 0 4 15.25"/>
                            <polyline points="8 16 12 12 16 16"/>
                        </svg>
                    </div>
                    <h4>Multi‑format I/O</h4>
                    <p>DICOM, 3D PDF, STL 등 다양한 포맷을 지원합니다.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Application Page -->
    <section id="application" class="page-section">
        <div class="dynamic-backdrop">
            <div class="gradient-glow"></div>
        </div>
        
        <div class="container">
            <span class="pill">Application</span>
            <h2 style="font-size: 2rem; margin-top: 0.75rem;">임상 워크플로우를 위한 전용 애플리케이션</h2>
            
            <div class="carousel">
                <div class="carousel-content">
                    <div class="carousel-item active text-center">
                        <span class="pill">HBP-Liver</span>
                        <h3 style="font-size: 3rem; margin: 1rem 0;">LIVER</h3>
                        <p style="color: rgba(255,255,255,0.75);">혈관 선택 기반 구역 자동분할 및 Volumetry.</p>
                    </div>
                    <div class="carousel-item text-center">
                        <span class="pill">HBP-Pancreas</span>
                        <h3 style="font-size: 3rem; margin: 1rem 0;">PANCREAS</h3>
                        <p style="color: rgba(255,255,255,0.75);">정밀 분할 및 수술 계획 시뮬레이션.</p>
                    </div>
                    <div class="carousel-item text-center">
                        <span class="pill">LUNG</span>
                        <h3 style="font-size: 3rem; margin: 1rem 0;">LUNG</h3>
                        <p style="color: rgba(255,255,255,0.75);">PA/PV/기관지/폐엽 자동 추출.</p>
                    </div>
                    <div class="carousel-item text-center">
                        <span class="pill">CARDIAC</span>
                        <h3 style="font-size: 3rem; margin: 1rem 0;">CARDIAC</h3>
                        <p style="color: rgba(255,255,255,0.75);">챔버 분할 및 정량 분석.</p>
                    </div>
                    <div class="carousel-item text-center">
                        <span class="pill">KNEE</span>
                        <h3 style="font-size: 3rem; margin: 1rem 0;">KNEE</h3>
                        <p style="color: rgba(255,255,255,0.75);">관절 구조 3D 재구성 및 병변 정량화.</p>
                    </div>
                </div>
                <div class="carousel-dots">
                    <button class="carousel-dot active" onclick="setCarouselSlide(0)"></button>
                    <button class="carousel-dot" onclick="setCarouselSlide(1)"></button>
                    <button class="carousel-dot" onclick="setCarouselSlide(2)"></button>
                    <button class="carousel-dot" onclick="setCarouselSlide(3)"></button>
                    <button class="carousel-dot" onclick="setCarouselSlide(4)"></button>
                </div>
            </div>
        </div>
    </section>

    <!-- Request Page -->
    <section id="request" class="page-section">
        <div class="dynamic-backdrop">
            <div class="gradient-glow"></div>
        </div>
        
        <div class="container">
            <span class="pill">Request</span>
            <h2 style="font-size: 2rem; margin-top: 0.75rem;">도입 상담 및 견적 요청</h2>
            
            <div class="form-grid">
                <div style="color: rgba(255,255,255,0.75); font-size: 0.875rem;">
                    <p style="margin-bottom: 1rem;">프로덕트 데모, 도입 환경(온프레미스/클라우드), HW 스펙, 라이선스 구성 등 원하는 정보를 알려주시면 맞춤 견적을 드립니다.</p>
                    <ul style="list-style: none; padding: 0;">
                        <li style="display: flex; align-items: center; gap: 0.5rem; margin-bottom: 0.5rem;">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M12 2L2 7v10c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V7l-10-5z"/>
                            </svg>
                            의료 데이터 보안 및 컴플라이언스 고려
                        </li>
                        <li style="display: flex; align-items: center; gap: 0.5rem;">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <rect x="3" y="3" width="18" height="18" rx="2" ry="2"/>
                                <line x1="9" y1="9" x2="15" y2="9"/>
                                <line x1="9" y1="15" x2="15" y2="15"/>
                            </svg>
                            PACS/EMR 연동 컨설팅 지원
                        </li>
                    </ul>
                </div>
                
                <form class="form-container">
                    <input type="text" class="form-input" placeholder="성함">
                    <input type="email" class="form-input" placeholder="이메일">
                    <input type="text" class="form-input" placeholder="기관명(병원/기업)">
                    <textarea class="form-textarea" placeholder="요청 사항(환경, 수량, 납기 등)"></textarea>
                    <button class="btn-primary" style="width: 100%;">제출하기</button>
                </form>
            </div>
        </div>
    </section>

    <!-- Contact Page -->
    <section id="contact" class="page-section">
        <div class="dynamic-backdrop">
            <div class="gradient-glow"></div>
        </div>
        
        <div class="container">
            <span class="pill">Contact</span>
            <h2 style="font-size: 2rem; margin-top: 0.75rem;">연락처 및 위치</h2>
            
            <div class="form-grid">
                <div class="form-container">
                    <h4 style="margin-bottom: 0.75rem;">문의 채널</h4>
                    <p style="color: rgba(255,255,255,0.75); font-size: 0.875rem;">
                        E: contact@shinkisa.com<br>
                        T: +82-2-0000-0000
                    </p>
                    <div style="margin-top: 1rem; height: 224px; background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.1); border-radius: 0.75rem; display: grid; place-items: center; color: rgba(255,255,255,0.5); font-size: 0.875rem;">
                        지도(임시)
                    </div>
                </div>
                
                <form class="form-container">
                    <input type="text" class="form-input" placeholder="성함">
                    <input type="email" class="form-input" placeholder="이메일">
                    <textarea class="form-textarea" placeholder="메시지" style="min-height: 150px;"></textarea>
                    <button class="btn-primary" style="width: 100%;">보내기</button>
                </form>
            </div>
        </div>
    </section>

    <!-- Login Page -->
    <section id="login" class="page-section">
        <div class="dynamic-backdrop">
            <div class="gradient-glow"></div>
        </div>
        
        <div class="container">
            <div style="max-width: 28rem; margin: 0 auto;">
                <div class="form-container">
                    <div style="text-align: center; margin-bottom: 1.5rem;">
                        <h2 style="font-size: 1.5rem;">로그인</h2>
                        <p style="color: rgba(255,255,255,0.7); font-size: 0.875rem; margin-top: 0.25rem;">파트너/고객 포털 접속</p>
                    </div>
                    
                    <div style="position: relative;">
                        <svg style="position: absolute; left: 12px; top: 50%; transform: translateY(-50%); width: 16px; height: 16px; color: rgba(255,255,255,0.6);" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <rect x="3" y="11" width="18" height="10" rx="2" ry="2"/>
                            <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
                        </svg>
                        <input type="email" class="form-input" placeholder="이메일" style="padding-left: 2.5rem;">
                    </div>
                    
                    <div style="position: relative;">
                        <svg style="position: absolute; left: 12px; top: 50%; transform: translateY(-50%); width: 16px; height: 16px; color: rgba(255,255,255,0.6);" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <rect x="3" y="11" width="18" height="10" rx="2" ry="2"/>
                            <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
                        </svg>
                        <input type="password" class="form-input" placeholder="비밀번호" style="padding-left: 2.5rem;">
                    </div>
                    
                    <button class="btn-primary" style="width: 100%; margin-top: 0.5rem;">로그인</button>
                </div>
            </div>
        </div>
    </section>

    <!-- Floating Button -->
    <button class="floating-btn" onclick="navigateTo('request')">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"/>
        </svg>
        상담받기
    </button>

    <!-- Footer -->
    <footer>
        <div class="footer-content">
            <span>© 2025 SHINKISA Co., Ltd. All rights reserved.</span>
            <div class="footer-links">
                <a href="#">개인정보처리방침</a>
                <a href="#">이용약관</a>
            </div>
        </div>
    </footer>

    <script>
        // Page Navigation
        let currentPage = 'home';
        
        function navigateTo(page) {
            document.querySelectorAll('.page-section').forEach(section => {
                section.classList.remove('active');
            });
            document.getElementById(page).classList.add('active');
            
            document.querySelectorAll('.nav-link').forEach(link => {
                link.classList.remove('active');
            });
            event.target?.classList.add('active');
            
            currentPage = page;
        }

        // Carousel
        let currentSlide = 0;
        const carouselItems = document.querySelectorAll('.carousel-item');
        const carouselDots = document.querySelectorAll('.carousel-dot');

        function setCarouselSlide(index) {
            carouselItems.forEach(item => item.classList.remove('active'));
            carouselDots.forEach(dot => dot.classList.remove('active'));
            
            carouselItems[index].classList.add('active');
            carouselDots[index].classList.add('active');
            currentSlide = index;
        }

        // Auto-rotate carousel
        setInterval(() => {
            if (currentPage === 'application') {
                const nextSlide = (currentSlide + 1) % carouselItems.length;
                setCarouselSlide(nextSlide);
            }
        }, 3000);

        // Neuro Particles Canvas
        const neuroCanvas = document.getElementById('neuroCanvas');
        const neuroCtx = neuroCanvas.getContext('2d');
        const particles = [];
        const particleDensity = 0.00014;
        const particleSpeed = 0.4;

        function resizeCanvas() {
            const dpi = Math.min(2, window.devicePixelRatio || 1);
            neuroCanvas.width = window.innerWidth * dpi;
            neuroCanvas.height = window.innerHeight * dpi;
            neuroCanvas.style.width = window.innerWidth + 'px';
            neuroCanvas.style.height = window.innerHeight + 'px';
            
            // Initialize particles
            const count = Math.floor(window.innerWidth * window.innerHeight * particleDensity);
            particles.length = 0;
            for (let i = 0; i < count; i++) {
                particles.push({
                    x: Math.random() * neuroCanvas.width,
                    y: Math.random() * neuroCanvas.height,
                    vx: (Math.random() * 2 - 1) * particleSpeed,
                    vy: (Math.random() * 2 - 1) * particleSpeed
                });
            }
        }

        function drawNeuroParticles() {
            neuroCtx.clearRect(0, 0, neuroCanvas.width, neuroCanvas.height);
            
            // Draw particles
            neuroCtx.fillStyle = 'rgba(255, 255, 255, 0.55)';
            particles.forEach(p => {
                p.x += p.vx;
                p.y += p.vy;
                
                if (p.x < 0 || p.x > neuroCanvas.width) p.vx *= -1;
                if (p.y < 0 || p.y > neuroCanvas.height) p.vy *= -1;
                
                neuroCtx.beginPath();
                neuroCtx.arc(p.x, p.y, 1.5, 0, Math.PI * 2);
                neuroCtx.fill();
            });
            
            // Draw connections
            neuroCtx.lineWidth = 0.6;
            for (let i = 0; i < particles.length; i++) {
                for (let j = i + 1; j < particles.length; j++) {
                    const dx = particles[i].x - particles[j].x;
                    const dy = particles[i].y - particles[j].y;
                    const distance = Math.sqrt(dx * dx + dy * dy);
                    
                    if (distance < 110) {
                        const opacity = (1 - distance / 110) * 0.18;
                        neuroCtx.strokeStyle = `rgba(200, 220, 255, ${opacity})`;
                        neuroCtx.beginPath();
                        neuroCtx.moveTo(particles[i].x, particles[i].y);
                        neuroCtx.lineTo(particles[j].x, particles[j].y);
                        neuroCtx.stroke();
                    }
                }
            }
            
            requestAnimationFrame(drawNeuroParticles);
        }

        // Flow Grid Canvas
        const gridCanvas = document.getElementById('gridCanvas');
        const gridCtx = gridCanvas.getContext('2d');
        let gridTime = 0;

        function resizeGridCanvas() {
            const dpi = Math.min(2, window.devicePixelRatio || 1);
            gridCanvas.width = window.innerWidth * dpi;
            gridCanvas.height = window.innerHeight * dpi;
            gridCanvas.style.width = window.innerWidth + 'px';
            gridCanvas.style.height = window.innerHeight + 'px';
        }

        function drawFlowGrid() {
            gridCtx.clearRect(0, 0, gridCanvas.width, gridCanvas.height);
            gridCtx.strokeStyle = 'rgba(255, 255, 255, 0.06)';
            gridCtx.lineWidth = 1;
            
            const gap = 28;
            gridTime += 0.006;
            
            for (let y = 0; y <= gridCanvas.height; y += gap) {
                gridCtx.beginPath();
                for (let x = 0; x <= gridCanvas.width; x += gap) {
                    const offset = Math.sin((x * 0.003) + gridTime) * 6 + 
                                 Math.cos((y * 0.003) - gridTime) * 6;
                    const yy = y + offset;
                    
                    if (x === 0) {
                        gridCtx.moveTo(x, yy);
                    } else {
                        gridCtx.lineTo(x, yy);
                    }
                }
                gridCtx.stroke();
            }
            
            requestAnimationFrame(drawFlowGrid);
        }

        // Initialize canvases
        window.addEventListener('resize', () => {
            resizeCanvas();
            resizeGridCanvas();
        });

        resizeCanvas();
        resizeGridCanvas();
        drawNeuroParticles();
        drawFlowGrid();

        // Form submissions (prevent default)
        document.querySelectorAll('form').forEach(form => {
            form.addEventListener('submit', (e) => {
                e.preventDefault();
                alert('폼이 제출되었습니다. (데모 버전)');
            });
        });

        // Add smooth scroll behavior
        document.documentElement.style.scrollBehavior = 'smooth';

        // Interactive hover effects for feature cards
        document.querySelectorAll('.feature-card').forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-4px)';
                this.style.transition = 'transform 0.3s ease';
            });
            
            card.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0)';
            });
        });

        // Add ripple effect to buttons
        document.querySelectorAll('button').forEach(button => {
            button.addEventListener('click', function(e) {
                const ripple = document.createElement('span');
                const rect = this.getBoundingClientRect();
                const size = Math.max(rect.width, rect.height);
                const x = e.clientX - rect.left - size / 2;
                const y = e.clientY - rect.top - size / 2;
                
                ripple.style.width = ripple.style.height = size + 'px';
                ripple.style.left = x + 'px';
                ripple.style.top = y + 'px';
                ripple.classList.add('ripple');
                
                this.appendChild(ripple);
                
                setTimeout(() => {
                    ripple.remove();
                }, 600);
            });
        });

        // Add ripple animation styles
        const style = document.createElement('style');
        style.textContent = `
            button {
                position: relative;
                overflow: hidden;
            }
            
            .ripple {
                position: absolute;
                border-radius: 50%;
                background: rgba(255, 255, 255, 0.5);
                transform: scale(0);
                animation: ripple-animation 0.6s ease-out;
                pointer-events: none;
            }
            
            @keyframes ripple-animation {
                to {
                    transform: scale(4);
                    opacity: 0;
                }
            }
            
            .feature-card {
                cursor: pointer;
            }
            
            .feature-card::after {
                content: '';
                position: absolute;
                bottom: -40px;
                right: 0;
                width: 96px;
                height: 96px;
                background: rgba(255, 255, 255, 0.05);
                border-radius: 50%;
                filter: blur(32px);
                transition: all 0.5s ease;
                opacity: 0;
            }
            
            .feature-card:hover::after {
                bottom: 0;
                opacity: 1;
            }
        `;
        document.head.appendChild(style);

        // Parallax effect for background blobs
        document.addEventListener('mousemove', (e) => {
            const x = e.clientX / window.innerWidth;
            const y = e.clientY / window.innerHeight;
            
            const blob1 = document.querySelector('.moving-blob-1');
            const blob2 = document.querySelector('.moving-blob-2');
            
            if (blob1) {
                blob1.style.transform = `translate(${x * 20}px, ${y * 20}px) rotate(${x * 30}deg)`;
            }
            
            if (blob2) {
                blob2.style.transform = `translate(${-x * 20}px, ${-y * 20}px)`;
            }
        });

        // Typing effect for main heading
        const heading = document.querySelector('h1');
        if (heading) {
            const text = heading.textContent;
            heading.textContent = '';
            let index = 0;
            
            function typeWriter() {
                if (index < text.length) {
                    heading.textContent += text.charAt(index);
                    index++;
                    setTimeout(typeWriter, 30);
                }
            }
            
            setTimeout(typeWriter, 500);
        }

        // Performance optimization
        let ticking = false;
        function requestTick() {
            if (!ticking) {
                requestAnimationFrame(updateAnimations);
                ticking = true;
            }
        }

        function updateAnimations() {
            ticking = false;
        }

        // Intersection Observer for fade-in animations
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.animation = 'fadeInUp 0.6s forwards';
                }
            });
        }, observerOptions);

        document.querySelectorAll('.feature-card').forEach(card => {
            observer.observe(card);
        });

        console.log('SHINKISA Medical 3D Visualization Site - Loaded Successfully');
    </script>
</body>
</html>