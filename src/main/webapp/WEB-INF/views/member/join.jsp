<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
	
</script>
<div class="hero page-inner overlay"
	style="background-image: url('/images/bg_main.png')">
	<div class="container">
		<div class="row justify-content-center align-items-center">
			<div class="col-lg-9 text-center mt-5">
				<h1 class="heading" data-aos="fade-up">회원 가입</h1>

				<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
					<ol class="breadcrumb text-center justify-content-center">
						<li class="breadcrumb-item"><a href="/">Home</a></li>
						<li class="breadcrumb-item active text-white-50"
							aria-current="page">회원가입</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>

<div class="section">
	<div class="container">
		<form action="/member/join" method="post">
			<div class="form-group mt-5">
				<label for="name">이름 </label> <input type="text"
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
				<label for="username">아이디 </label> <input type="text"
					class="form-control" id="username" placeholder="Enter id"
					name="username" value="${member.username }">
				<spring:hasBindErrors name="memberDTO">
					<c:if test="${errors.hasFieldErrors('username') }">
						<div class="alert alert-danger">
							<strong>${errors.getFieldError( 'username' ).defaultMessage }</strong>
						</div>
					</c:if>
				</spring:hasBindErrors>
				<c:if test="${!empty errorMessage }">
					<div class="alert alert-danger">
						<strong>${errorMessage }</strong>
					</div>
				</c:if>
			</div>
			<div class="form-group mt-5">
				<label for="password">비밀번호 </label> <input type="password"
					class="form-control" id="password" placeholder="Enter password"
					name="password" value="${member.password }">
				<spring:hasBindErrors name="memberDTO">
					<c:if test="${errors.hasFieldErrors('password') }">
						<div class="alert alert-danger">
							<strong>${errors.getFieldError( 'password' ).defaultMessage }</strong>
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
				<label for="address">주소 </label>&nbsp;
				<button id="btnSearchAddressC" type="Button"
					onclick="findDaumPostcode()" value="주소찾기" class="btn-primary">주소찾기</button>
				<input type="text" class="form-control" id="address"
					placeholder="Enter address" name="address"
					value="${member.address }" readonly="readonly">


				<spring:hasBindErrors name="memberDTO">
					<c:if test="${errors.hasFieldErrors('address') }">
						<div class="alert alert-danger">
							<strong>${errors.getFieldError( 'address' ).defaultMessage }</strong>
						</div>
					</c:if>
				</spring:hasBindErrors>
			</div>
			<div class="form-group mt-5">
				<label for="location">지역</label> 
				<select name='location' class="form-select">
					<option value='해운대구'>해운대구</option>
					<option value='동래구'>동래구</option>
					<option value='연제구'>연제구</option>
					<option value='수영구'>수영구</option>
					<option value='부산진구'>부산진구</option>
				</select>
			</div>
			<div class="form-group mt-5">
				<button type="submit" class="btn btn-primary" id="btnJoin">회원가입</button>
			</div>
			
		</form>
	</div>
</div>
<script>
	function findDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var zoneCodeCompany = data.zonecode;
				var addressCompany = data.address;
				//document.getElementById("txtPostCodeC").value = zoneCodeCompany; // zipcode
				document.getElementById("address").value = addressCompany; // 주소 넣기
			}
		}).open();
	}
</script>
<%@ include file="../include/footer.jsp"%>