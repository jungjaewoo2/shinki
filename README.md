# Shinki 프로젝트

## 프로젝트 개요
의료 시뮬레이션 의뢰 및 문의 관리 시스템

## 데이터베이스 설정
- 데이터베이스명: `shinki`
- 사용자: `root`
- 비밀번호: `topy1004`

## 주요 기능

### 1. 회원 관리
- 회원가입 (`/mypage/profile`)
- 로그인 (`/mypage/login`)

### 2. 의뢰 관리
- 의뢰 등록 (`/mypage/request`)
- 의뢰 목록 조회 (`/mypage/orders`)
- 의뢰 상세 조회 (`/mypage/order-detail/{id}`)

### 3. 문의 관리
- 문의 등록 (`/mypage/inquiry`)
- 문의 내역 조회 (`/mypage/inquiry-history`)
- 관리자 문의 관리 (`/admin/inquiries`)

## 데이터베이스 테이블

### Member 테이블
- 회원 정보 (병원명, 진료과, 이름, 아이디, 비밀번호, 연락처, 이메일, 추천직원, 추천코드)

### Request 테이블
- 의뢰 정보 (회원ID, 환자정보보호동의서, APPLICATION 타입, 제목, 내용, 파일경로, 상태)

### Inquiry 테이블
- 문의 정보 (회원ID, 문의유형, 내용, 파일경로, 상태, 관리자답변, 답변일시)

## 실행 방법

1. MySQL 데이터베이스 생성:
```sql
CREATE DATABASE shinki;
```

2. 프로젝트 빌드 및 실행:
```bash
mvn clean install
mvn spring-boot:run
```

3. 웹 브라우저에서 접속:
- 메인 페이지: `http://localhost:8080`
- 회원가입: `http://localhost:8080/mypage/profile`
- 관리자 문의 관리: `http://localhost:8080/admin/inquiries`

## 파일 업로드
- 의뢰 파일: `uploads/requests/` 디렉토리에 저장
- 문의 파일: `uploads/inquiries/` 디렉토리에 저장

## 기술 스택
- Spring Boot 3.5.5
- Spring Data JPA
- MySQL 8.0
- Thymeleaf
- Bootstrap 5
- JSP/JSTL
