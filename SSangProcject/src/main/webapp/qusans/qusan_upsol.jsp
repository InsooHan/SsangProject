<%@page import="dao.QuestionDao"%>
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
String num=request.getParameter("num");
//System.out.print(num);
QuestionDao dao=new QuestionDao();

dao.upsol(num);

response.sendRedirect("../index.jsp?main=qusans/qusan_listdetail.jsp?num="+num);
%>
</body>
</html>