<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<div class="hero page-inner overlay"
	style="background-image: url('/images/bg_main.png')">
	<div class="container">
		<div class="row justify-content-center align-items-center">
			<div class="col-lg-9 text-center mt-5">
				<h1 class="heading" data-aos="fade-up">글 등록</h1>

				<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
					<ol class="breadcrumb text-center justify-content-center">
						<li class="breadcrumb-item"><a href="/">Home</a></li>
						<li class="breadcrumb-item"><a href="/board/list">글 리스트</a></li>
						<li class="breadcrumb-item active text-white-50"
							aria-current="page">글 등록</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>

<div class="section">
	<div class="container mt-3">
		<form action="/board/insert" method="post">
			<div class="col-6 mb-3">
				<label for="title">제목:</label> <input type="text"
					class="form-control" id="title" placeholder="Enter title"
					name="title">
				<spring:hasBindErrors name="boardFormDTO">
					<c:if test="${errors.hasFieldErrors('title') }">
						<div class="alert alert-danger">${errors.getFieldError( 'title' ).defaultMessage }
						</div>
					</c:if>
				</spring:hasBindErrors>
			</div>
			<div class="col-6 mb-3">
				<label for="writer">작성자:</label> <input type="text"
					class="form-control" id="writer" placeholder="Enter writer"
					name="writer" readonly="readonly" value="${principal.username }">
			</div>

			<div class="col-6 mb-3">
				<label for="content">내용:</label>
				<textarea class="form-control" rows="5" id="content" name="content"></textarea>
				<spring:hasBindErrors name="boardFormDTO">
					<c:if test="${errors.hasFieldErrors('content') }">
						<div class="alert alert-danger">${errors.getFieldError( 'content' ).defaultMessage }
						</div>
					</c:if>
				</spring:hasBindErrors>
			</div>

			<div class="form-group text-right mb-3">
				<button type="submit" class="btn btn-dark py-2 px-3" id="insertBtn">등록하기</button>
			</div>

		</form>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>