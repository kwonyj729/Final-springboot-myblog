<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/nav.jsp"%>



	<div class="container">
		<div class="text-center">
			<h2>등산/캠핑 상품 리스트</h2>
		</div>
	
		<br />
		<div class="text-center">
			<button id="total_list" type="button"  onclick="type3()" value="없음" class="btn btn-outline-primary">모든상품</button>
			<button id="hiking_list" type="button" onclick="type1()" value="등산용품" class="btn btn-outline-secondary">등산용품</button>
			<button id="camping_list" type="button" onclick="type2()" value="캠핑용품" class="btn btn-outline-success">캠핑용품</button>
			<br/><br />
			<button id="price_list" type="button" class="btn btn-outline-info">높은가격순</button>
			<button id="order_list" type="button" class="btn btn-outline-warning">인기판매순</button>
			
		</div>
		<br />
		<br />
		<table class="table table-bordered">
			<thead>
				<tr id="title" class="text-center">
					<th>No.</th>
					<th>Name</th>
					<th>Price</th>
					<th>SalesCount</th>
					<th>Type</th>
				</tr>
			</thead>
			<c:forEach var="product" items="${products}">

				<tbody>
					<tr class="item text-center">
						<td>${product.id}</td>
						<td>${product.pname}</td>
						<td>${product.price}</td>
						<td>${product.orderCount}</td>
						<td>${product.type}</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
	
	<script>
		let data="";
		
		function type1() {
			data = $('#hiking_list').val();
			//console.log(data);
		}	
		function type2() {
			data = $('#camping_list').val();
			//console.log(data);
		}
		function type3() {
			data = $('#total_list').val();
			//console.log(data);
		}
	
		
	</script>	



	<script>

	// 전체상품보기
	$('#total_list').on('click', function(){
				
		$.ajax({
			type : 'GET',
			url : '/product/total',
			dataType : 'json'      
				
		}).done(function(result){
			//console.log(result);
			$('.item').remove();
	
			for(var r of result){
				var item_el= "<tr class='item text-center'><td>"+r.id+"</td><td>"+r.pname+"</td><td>"+r.price+"</td><td>"+r.orderCount+"</td><td>"+r.type+"</td></tr>";
				$('#title').after(item_el);
			}
		}).fail(function(result){
			console.log('서버오류');
			console.log(result);
		});
	});

	// 주방용품보기
	$('#hiking_list').on('click', function(){
		
		$.ajax({
			type : 'GET',
			url : '/product/등산용품',
			dataType : 'json'      
				
		}).done(function(result){
			//console.log(result);
			$('.item').remove();

			for(var r of result){
				var item_el= "<tr class='item text-center'><td>"+r.id+"</td><td>"+r.pname+"</td><td>"+r.price+"</td><td>"+r.orderCount+"</td><td>"+r.type+"</td></tr>";
				$('#title').after(item_el);
			}
		}).fail(function(result){
			console.log('서버오류');
			console.log(result);
		});
	});

	// 사무용품보기
	$('#camping_list').on('click', function(){
				
		$.ajax({
			type : 'GET',
			url : '/product/캠핑용품',
			dataType : 'json'      
				
		}).done(function(result){
			//console.log(result);
			$('.item').remove();

			for(var r of result){
				var item_el= "<tr class='item text-center'><td>"+r.id+"</td><td>"+r.pname+"</td><td>"+r.price+"</td><td>"+r.orderCount+"</td><td>"+r.type+"</td></tr>";
				$('#title').after(item_el);
			}
		}).fail(function(result){
			console.log('서버오류');
			console.log(result);
		});
	});

	// 높은가격순 정렬(전체보기/타입별보기)
	$('#price_list').on('click', function(){
		
		//console.log(data);
		
		if (data == '없음') {	
			$.ajax({
				type : 'GET',
				url : '/product/price',
				dataType : 'json'      
					
			}).done(function(result){
				//console.log(result);
				$('.item').remove();

				for(var r of result){
					var item_el= "<tr class='item text-center'><td>"+r.id+"</td><td>"+r.pname+"</td><td>"+r.price+"</td><td>"+r.orderCount+"</td><td>"+r.type+"</td></tr>";
					$('#title').after(item_el);
				}
			}).fail(function(result){
				console.log('서버오류');
				console.log(result);
			});
		
		} else {			
			$.ajax({
				type : 'GET',
				url : '/product/price/'+data,
				dataType : 'json'      
					
			}).done(function(result){
				//console.log(result);
				$('.item').remove();

				for(var r of result){
					var item_el= "<tr class='item text-center'><td>"+r.id+"</td><td>"+r.pname+"</td><td>"+r.price+"</td><td>"+r.orderCount+"</td><td>"+r.type+"</td></tr>";
					$('#title').after(item_el);
				}
			}).fail(function(result){
				console.log('서버오류');
				console.log(result);
			});
		}
	});

	// 인기판매순 정렬(전체보기/타입별보기)
	$('#order_list').on('click', function(){

		//console.log(data);
		
		if (data == '없음') {	
				
			$.ajax({
				type : 'GET',
				url : '/product/orderCount',
				dataType : 'json'      
					
			}).done(function(result){
				//console.log(result);
				$('.item').remove();
	
				for(var r of result){
					var item_el= "<tr class='item text-center'><td>"+r.id+"</td><td>"+r.pname+"</td><td>"+r.price+"</td><td>"+r.orderCount+"</td><td>"+r.type+"</td></tr>";
					$('#title').after(item_el);
				}
			}).fail(function(result){
				console.log('서버오류');
				console.log(result);
			});
		} else {
			$.ajax({
				type : 'GET',
				url : '/product/orderCount/'+data,
				dataType : 'json'      
					
			}).done(function(result){
				//console.log(result);
				$('.item').remove();
	
				for(var r of result){
					var item_el= "<tr class='item text-center'><td>"+r.id+"</td><td>"+r.pname+"</td><td>"+r.price+"</td><td>"+r.orderCount+"</td><td>"+r.type+"</td></tr>";
					$('#title').after(item_el);
				}
			}).fail(function(result){
				console.log('서버오류');
				console.log(result);
			});
		}		
	});

	
</script>

<%@include file="../include/footer.jsp"%>