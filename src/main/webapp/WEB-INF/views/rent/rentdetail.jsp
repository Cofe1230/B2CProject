<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<div class="row justify-content-between">
			<div class="col-lg-7">
				<div class="img-property-slide-wrap">
					<div class="img-property-slide">
						<img src="/resource/img/${rental.bookid.img }" alt="Image"
							class="img-fluid" />
					</div>
				</div>
			</div>
			<div class="col-lg-4">
				<h2 class="heading text-primary">${rental.bookid.title }</h2>
				<div class="d-block agent-box p-5">
					<div class="text">
						<h3 class="mb-0">등록 유저</h3><br/>
						<h5 class="meta mb-0">id : ${rental.rentid.username }</h5>
						<h5 class="meta mb-0">email : ${rental.rentid.email }</h5>
						<h5 class="meta mb-0">주소 : ${rental.rentid.address }</h5>
						<h5 class="meta mb-0">지역 : ${rental.rentid.location }</h5>
					</div>
				</div>
				<div class="d-block agent-box p-5">
					<div class="text">
						<h3 class="mb-0">렌탈 유저</h3><br/>
						<h5 class="meta mb-0">id : ${rental.returnid.username }</h5>
						<h5 class="meta mb-0">email : ${rental.returnid.email }</h5>
						<h5 class="meta mb-0">주소 : ${rental.returnid.address }</h5>
						<h5 class="meta mb-0">지역 : ${rental.returnid.location }</h5>
					</div>
				</div><br>
				<h3>대여 날짜 : <fmt:formatDate value="${rental.rentdate }" pattern="yyyy-MM-dd" />
				<br /> 반납 날짜 :
				<fmt:formatDate value="${rental.returndate }" pattern="yyyy-MM-dd" />
				<br />
				<br />
				</h3>
				<c:if test="${rental.rentstatus=='request' }">
					<button type="button" class="btn btn-primary btn-sm"
						onclick="rentrequest(${rental.rentalid})">대여수락</button>
				</c:if>
				<c:if
					test="${rental.rentid.username == principal.username and rental.rentstatus=='rent' }">
					<button type="button" class="btn btn-success py-3 px-4"
						onclick="returnBook(${rental.rentalid})">반납완료</button>
				</c:if>
			</div>
		</div>
	</div>
</div>
<script>
function rentrequest(num){
	if(!confirm('요청 승낙하겠습니까?')){
		return false;
	}
	$.ajax({
		type:'get',
		url:'/rent/acceptrent/'+num
	})
	.done(function(){
		alert('승낙되었습니다')
		location.href="/rent/list"
	})
	.fail(function(){
		alert('실패')
	})
}
function returnBook(num){
	if(!confirm('반납 완료하겠습니까?')){
		return false;
	}
	$.ajax({
		type:'get',
		url:'/rent/returnbook/'+num
	})
	.done(function(){
		alert('완료되었습니다')
		location.href="/"
	})
	.fail(function(){
		alert('실패')
	})
}
</script>

<%@ include file="../include/footer.jsp"%>