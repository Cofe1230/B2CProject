<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<div class="hero page-inner overlay"
	style="background-image: url('/images/bg_main.png')">
	<div class="container">
		<div class="row justify-content-center align-items-center">
			<div class="col-lg-9 text-center mt-5">
				<h1 class="heading" data-aos="fade-up">${member.username }</h1>

				<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
					<ol class="breadcrumb text-center justify-content-center">
						<li class="breadcrumb-item"><a href="/">Home</a></li>
						<li class="breadcrumb-item active text-white-50"
							aria-current="page">내 정보</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>

<div class="section">
	<div class="container">
		<h3>내 정보</h3>
		<form action="/member/memberupdate" method="post">

			<div class="form-group mt-5">
				<label for="username">아이디:</label> <input type="text"
					class="form-control" id="username" name="username"
					value="${member.username }" readonly="readonly">
				<spring:hasBindErrors name="memberDTO" />
			</div>
			<div class="form-group mt-5">
				<label for="password">비밀번호 </label> <input type="password"
					class="form-control" id="password" placeholder="Enter password"
					name="password">
				<spring:hasBindErrors name="memberDTO">
					<c:if test="${errors.hasFieldErrors('password') }">
						<div class="alert alert-danger">
							<strong>${errors.getFieldError( 'password' ).defaultMessage }</strong>
						</div>
					</c:if>
				</spring:hasBindErrors>

			</div>

			<div class="form-group mt-5">
				<label for="name">이름: </label> <input type="text"
					class="form-control" id="name" placeholder="Enter name" name="name"
					value="${member.name }">
				<spring:hasBindErrors name="memberDTO">
					<c:if test="${errors.hasFieldErrors('name') }">
						<div class="alert alert-danger">
							<strong>${errors.getFieldError( 'name' ).defaultMessage }</strong>
						</div>
					</c:if>
				</spring:hasBindErrors>
			</div>

			<div class="form-group mt-5">
				<label for="email">email </label> <input type="text"
					class="form-control" id="email" placeholder="Enter email"
					name="email" value="${member.email }">
				<spring:hasBindErrors name="memberDTO">
					<c:if test="${errors.hasFieldErrors('email') }">
						<div class="alert alert-danger">
							<strong>${errors.getFieldError( 'email' ).defaultMessage }</strong>
						</div>
					</c:if>
				</spring:hasBindErrors>

			</div>
			<div class="form-group mt-5">
				<label for="phone">전화번호 </label> <input type="text"
					class="form-control" id="phone" placeholder="Enter phone"
					name="phone" value="${member.phone }">
				<spring:hasBindErrors name="memberDTO">
					<c:if test="${errors.hasFieldErrors('phone') }">
						<div class="alert alert-danger">
							<strong>${errors.getFieldError( 'phone' ).defaultMessage }</strong>
						</div>
					</c:if>
				</spring:hasBindErrors>
			</div>
			<div class="form-group mt-5">
				<label for="address">주소 </label> <input type="text"
					class="form-control" id="address" placeholder="Enter address"
					name="address" value="${member.address }">

				<spring:hasBindErrors name="memberDTO">
					<c:if test="${errors.hasFieldErrors('address') }">
						<div class="alert alert-danger">
							<strong>${errors.getFieldError( 'address' ).defaultMessage }</strong>
						</div>
					</c:if>
				</spring:hasBindErrors>
			</div>
			<div class="form-group mt-5">
				<label for="location">지역 : </label> <select name='location' id='location'>
					<option value='해운대구'>해운대구</option>
					<option value='동래구'>동래구</option>
					<option value='연제구'>연제구</option>
					<option value='수영구'>수영구</option>
					<option value='부산진구'>부산진구</option>
				</select>
			</div>
			<c:if test="${member.username ==principal.member.username}">
				<div class="form-group text-right mt-5">
					<button type="submit" class="btn btn-secondary btn-sm"
						id="btnUpdate">수정</button>
					<a href="/member/logout"><button type="button" class="btn btn-dark btn-sm"
					id="btnLogout">로그아웃</button>	</a>

				</div>
			</c:if>
		</form>
	</div>
</div>
<script>
$('#location option').each(function(){
	if($(this).val()=='${member.location}'){
		$(this).prop("selected",true);
	}
})
</script>
<%@ include file="../include/footer.jsp"%>