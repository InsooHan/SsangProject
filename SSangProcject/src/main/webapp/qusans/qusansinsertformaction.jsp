<%@page import="java.net.URLEncoder"%>
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
//insertform이랑 관련 없고 검색기능 위해 있는 것인데 이름을 잘못 지었음
request.setCharacterEncoding("utf-8");

String searchtool=request.getParameter("searchtool");
//System.out.print(searchtool);
response.sendRedirect("../index.jsp?main=qusans/qusanslistsearch.jsp?searchtool="+URLEncoder.encode(searchtool, "UTF-8"));
%>
</body>
</html>