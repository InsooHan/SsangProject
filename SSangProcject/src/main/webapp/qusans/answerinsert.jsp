<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dao.QusAnsAnswerDao"%>
<%@page import="dto.QusAnsAnswerDto"%>
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
<%

QusAnsAnswerDto dto=new QusAnsAnswerDto();

//String myid=(String)session.getAttribute("myid");

String realpath=getServletContext().getRealPath("/save");

int uploadsize=1024*1024*5;

QusAnsAnswerDao dao=new QusAnsAnswerDao();


try
{
MultipartRequest multi=new MultipartRequest(request,realpath,uploadsize,"utf-8",new DefaultFileRenamePolicy());


String num=multi.getParameter("num");
String content=multi.getParameter("content");
String photoname=multi.getFilesystemName("photo");


dto.setAns_id("임의아이디");
dto.setAns_content(content);
dto.setImage(photoname);
dto.setQue_num(num);

dao.insertAnswer(dto);

//response.sendRedirect("qusansdetail.jsp?que_num="+num);
response.sendRedirect("qusanslist.jsp");
}catch(Exception e){
	//왜 여기로오지???????
	//response.sendRedirect("qusanslist.jsp");
	System.out.print(e+"예외발생");
	
};

//response.sendRedirect("qusanslist.jsp");
%>
<body>
</body>
</html>