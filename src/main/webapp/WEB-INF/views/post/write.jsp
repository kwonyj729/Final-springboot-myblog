<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/nav.jsp"%>

<div class="container">
	<div class="rows">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<form>
				<div class="form-group">
					<label for="title">제목</label> <input type="text" class="form-control" placeholder="Enter Title" id="title">
				</div>
				<div class="form-group">
					<label for="content"></label>
					<!-- <textarea class="form-control" rows="5" id="content"></textarea> -->
					<textarea class="form-control" rows="20" id="summernote" cols="5"></textarea>
					<!-- <textarea name="content" id="summernote" class="form-control" rows="15" cols="5"></textarea> -->
				</div>
			</form>
			<button id="write--submit" class="btn btn-info">등록</button>

		</div>
		<div class="col-sm-1"></div>
	</div>
</div>


<script>
	$('#summernote').summernote({
		placeholder : 'Post Page',
		tabsize : 2,
		height : 300
	});
</script>

<script>
	$('#write--submit').on('click', function() {
		var data = {
			title : $('#title').val(),
			content : $('#summernote').val()
		}

		$.ajax({
			type : 'POST',
			url : '/post/write',
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			dataType : 'json'
		}).done(function(r) {
			if (r.statusCode == 200) {
				alert('글쓰기 성공');
				location.href = '/';
			} else {
				alert('글쓰기 실패');
			}
		}).fail(function(r) {
			alert('글쓰기 실패');
		});
	});
</script>


<%@include file="../include/footer.jsp"%>











