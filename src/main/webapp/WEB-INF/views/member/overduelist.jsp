<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<div class="hero page-inner overlay"
	style="background-image: url('/images/bg_main.png')">
	<div class="container">
		<div class="row justify-content-center align-items-center">
			<div class="col-lg-9 text-center mt-5">
				<h1 class="heading" data-aos="fade-up"></h1>

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
	
	<h3>미납 리스트 (${count})</h3>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>대여번호</th>
				<th>아이디</th>
				<th>이메일</th>
				<th>반납날짜</th>
				<th>반납상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${rental }" var="item" varStatus="st">
				<tr>
					<td>${item.rentalid}</td>
					<td>${item.rentid.username }
					<td>${item.rentid.email}</td>
					<td>${item.returndate}</td>
					<td>${item.rentstatus}</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>