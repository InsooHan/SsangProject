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
String comm_num = request.getParameter("bnum");
%>
<form action="community/communityDeleteAction.jsp" method="post">
	 <li class="list-group-item" style="width:200px;">

	 <span class="title"> 글삭제 </span><br>
		 <span class="description"> 해당 글을 삭제 하시겠습니까 </span>
</li>

	<tr>
	<th>
	<input type="hidden" name="comm_num" value="<%=comm_num %>">
	<br><br>
	<div class="infd-modal-bottom center"></div>
	<button class="infd-button is-basic-white is-p-16 e-cancel">취소</button>
	<button class="infd-button is-primary-500 is-p-16 e-confirm">확인</button>	
	</th>
	</tr>
	</table>
	
</form>
</body>
</html>