<%@page import="dao.AdminboardDao"%>
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
</head>
<body>
<%
String num=request.getParameter("ab_num");

AdminboardDao dao=new AdminboardDao();

dao.deleteAdminBoard(num);

response.sendRedirect("../index.jsp?main=adminboard/adminboardlist.jsp");
%>
</body>
</html>