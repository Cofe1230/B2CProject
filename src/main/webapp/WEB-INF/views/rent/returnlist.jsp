<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="hero page-inner overlay"
	style="background-image: url('/images/bg_main.png')">
	<div class="container">
		<div class="row justify-content-center align-items-center">
			<div class="col-lg-9 text-center mt-5">
				<h1 class="heading" data-aos="fade-up">빌린책</h1>

				<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
					<ol class="breadcrumb text-center justify-content-center">
						<li class="breadcrumb-item"><a href="/">Home</a></li>
						<li class="breadcrumb-item"><a href="/member/memberview/${principal.username }">내 정보</a></li>
						<li class="breadcrumb-item active text-white-50"
							aria-current="page">빌린책</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>

<div class="section">
	<div class="container"> 
	<h2>대여 요청</h2>
	<c:forEach items="${returnlist }" var="item">
		<c:if test="${item.rentstatus=='request' }">
		대여번호 : ${item.rentalid }<br/>
		책 이름 : ${item.bookid.title }<br/>
		</c:if>
	</c:forEach>
	<hr/>
	<h2>대여중</h2>
	<hr/>
	<c:forEach items="${returnlist }" var="item">
		<c:if test="${item.rentstatus=='rent' }">
		<div class="row">
		<div class="col-lg-4">
		<strong>
		대여번호 : ${item.rentalid }<br/>
		책 이름 : ${item.bookid.title }<br/>
		대여 날짜 : <fmt:formatDate value="${item.rentdate }" pattern="yyyy-MM-dd"/><br/>
		반납 날짜 : <fmt:formatDate value="${item.returndate }" pattern="yyyy-MM-dd"/><br/>
		</strong>
		<hr/>
		</div>
		</div>
		</c:if>
	</c:forEach>
	<hr/>
	<hr/>
	<h2>연체중</h2>
	<hr/>
	<c:forEach items="${returnlist }" var="item">
		<c:if test="${item.rentstatus=='overdue' }">
		<div class="row">
		<div class="col-lg-4">
		<strong>
		대여번호 : ${item.rentalid }<br/>
		책 이름 : ${item.bookid.title }<br/>
		대여 날짜 : <fmt:formatDate value="${item.rentdate }" pattern="yyyy-MM-dd"/><br/>
		반납 날짜 : <fmt:formatDate value="${item.returndate }" pattern="yyyy-MM-dd"/><br/>
		</strong>
		<hr/>
		</div>
		</div>
		</c:if>
	</c:forEach>
	<hr/>
</div>
</div>

<%@ include file="../include/footer.jsp"%>