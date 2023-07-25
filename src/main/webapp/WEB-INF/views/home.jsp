<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<div class="hero">
	<div class="hero-slide">
		<div class="img overlay"
			style="background-image: url('/images/hero_bg_3.jpg')"></div>
		<div class="img overlay"
			style="background-image: url('images/hero_bg_2.jpg')"></div>
		<div class="img overlay"
			style="background-image: url('images/hero_bg_1.jpg')"></div>
	</div>

	<div class="container">
		<div class="row justify-content-center align-items-center">
			<div class="col-lg-9 text-center">
				<h1 class="heading" data-aos="fade-up">Easiest way to find your
					dream home</h1>
				<form action="/book/list"
					class="narrow-w form-search d-flex align-items-stretch mb-3"
					data-aos="fade-up" data-aos-delay="200">
					<input type="text" class="form-control px-4" name="keyword"
						placeholder="Your ZIP code or City. e.g. New York" />
					<input type="submit" class="btn btn-primary" value="검색">
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="include/footer.jsp"%>