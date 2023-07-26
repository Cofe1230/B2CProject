<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<div class="hero">
	<div class="hero-slide">
		<div class="img overlay"
			style="background-image: url('/images/homebg1.jpg')"></div>
		<div class="img overlay"
			style="background-image: url('/images/homebg2.png')"></div>
		<div class="img overlay"
			style="background-image: url('/images/homebg3.png')"></div>
	</div>

	<div class="container">
		<div class="row justify-content-center align-items-center">
			<div class="col-lg-9 text-center">
				
				<h1 class="heading" data-aos="fade-up">Book to Consumer</h1>
				
				<form action="/book/list" method="GET" 
					class="narrow-w form-search d-flex align-items-stretch mb-auto"
					data-aos="fade-up" data-aos-delay="200">
					<input type="text" class="form-control px-4" name="keyword"
						placeholder="제목/저자/국내or해외" />
					<input type="submit" class="btn btn-primary" value="검색">
				</form> 
			</div>
		</div>
	</div>
</div>
<%@ include file="include/footer.jsp"%>