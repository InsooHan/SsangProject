<%@page import="dao.QusAnsAnswerDao"%>
<%@page import="dto.QusAnsAnswerDto"%>
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
String content=request.getParameter("content");
String id=request.getParameter("id");

QusAnsAnswerDto dto=new QusAnsAnswerDto();

dto.setAns_id(id);
dto.setAns_content(content);
dto.setImage("이미지");
dto.setQue_num(num);

QusAnsAnswerDao dao=new QusAnsAnswerDao();

dao.insertAnswer(dto);

response.sendRedirect("qusanslist.jsp");

%>
</body>
</html>