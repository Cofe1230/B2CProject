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
		<form action="/book/insert" id="frm" method="post"
			enctype="multipart/form-data">
			<div class="form-group mt-2">
				<label for="title">책제목 : </label> <input type="text"
					class="form-control" id="title" placeholder="책 제목을 입력해주세요"
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
				<label for="author">저자 : </label> <input type="text"
					class="form-control" id="author" name="author" placeholder="저자를 입력해주세요">
			</div>
			<spring:hasBindErrors name="bookFormDTO">
				<c:if test="${errors.hasFieldErrors('author') }">
					<div class="alert alert-danger">
						<strong>${errors.getFieldError( 'author' ).defaultMessage }</strong>
					</div>
				</c:if>
			</spring:hasBindErrors>

			<div class="form-group mt-5">
				<label for="category">카테고리 : </label> <select name='category'>
					<option value='국내도서'>국내도서</option>
					<option value='해외도서'>해외도서</option>
				</select>
			</div>

			<div class="form-group mt-5">
				<label for="content">내용:</label>
				<textarea class="form-control" rows="5" id="content" name="content"></textarea>
			</div>
			<spring:hasBindErrors name="bookFormDTO">
				<c:if test="${errors.hasFieldErrors('content') }">
					<div class="alert alert-danger">
						<strong>${errors.getFieldError( 'content' ).defaultMessage }</strong>
					</div>
				</c:if>
			</spring:hasBindErrors>
			
			<div class="form-group mt-2">
				<label for="upload">파일:</label> <input type="File"
					class="form-control" id="upload" name="upload">
			</div>
			<div class="form-group mt-2">
			<button type="submit" class="btn btn-dark py-2 px-3" id="insertBtn">등록하기</button>
			</div>
		</form>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>