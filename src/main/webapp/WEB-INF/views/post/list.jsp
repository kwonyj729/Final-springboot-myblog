<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/nav.jsp"%>


<div class="container">
	<div class="text-center">
		<h2>메인 게시판</h2>
	</div>
	<br />
<!-- 	<div class="text-center"> -->
<!-- 		<button type="button" value="전체" class="total--list btn btn-outline-primary">전체보기</button> -->
<!-- 		<button type="button" value="제목별" class="title--list btn btn-outline-warning">제목별</button> -->
<!-- 		<button type="button" value="글쓴이별" class="writer--list btn btn-outline-success">글쓴이별</button> -->
<!-- 		<button type="button" value="날짜별" class="date--list btn btn-outline-info">작성일순</button> -->
<!-- 	</div> -->
<!-- 	<br /> <br /> -->
	<table class="table">

		<thead>
			<tr id="table--title" class="text-center">
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="post" items="${posts}">
				<tr class="item table-warning text-center">

					<td>${post.id}</td>
					<td><a href="/post/detail/${post.id}">${post.title}</a></td>
					<td>${post.username}</td>
					<td><fmt:formatDate value="${post.createDate}" type="date" pattern="yyyy/MM/dd HH:mm" var="date"/>${date}</td>
											

				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<%@include file="../include/footer.jsp"%>