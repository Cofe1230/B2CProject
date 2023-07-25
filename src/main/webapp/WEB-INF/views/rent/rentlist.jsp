<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<div class="hero page-inner overlay"
	style="background-image: url('/images/bg_main.png')">
	<div class="container">
		<div class="row justify-content-center align-items-center">
			<div class="col-lg-9 text-center mt-5">
				<h1 class="heading" data-aos="fade-up">빌려준 책</h1>

				<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
					<ol class="breadcrumb text-center justify-content-center">
						<li class="breadcrumb-item"><a href="/">Home</a></li>
						<li class="breadcrumb-item"><a href="/book/list">내 정보</a></li>
						<li class="breadcrumb-item active text-white-50"
							aria-current="page">빌려준 책</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>

<div class="section">
	<div class="container">
	<h2>대여 요청</h2>
 	<div class="row">
	  <c:forEach items="${lists }" var="item">
	  	<c:if test="${item.rentalid.rentstatus == 'request' }">
		  <div class="card col-lg-3" > <!-- col-4 4개의 칼럼이 나타남 -->
		  	<a href="/rent/rentdetail/${item.rentalid.rentalid}">
			    <img class="card-img-top" src="/resource/img/${item.img }" alt="Card image" style="width:100px;height:100px">
			    <div class="card-body" >
			      <h4 class="card-title">${item.title }</h4>
			      <div class="form-group">
							<button type="button" class="btn btn-primary btn-sm" onclick="location.href='/rent/rentdetail/${item.rentalid.rentalid}'">대여상세</button>
						</div>
			    </div>
			    </a>
		   </div>
		   </c:if>
	  </c:forEach>
  </div>
  <hr/>
  <h2>대여 중</h2>
 	<div class="row">
	  <c:forEach items="${lists }" var="item">
	  	<c:if test="${item.rentalid.rentstatus == 'rent' }">
		  <div class="card col-lg-3" > <!-- col-4 4개의 칼럼이 나타남 -->
		  	<a href="/rent/rentdetail/${item.rentalid.rentalid}">
			    <img class="card-img-top" src="/resource/img/${item.img }" alt="Card image" style="width:100px;height:100px">
			    <div class="card-body" >
			      <h4 class="card-title">${item.title }</h4>
			    </div>
		    </a>
		   </div>
		   </c:if>
	  </c:forEach>
  </div>
  <hr/>
  <h2>요청 대기</h2>
 	<div class="row">
	  <c:forEach items="${lists }" var="item">
	  	<c:if test="${empty item.rentalid.rentstatus }">
		  <div class="card col-lg-3" > <!-- col-4 4개의 칼럼이 나타남 -->
		  	<a href = "/book/bookdetail/${item.bookid }">
			    <img class="card-img-top" src="/resource/img/${item.img }" alt="Card image" style="width:100px;height:100px">
			    <div class="card-body" >
			      <h4 class="card-title">${item.title }</h4>
			    </div>
		    </a>
		   </div>
		   </c:if>
	  </c:forEach>
  </div>
  <h2>반납 완료</h2>
  <div class="row">
	  <c:forEach items="${lists }" var="item">
	  	<c:if test="${item.rentalid.rentstatus == 'return' }">
		  <div class="card col-lg-3" > <!-- col-4 4개의 칼럼이 나타남 -->
		  	<a href = "/book/bookdetail/${item.bookid }">
			    <img class="card-img-top" src="/resource/img/${item.img }" alt="Card image" style="width:100px;height:100px">
			    <div class="card-body" >
			      <h4 class="card-title">${item.title }</h4>
			    </div>
		    </a>
		   </div>
		   </c:if>
	  </c:forEach>
  </div>
</div>
</div>

<%@ include file="../include/footer.jsp"%>