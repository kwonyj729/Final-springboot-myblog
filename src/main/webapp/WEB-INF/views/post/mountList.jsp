<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/nav.jsp"%>

<div class="container">
	<div class="text-center">
		<br />
		<h1>Korean Mountain Information</h1>
		<br /><br />
	</div>

	<div class="row">
		<div class="col-sm-4">
		<div class="text-center text-primary">국내 지역 </div>
			<table class="table table-bordered">
				<thead>					
					<tr id="region_title" class="text-center">
						<th>번호</th>
						<th>지역명</th>
						<th>도시</th>
						<th></th>
					</tr>
				</thead>
				<c:forEach var="region" items="${regions}">
					<tbody>
						<tr class="region_item text-center">
							<td>${region.id}</td>
							<td>${region.regName}</td>
							<td>${region.city}</td>
							<td><button type="button" abc1="${region.id}" class="region btn btn-sm btn-outline-primary ">show</button></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>


		<div class="col-sm-4">
		<div class="text-center text-primary">지역별 산 목록</div>
			<table class="table table-bordered">
				<thead>
					<tr id="mountain_title" class="text-center">
						<th>산 번호</th>
						<th>산 이름</th>
						<th>상세정보</th>
					</tr>
				</thead>
			</table>
		</div>

		<div class="col-sm-4">
		<div class="text-center text-primary">산 상세정보</div>
			<table class="table table-bordered">
				<tr id="detail_title"></tr>


			</table>
		</div>
	</div>
</div>




<script>
	
let data1="";
let data2="";
	
//지역별 산 리스트 보기.
$('.region').on('click', function(event){
	data1 = event.target.attributes.abc1.value;
// 	console.log("지역번호 : "+data1);

	$.ajax({	
		type : 'GET',
		url : '/post/mountList/'+data1,
		dataType : 'json'     
			
	}).done(function(result){
		$('.mountain_item').remove();
		$('.detail_item').remove();
		
		for(var r of result){
			var item_el = 
			"<tr class='mountain_item text-center'><td>"+r.id+
			"</td><td>"+r.mname+
			"</td><td><button onclick='mountain_choice("+r.id+")' type='button' abc2='"+r.id+"' class='btn btn-outline-warning btn-sm'>show</button></td></tr>";
	
			$('#mountain_title').after(item_el);
		}
	}).fail(function(result){
		console.log('서버오류');
	});
});

//산 상세정보 보기.
function mountain_choice(r_id) {
	let data2 = r_id;
//  	console.log("산 번호 : "+data2);
	
	$.ajax({
		type : 'GET',
		url : '/post/mountain/'+data2,
		dataType : 'json'      
			
	}).done(function(r){
		$('.detail_item').remove();
				
			var item_el= "<tr class='detail_item'><td>산번호 : "+r.id+
			"</td></tr><tr class='detail_item'><td>산이름 : "+r.mname+
			"</td></tr><tr class='detail_item'><td>높이 : "+r.height+
			"m</td></tr><tr class='detail_item'><td>지역번호 : "+r.regionId+
			"</td></tr>";

			$('#detail_title').after(item_el);
	}).fail(function(result){
		console.log('서버오류');
		console.log(result);
	});
}


</script>

<%@include file="../include/footer.jsp"%>