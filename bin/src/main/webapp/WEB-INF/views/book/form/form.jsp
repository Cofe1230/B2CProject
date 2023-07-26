<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
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
<input type="hidden" id="num" name="num" value="${board.num }">
	<h2>상세 보기</h2>
	<table class="table table-hover">
		<tr>
			<td>글번호</td>
			<td>${board.num }</td>
			<td>조회수</td>
			<td>${board.hitcount }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${board.writer }</td>
			<td>작성일</td>
			<td><fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd"/> </td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3">${board.title }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3">${board.content }</td>
		</tr>
	</table>
	<br>
	<c:if test="${sessionScope.sMember.id==board.writer }">
	<div class="form-group text-right">
	<button class="btn btn-primary" id="btnUpdate">수정</button>
	<button class="btn btn-secondary" id="btnDelete">삭제</button>
	<a href="/delete/${board.num }">삭제</a>
	</div>
	</c:if>	
	<div class="form-group">
		<label for="msg">msg</label>
		<textarea class="form-control" rows="3" cols="50" id="msg"></textarea>
		<br>
		<button class="btn btn-success btn-sm" id="commentBtn">Comment Write</button>
		<hr/>
		<div id="replyResult"></div>
 	</div>
</div>
</div>

<%@ include file="../include/footer.jsp"%>