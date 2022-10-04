<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Hi+Melody&family=Titillium+Web:wght@200&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
String comm_num = request.getParameter("comm_num");
%>
<form action="community/communityDeleteAction.jsp" method="post">
	<table class="table table-bordered" style="width:200px;">
	<caption><b>해당 글을 삭제하시겠습니까?</b></caption>
	<tr>
	<th>
	<input type="hidden" name=comm_num value="<%=comm_num %>">
	<br><br>
	<button type="submit" class="">취소</button>
	<button type="button" onclick="history.back()"
	class="">확인</button>	
	</th>
	</tr>
	</table>
	
</form>
</body>
</html>