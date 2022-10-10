<%@page import="dao.BoardAnswerDao"%>
<%@page import="dto.BoardAnswerDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://kit.fontawesome.com/4ea0bf99ed.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

BoardAnswerDto dto=new BoardAnswerDto();
dto.setNum(request.getParameter("num"));
dto.setBoard_id(request.getParameter("myid"));
dto.setBoard_content(request.getParameter("content"));

String currentPage=request.getParameter("currentPage");

BoardAnswerDao dao=new BoardAnswerDao();

dao.insertAnswer(dto);

response.sendRedirect("../index.jsp?main=board/boardlist.jsp?currentPage="+currentPage);
%>
</body>
</html>