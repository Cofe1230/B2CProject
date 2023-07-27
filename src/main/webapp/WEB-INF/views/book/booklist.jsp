<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<div class="hero page-inner overlay"
	style="background-image: url('/images/bg_main.png')">
	<div class="container">
		<div class="row justify-content-center align-items-center">
			<div class="col-lg-9 text-center mt-5">
				<h1 class="heading" data-aos="fade-up">대여리스트</h1>

				<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
					<ol class="breadcrumb text-center justify-content-center">
						<li class="breadcrumb-item"><a href="/">Home</a></li>
						<li class="breadcrumb-item active text-white-50"
							aria-current="page">대여리스트</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>

<div class="section">
	<div class="container">
	<table class="table">
	<tr>
	<td><a href="?location=">전체</a></td>
	<td><a href="?location=해운대구">해운대구</a></td>
	<td><a href="?location=동래구">동래구</a></td>
	<td><a href="?location=연제구">연제구</a></td>
	<td><a href="?location=부산진구">부산진구</a></td>
	</tr>
	</table>
	</div>
</div>

<div class="section section-properties">
	<div class="container">
		<div class="row">
			<c:forEach items="${lists.content }" var="item">
        <c:if test="${item.rentalid.rentstatus!='return' }">
					<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
						<div class="property-item mb-30">
							<a href="/book/bookdetail/${item.bookid }" class="img"> <img
								src="/resource/img/${item.img }" alt="Image" class="img-fluid"
								style="width: 400px; height: 400px" />
							</a>

							<div class="property-content">
								<div class="price mb-2">
									<c:if test="${empty item.rentalid }">
										<span>대여 가능</span>
										<span class="mylist"><c:if test="${item.memberid.username==principal.username }">-내글</c:if>
										</span>
									</c:if>
									<c:if test="${!empty item.rentalid }">
										<span style="color: #B40404">대여 불가</span>
									</c:if>
								</div>
								<div>
									<span class="d-block mb-2 text-black-50">${item.category }</span>
									<span class="d-block mb-2 text-black-50">${item.memberid.location }</span>
									<span class="city d-block mb-3">${item.title }</span>

									<div class="specs d-flex mb-4">
										<span class="d-block d-flex align-items-center me-3"> <span
											class="caption">대여기간 2주</span>
										</span>
									</div>

									<a href="/book/bookdetail/${item.bookid }"
										class="btn btn-primary py-2 px-3">상세
										보기</a>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div class="row align-items-center py-5">
		<div class="col-lg-3"></div>
			<div class="col-lg-6 text-center">
				<div class="custom-pagination">
				<c:if test="${p.startPage>p.blockPage }">
				<a href="?page=${p.startPage-p.blockPage-1 }&keyword=${keyword}&location=${location}">이전</a>
				</c:if>
				
				<c:forEach begin="${p.startPage }" end="${p.endPage }" var="i">
				<c:if test="${p.currentPage == i }">
					<a class="active"
						href="?page=${i-1 }&keyword=${keyword}&location=${location}">${i }</a>
				</c:if>
				<c:if test="${p.currentPage !=i }">
					<a 
						href="?page=${i-1 }&keyword=${keyword}&location=${location}">${i }</a>
				</c:if>
			</c:forEach>
			<c:if test="${p.endPage<p.totPage }">
				<a href="?page=${p.endPage }&keyword=${keyword}&location=${location}">다음</a>
				</c:if>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>
