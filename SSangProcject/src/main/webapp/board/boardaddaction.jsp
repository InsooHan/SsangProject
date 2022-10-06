<%@page import="dao.BoardDao"%>
<%@page import="dto.BoardDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
String board_id=(String)session.getAttribute("myid");

String realPath=getServletContext().getRealPath("/save");
System.out.println(realPath);

int uploadSize=1024*1024*4;//4mb

MultipartRequest multi=null;
try{
multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());

//request가 아닌 멀티로 폼데이타 읽어와야함
String board_content=multi.getParameter("content");
String board_photo=multi.getFilesystemName("photo");

//dto저장
BoardDto dto=new BoardDto();
dto.setBoard_id(board_id);
dto.setBoard_content(board_content);
dto.setBoard_photo(board_photo);
//dao
BoardDao dao=new BoardDao();
dao.InsertBoard(dto);

//System.out.print(realPath);

response.sendRedirect("../index.jsp?main=board/boardguestlist.jsp");

}catch(Exception e){
	System.out.println("업로드 오류:"+ e.getMessage());
};
%>
</body>
</html>