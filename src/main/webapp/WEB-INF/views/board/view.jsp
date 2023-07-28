<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="hero page-inner overlay"
	style="background-image: url('/images/bg_main.png')">
	<div class="container">
		<div class="row justify-content-center align-items-center">
			<div class="col-lg-9 text-center mt-5">
				<h1 class="heading" data-aos="fade-up">글 상세보기</h1>

				<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
					<ol class="breadcrumb text-center justify-content-center">
						<li class="breadcrumb-item"><a href="/">Home</a></li>
						<li class="breadcrumb-item"><a href="/board/list">글 목록</a></li>
						<li class="breadcrumb-item active text-white-50"
							aria-current="page">글 상세보기</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>

<div class="section">
	<div class="container">
		<input type="hidden" name="boardid" value="${board.boardid }">
		<h2>상세 보기</h2>
		<br/>
		<table class="table table-hover">
			<tr>
				<td>글번호</td>
				<td>${board.boardid }</td>
				<td>조회수</td>
				<td>${board.hitcount }</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${board.member.username }</td>
				<td>작성일</td>
				<td><fmt:formatDate value="${board.regdate }"
						pattern="yyyy-MM-dd" /></td>
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
		<c:if test="${principal.username==board.member.username }">
			<div class="form-group text-right mt-3">
				<button class="btn btn-primary" id="btnUpdate">수정</button>
				<button class="btn btn-secondary" id="btnDelete">삭제</button>
			</div>
		</c:if>
		<div class="form-group mt-5">
			<label for="msg">댓글 내용</label>
			<textarea class="form-control" rows="3" cols="50" id="msg"></textarea>
			<br>
			<button class="btn btn-success btn-sm" id="commentBtn">댓글쓰기</button>
			<hr />
			<div id="replyResult"></div>
		</div>
	</div>
</div>
<script>
var init=function(){
	$.ajax({
		type:'get',
		url:'/reply/list/${board.boardid}'
	})
	.done(function(resp){
		console.log(resp)
		let str="<table class='table table-hover'><tr><th>이름</th><th>내용</th><th>날짜</th><th></th></tr>";
		$.each(resp,function(key,value){
			str+="<tr>"
			str+="<td>"+value.member.username+"</td>"
			str+="<td>"+value.content+"</td>"
			str+="<td>"+value.regdate+"</td>"
			if("${principal.username}"==value.member.username){
				str+="<td><a href='javascript:fdel("+value.cnum+")'>삭제</a></td>"	
			}else{
				str+="<td></td>"
			}
			str+="</tr>"
		})
		str+="</table>"
		$('#replyResult').html(str);
	})
}
function fdel(num){
	if(!confirm('삭제할까요?')){
		return false;
	}
	$.ajax({
		type:'delete',
		url:'/reply/delete/'+num,
	})
	.done(function(resp){
		alert('성공')
		init();
	})
	.fail(function(e){
		alert('실패' + e)
	})
}

$('#commentBtn').click(function(){
	if(${empty principal.member}){
		alert('로그인 해주세요')
		location.href="/member/login";
		return;
	}
	if($('#msg').val()==""){
		alert('댓글을 적으세요')
		return;
	}
	let data={
			"content" : $('#msg').val()
	};
	$.ajax({
		type:'post',
		url:'/reply/insert/'+${board.boardid },
		contentType:'application/json; charset=utf-8',
		data:JSON.stringify(data)
	})
	.done(function(resp,status){
		alert('댓글추가 성공')
		init();
	})
	.fail(function(){
		alert('댓글추가 실패')
	})
})


$('#btnDelete').click(function(){
	if(!confirm('삭제하시겠습니까?')){
		return false;
	}
	$.ajax({
		type:'delete',
		url:'/board/delete/${board.boardid}',
		success:function(resp){
			if(resp=='success'){
				alert("삭제되었습니다.")
				location.href='/board/list';
			}
		}
	})
})
$('#btnUpdate').click(function(){
	if(!confirm('수정하겠습니까?')){
		return false;
	}
	location.href='/board/update/${board.boardid}';
})

init();
</script>
<%@ include file="../include/footer.jsp"%>