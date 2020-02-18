<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/nav.jsp"%>

<div class="container">

	<div class="card">
		<div class="card-header">
			<h4 class="card-title text-center">[글제목] ${post.title}</h4>
		</div>
		<div class="card-body">
			<p class="card-text">${post.content}</p>
		</div>
		<div class="card-footer">
		<div class="text-right">
			<c:if test="${post.userId eq sessionScope.principal.id}">
				<a href="/post/update/${post.id}" class="btn btn-sm btn-warning">수정하기</a>
				<button id="post--delete--submit" value="${post.id}" class="btn btn-sm btn-danger">삭제하기</button>
			</c:if>
			<a href="/post/list" class="btn btn-primary btn-sm">목록보기</a>
			</div>
		</div>
	</div>

	<br />
	<div class="card">
		<div class="form-group">
			<div class="card-body">
				<input type="hidden" id="postId" value="${post.id}" /> <input type="hidden" id="userId" value="${sessionScope.principal.id}" />
				<textarea class="form-control" rows="2" id="content"></textarea>
			</div>
			<div class="card-footer">
			<div class="text-right">
				<button id="comment--save--submit" class="btn btn-success btn-sm">댓글등록</button>
			</div>
			</div>
		</div>
	</div>

	<br />
	<div class="card">
		<div class="form-group">
			<div class="card-header">
				<h4 class="card-title text-center">댓글 리스트</h4>
			</div>
			
			<c:forEach var="comment" items="${comments}">
			<ul id="comment--items" class="list-group">
				<li id="comment--item--${comment.id }" class="list-group-item d-flex justify-content-between align-items-center"> 
					<div class="font-italic">${comment.content}</div>
					<div class="badge badge-pill ml-auto">[작성자] ${comment.username}</div>
					<c:if test="${comment.userId eq sessionScope.principal.id}">
					
					<button onclick="commentDelete(${comment.id})" class="badge badge-secondary">삭제</button>
					</c:if>
				</li>
			</ul>
			</c:forEach>

		</div>
	</div>

</div>

<script src="/js/detail.js"></script>

<%@include file="../include/footer.jsp"%>









