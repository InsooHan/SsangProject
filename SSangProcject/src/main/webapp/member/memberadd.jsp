<%@page import="dao.MemberDao"%>
<%@page import="dto.MemberDto"%>
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
<title>insertmember</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String user_id = request.getParameter("user_id");
	String user_pass = request.getParameter("user_pass");
	String user_name = request.getParameter("user_name");
	String user_phone = request.getParameter("user_phone");
	
	MemberDto dto = new MemberDto();
	dto.setUser_id(user_id);
	dto.setUser_pass(user_pass);
	dto.setUser_name(user_name);
	dto.setUser_phone(user_phone);
	
	MemberDao dao = new MemberDao();
	dao.insertMember(dto);
	
	response.sendRedirect("../index.jsp?main=member/gaipsuccess.jsp?user_id="+user_id);
%>
</body>
</html>