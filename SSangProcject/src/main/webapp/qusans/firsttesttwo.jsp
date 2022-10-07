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
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Hi+Melody&family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">    
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<%

QusAnsAnswerDto dto=new QusAnsAnswerDto();

String myid=(String)session.getAttribute("myid");

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
dto.setImage("임의이미지");
dto.setQue_num("1");

dao.insertAnswer(dto);

//response.sendRedirect("qusansdetail.jsp?que_num="+num);
response.sendRedirect("../index.jsp?main=qusans/qusanslist.jsp");
}catch(Exception e){
	//왜 여기로오지???????
	//response.sendRedirect("qusanslist.jsp");
	System.out.print(e+"예외발생");
	
};

//response.sendRedirect("qusanslist.jsp");
%>
</body>
</html>