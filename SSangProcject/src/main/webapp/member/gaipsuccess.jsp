<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/4f8084f592.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>gaipSuccess</title>
<style type="text/css">
	h2 {
		margin-left: 720px;
	}

	button.home {
		margin-left: 780px;
	}
</style>
</head>
<body>
<%
	String id = request.getParameter("user_id");

	MemberDao dao = new MemberDao();
	String name = dao.getName(id);
%>
		<img src="image/welcome.png" style="width: 900px; margin-left: 420px;">
	<div>
		<br><h2><b><%=name %>님 환영합니다!</b></h2>
		<br><br>
		<button type="button" class="btn btn-warning home" onclick="location.href='index.jsp?'">
			<b>홈 화면으로 가기&nbsp;<i class="fa fa-window-restore" aria-hidden="true"></i></b>
		</button>
	</div>
</body>
</html>