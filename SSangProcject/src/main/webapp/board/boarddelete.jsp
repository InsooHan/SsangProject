<%@page import="java.io.File"%>
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
</head>
<body>
<%
//db삭제 뿐 아니라 업로드된 save안에 파일도 삭제해야 함
String num=request.getParameter("board_num");
String currentPage=request.getParameter("currentPage");

//db로부터 저장된 이미지명 얻기
BoardDao dao=new BoardDao();
String board_photo=dao.getData(num).getBoard_photo();

//db삭제
dao.deleteBoard(num);

//프로젝트 실제 경로
String realPath=getServletContext().getRealPath("/save");

//파일 객체 생성
File file=new File(realPath+"\\"+board_photo);

//파일 삭제
file.delete();

//보던 페이지로 이동
response.sendRedirect("../index.jsp?main=board/boardlist.jsp?currentPage="+currentPage);

%>
</body>
</html>