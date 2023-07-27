<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<div class="hero page-inner overlay"
	style="background-image: url('/images/bg_main.png')">
	<div class="container">
		<div class="row justify-content-center align-items-center">
			<div class="col-lg-9 text-center mt-5">
				<h1 class="heading" data-aos="fade-up">로그인</h1>

				<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
					<ol class="breadcrumb text-center justify-content-center">
						<li class="breadcrumb-item"><a href="/">Home</a></li>
						<li class="breadcrumb-item active text-white-50"
							aria-current="page">로그인</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>

<div class="section">
	<div class="container">
		<form action="/member/login" method="post">
			<div class="form-group mt-5">
				<label for="username">아이디 </label> <input type="text"
					class="form-control" id="username" placeholder="Enter id"
					name="username">
			</div>

			<div class="form-group mt-5">
				<label for="password">비밀번호 </label> <input type="password"
					class="form-control" id="password" placeholder="Enter password"
					name="password">
			</div>
			<c:if test="${!empty loginErrorMsg }">
				<div class="alert alert-danger">
					<strong>${loginErrorMsg }</strong>
				</div>
			</c:if>
			<div class="form-group mt-5">
				<button type="submit" class="btn btn-primary">로그인</button>
			</div>
		</form>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>