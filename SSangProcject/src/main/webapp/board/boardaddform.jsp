<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://kit.fontawesome.com/4ea0bf99ed.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	
	$(function() {
		//연필 이미지 누르면 file 강제 호출
		$("span.camera").click(function() {
			$("#photo").trigger("click");
		});
	});

	//이미지 미리보기 함수
	function readURL(input) {
		if (input.files && input.files[0]) {
	           var reader = new FileReader();
	           reader.onload = function (e) {
	           $('#showimg').attr('src', e.target.result);
	           }
	           reader.readAsDataURL(input.files[0]);
	       }
	}
</script>
<title>Insert title here</title>
</head>
<body>
<!-- 이미지 미리보기할 위치 -->
<img alt="" src="" id="showimg" style="position: absolute; left: 800px; top: 100px; max-width: 200px;">
<form action="board/boardaddaction.jsp" method="post" enctype="multipart/form-data">
	<table style="width: 600px;">
		<caption>
			<b>자유 게시판 등록</b>
			<span class="camera" style="cursor: pointer;"><i class="fa-solid fa-camera">사진</i></span>
			<input type="file" name="photo" id="photo" style="visibility: hidden;" onchange="readURL(this)">
		</caption>
		
		<tr height="100">
			<td>
				<textarea style="width: 500px; height: 100px;" class="form-control" name="content"
				 required="required"></textarea>
			</td>
			<td>
				<button type="submit" class="btn btn-default" 
				style="width: 100px; height: 100px">글 등록</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>