<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="author" content="Untree.co" />
<link rel="shortcut icon" href="favicon.png" />

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap5" />

<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap"
	rel="stylesheet" />

<link rel="stylesheet" href="/font/icomoon/style.css" />
<link rel="stylesheet" href="/font/flaticon/font/flaticon.css" />

<link rel="stylesheet" href="/css/tiny-slider.css" />
<link rel="stylesheet" href="/css/aos.css" />
<link rel="stylesheet" href="/css/style.css" />
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>B2C project</title>


</head>
<body>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="principal" />
	</sec:authorize>


	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>

	<nav class="site-nav">
		<div class="container">
			<div class="menu-bg-wrap">
				<div class="site-navigation">
					<a href="/" class="logo m-0 float-start">B2C</a>

					<ul
						class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-start">
						<li><a href="/">Home</a></li>


						<li class="has-children"><a href="/book/list">책 렌탈</a>
							<ul class="dropdown">
								<li><a href="/book/list">책 리스트</a></li>
								<li><a href="/book/insert">책 등록하기</a></li>

							</ul></li>



						<li class="has-children"><a href="/board/list">게시판</a>
							<ul class="dropdown">
								<li><a href="/board/list">글 목록</a></li>
								<li><a href="/board/insert">글 등록</a></li>
							</ul></li>
					</ul>

					<ul
						class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">


						<!--   <li><a href="about.html">About</a></li>-->

						<sec:authorize access="isAnonymous()">
							<li><a href="/member/login">로그인</a></li>
							<li><a href="/member/join">회원가입</a></li>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<li class="has-children"><a href="/admin/memberlist">관리페이지</a>
								<ul class="dropdown">
									<li><a href="/admin/memberlist">회원리스트</a></li>
									<li><a href="/admin/overduelist">미납리스트</a></li>
								</ul></li>
							</sec:authorize>
							<li class="has-children"><a href="/member/memberview/${principal.member.username }">마이페이지</a>
								<ul class="dropdown">
									<li><a href="/member/memberview/${principal.member.username }">회원정보</a></li>
									<li><a href="/rent/list">빌려준책</a></li>
									<li><a href="/rent/returnlist">빌린책</a></li>
									<li><a href="/member/logout">로그아웃</a></li>
								</ul></li>
						</sec:authorize>
					</ul>


					<a href="#"
						class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none"
						data-toggle="collapse" data-target="#main-navbar">
						<span></span>
					</a>
				</div>
			</div>
		</div>
	</nav>