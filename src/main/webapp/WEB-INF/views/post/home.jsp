<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/nav.jsp"%>


<div class="container text-center">
	<div>
		<h2>Main Page</h2>
	</div>


	<!-- 메인 캐로셀 시작  -->
	<div id="demo" class="carousel slide" data-ride="carousel">
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
			<li data-target="#demo" data-slide-to="3"></li>
		</ul>
		<div class="carousel-inner">

			<div class="carousel-item active">
				<img src="/images/main-1.jpg">
				<div class="carousel-caption">
					<h3>Forest-1</h3>
					<p>We had such a great time there!</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/images/main-2.jpg">
				<div class="carousel-caption">
					<h3>Forest-2</h3>
					<p>We had such a great time there!</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/images/main-3.jpg">
				<div class="carousel-caption">
					<h3>Forest-3</h3>
					<p>We had such a great time there!</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/images/main-4.jpg">
				<div class="carousel-caption">
					<h3>Forest-4</h3>
					<p>We had such a great time there!</p>
				</div>
			</div>
		</div>
		
		<a class="carousel-control-prev" href="#demo" data-slide="prev"> 
			<span class="carousel-control-prev-icon"></span>
		</a> 
		<a class="carousel-control-next" href="#demo" data-slide="next"> 
		<span class="carousel-control-next-icon"></span>
		</a>
	</div>

	</body>
	</html>



</div>

<%@include file="../include/footer.jsp"%>