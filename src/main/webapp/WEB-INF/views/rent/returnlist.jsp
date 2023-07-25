<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<h2>대여 요청</h2>
	<c:forEach items="${returnlist }" var="item">
		<c:if test="${item.rentstatus=='request' }">
		대여번호 : ${item.rentalid }<br/>
		책 이름 : ${item.bookid.title }<br/>
		</c:if>
	</c:forEach>
	<hr/>
	<h2>대여중</h2>
	<c:forEach items="${returnlist }" var="item">
		<c:if test="${item.rentstatus=='rent' }">
		대여번호 : ${item.rentalid }<br/>
		책 이름 : ${item.bookid.title }<br/>
		대여 날짜 : <fmt:formatDate value="${item.rentdate }" pattern="yyyy-MM-dd"/><br/>
		반납 날짜 : <fmt:formatDate value="${item.returndate }" pattern="yyyy-MM-dd"/><br/>
	<button type="button" class="btn btn-primary btn-sm" >반납완료</button><br/>
		</c:if>
	</c:forEach>
	<hr/>
	<h2>반납 완료</h2>
	<c:forEach items="${returnlist }" var="item">
		<c:if test="${item.rentstatus=='return' }">
		책 이름 : ${item.bookid.title } 
		대여 날짜 : <fmt:formatDate value="${item.rentdate }" pattern="yyyy-MM-dd"/> 
		대여 유저 : ${item.rentid.username }<br/>
		</c:if>
	</c:forEach>
</div>
</div>

<%@ include file="../include/footer.jsp"%>