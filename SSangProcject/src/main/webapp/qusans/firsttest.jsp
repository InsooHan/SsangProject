<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Hi+Melody&family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">    
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
#editor 
{
	padding: 16px 24px;
	border: 1px solid #D6D6D6;
	border-radius: 4px;
}
</style>
<script type="text/javascript">
$(function() {
	$("#btnck").click(function() {
		var ck=$("#editor").html();
		alert(ck);
		
		$("#realtext").val(ck);
	});
	
});

function readURL(input) {
	if (input.files && input.files[0]) {
           var reader = new FileReader();
           reader.onload = function (e) {
           //var s=$("#editor").text();
           //s+="<img alt='' src='' id='showimg'>";
           $('#showimg').attr('src', e.target.result);
           }
           reader.readAsDataURL(input.files[0]);
       }
}
</script>
</head>
<body>

<form action="firsttesttwo.jsp" method="post" enctype="multipart/form-data">
	<input type="hidden" value="10" name="num">
	<table>
		<tr>
			<td>
				<input type="file" name="photo" class="form-control" onchange="readURL(this)">
			</td>
		</tr>
		<tr>
			<td>
				<div id="editor" contenteditable="true"><img alt="" src="" id="showimg" style="max-width: 200px;"></div>
				<textarea style="width: 700px; height: 300px;" name="content" class="form-control" id="realtext"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				<button type="submit" class="btn btn-success">저장</button>
			</td>
		</tr>
	</table>
</form>

<button type="button" id="btnck">div체크버튼</button>
</body>
</html>