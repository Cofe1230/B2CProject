<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<div class="hero page-inner overlay"
	style="background-image: url('/images/bg_main.png')">
	<div class="container">
		<div class="row justify-content-center align-items-center">
			<div class="col-lg-9 text-center mt-5">
				<h1 class="heading" data-aos="fade-up">책 등록</h1>

				<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
					<ol class="breadcrumb text-center justify-content-center">
						<li class="breadcrumb-item"><a href="/">Home</a></li>
						<li class="breadcrumb-item"><a href="/book/list">대여 리스트</a></li>
						<li class="breadcrumb-item active text-white-50"
							aria-current="page">책 등록</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>

<div class="section">
	<div class="container">
		<h2>책 등록</h2>
		<br />
		<form action="/book/insert" id="frm" method="post"
			enctype="multipart/form-data">
			<div class="form-group mt-2">
				<label for="title">책제목</label> <input type="text"
					class="form-control" id="title" placeholder="Enter title"
					name="title">
			</div>
			<spring:hasBindErrors name="bookFormDTO">
				<c:if test="${errors.hasFieldErrors('title') }">
					<div class="alert alert-danger">
						<strong>${errors.getFieldError( 'title' ).defaultMessage }</strong>
					</div>
				</c:if>
			</spring:hasBindErrors>
			<div class="form-group mt-5">
				<label for="author">저자</label> <input type="text"
					class="form-control" id="author" name="author"
					placeholder="Enter author">
			</div>
			<spring:hasBindErrors name="bookFormDTO">
				<c:if test="${errors.hasFieldErrors('author') }">
					<div class="alert alert-danger">
						<strong>${errors.getFieldError( 'author' ).defaultMessage }</strong>
					</div>
				</c:if>
			</spring:hasBindErrors>

			<div class="form-group mt-5">
				<label for="category">카테고리</label> <select name='category'
					class="form-select">
					<option value='취미	'>취미</option>
					<option value='경제경영'>경제경영</option>
					<option value='고전'>고전</option>
					<option value='만화'>만화</option>
					<option value='소설'>소설</option>
					<option value='어린이'>어린이</option>
					<option value='여행'>여행</option>
					<option value='기타'>기타</option>
				</select>
			</div>

			<div class="form-group mt-5">
				<label for="content">내용</label>
				<textarea class="form-control" rows="5" id="content" name="content"></textarea>
			</div>
			<spring:hasBindErrors name="bookFormDTO">
				<c:if test="${errors.hasFieldErrors('content') }">
					<div class="alert alert-danger">
						<strong>${errors.getFieldError( 'content' ).defaultMessage }</strong>
					</div>
				</c:if>
			</spring:hasBindErrors>

			<div class="form-group mt-5">
				<label for="upload">책 표지</label>

			</div>
			<div class="form-group mt-2">
				<input type="File" class="form-control" id="upload" name="upload">
			</div>
			<div class="form-group mt-5">
				<button type="submit" class="btn btn-primary" id="insertBtn">등록하기</button>
			</div>
		</form>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>