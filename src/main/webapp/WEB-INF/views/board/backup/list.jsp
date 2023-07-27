<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="hero page-inner overlay"
	style="background-image: url('/images/bg_main.png')">
	<div class="container">
		<div class="row justify-content-center align-items-center">
			<div class="col-lg-9 text-center mt-5">
				<h1 class="heading" data-aos="fade-up">게시판</h1>

				<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
					<ol class="breadcrumb text-center justify-content-center">
						<li class="breadcrumb-item"><a href="/">Home</a></li>
						<li class="breadcrumb-item active text-white-50"
							aria-current="page">글 리스트</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>

<div class="section">
	<div class="container mt-3">
		<h2>게시판</h2>

		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boards}" var="board" varStatus="st">
					<tr>
						<td>${board.boardid}</td>
						<td><a href="/board/view/${board.boardid}">${board.title }[${board.replycnt }]</a></td>
						<td>${board.member.username}</td>
						<td><fmt:formatDate value="${board.regdate}"
								pattern="yyyy-MM-dd" /></td>
						<td>${board.hitcount }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br />
		<form class="form-inline" action="/board/list" method="get">
			<select name='field' class="form-control mr-sm-1">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select> <input type='text' name='word' class="form-control"
				placeholder="Search"> <br />
			<button class='btn btn-secondary'>Search</button>

			<div class="d-flex justify-content-between mt-3">
				<ul class="pagination">
					<c:if test="${currentPage > 1}">
						<li class="page-item"><a class="page-link" href="#"
							onclick="goToPage(${currentPage - 1})"> 이전 </a></li>
					</c:if>
					<c:if test="${currentPage < totalPages}">
						<li class="page-item"><a class="page-link" href="#"
							onclick="goToPage(${currentPage + 1})"> 다음 </a></li>
					</c:if>
				</ul>
			</div>
		</form>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>