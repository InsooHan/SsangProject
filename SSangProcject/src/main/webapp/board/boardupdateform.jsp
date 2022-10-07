<%@page import="dto.BoardDto"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
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
<%

String num=request.getParameter("board_num");
String currentPage=request.getParameter("currentPage");
BoardDao dao=new BoardDao();
BoardDto dto=dao.getData(num);
//System.out.print(dto.getBoard_photo());
%>
<body>
<!-- 이미지 미리보기할 위치 -->
<img alt="" id="showimg" style="position: absolute; left: 800px; top: 100px; max-width: 200px;"
src="<%=(dto.getBoard_photo()==null?"":"save/"+dto.getBoard_photo()) %>">

<form action="board/boardupdateaction.jsp" method="post" enctype="multipart/form-data">
<!-- 수정폼이므로 num 숨기기 -->
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="currentPage" value="<%=currentPage%>">
		
	<table style="width: 600px;">
		<caption>
			<b>글 수정</b>
			<span class="camera" style="cursor: pointer;">사진첨부</span>
			<input type="file" name="photo" id="photo" style="visibility: hidden;" onchange="readURL(this)">
		</caption>
		
		<tr height="100">
			<td>
				<textarea style="width: 500px; height: 100px;" class="form-control" name="content"
				 required="required"><%=dto.getBoard_content() %></textarea>
			</td>
			<td>
				<button type="submit" class="btn btn-default" 
				style="width: 100px; height: 100px">수정</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>