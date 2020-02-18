<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블로그</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-bs4.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css" />

</head>
<body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<!-- 섬머노트 -->
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-bs4.min.js"></script>


	<nav class="navbar navbar-default navbar-expand-md navbar-light">
		<!-- Brand -->
		<div>
			<a class="navbar-brand" href="/"><img src="/images/myLogo.png" id="myLogo" /></a>
		</div>

		<!-- Toggler/collapsibe Button -->
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		<!-- Navbar links -->
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">

				<c:choose>
					<c:when test="${not empty sessionScope.principal}">

						<li class="nav-item"><a class="nav-link text-light" href="/post/list">게시판</a></li>

						<li class="nav-item"><a class="nav-link text-light" href="/post/write">글쓰기</a></li>

						<li class="nav-item"><a class="nav-link text-light" href="/user/profile/${sessionScope.principal.id}">회원정보수정</a></li>

						<li class="nav-item"><a class="nav-link text-light" href="/user/logout">로그아웃</a></li>
						
						<li class="nav-item"><a class="nav-link text-light" href="/post/regionList">국내 산 목록</a></li>
						
						<li class="nav-item"><a class="nav-link text-light" href="/post/product">등산/캠핑용품</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link text-light" href="/user/join">회원가입</a></li>

						<li class="nav-item"><a class="nav-link text-light" href="/user/login">로그인</a></li>

						<li class="nav-item"><a class="nav-link text-light" href="/post/list">게시판</a></li>
						
						<li class="nav-item"><a class="nav-link text-light" href="/post/regionList">국내 산 목록</a></li>
						
						<li class="nav-item"><a class="nav-link text-light" href="/post/product">등산/캠핑용품</a></li>
					</c:otherwise>
				</c:choose>

			</ul>
			<div class="ml-auto">
				<span>${sessionScope.principal.username} 님 </span> <img src="/media/${sessionScope.principal.profile}" class="rounded-circle my__img ml-auto"
					width="30px" height="30px" onerror="javascript:this.src ='/images/unknown.jpg'" />
			</div>
		</div>
	</nav>
	<br />