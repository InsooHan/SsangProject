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
<img alt="" src="" id="showimg" style="position: absolute; left: 950px; top: 150px; max-width: 200px;">
<form action="board/boardaddaction.jsp" method="post" enctype="multipart/form-data">
	<table style="width: 800px;margin-top: 40px;"  >
		<div align="left">
		<span style="font-size:40px;"></span>
		</div>
		<caption>
			
			<span class="camera" style="cursor: pointer;" ><i class="fa-solid fa-camera">사진 추가</i></span>
			<input type="file" name="photo" id="photo" style="visibility: hidden;" onchange="readURL(this)">
		</caption>
		
		<tr style="">
			<td>
			<div style="display:flex">
				<textarea style="width: 800px; height: 200px; border:1px solid black; " placeholder="작성하고싶은 글을 입력하세요" class="form-control" name="content"
				 required="required"></textarea>
			
				<button type="submit" class="btn btn-default" 
				style="width: 100px; border:1px solid black; height: 200px; background-color:black; color:white; " >글 등록</button>
			</div>
			</td>
		</tr>
	</table>
</form>
</body>
</html>