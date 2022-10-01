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
String title=multi.getParameter("title");
String content=multi.getParameter("content");

String photoname=multi.getFilesystemName("photo");


dto.setAns_id("임의아이디");
dto.setAns_content(content);
dto.setImage(photoname);
dto.setQue_num(num);

dao.insertAnswer(dto);

response.sendRedirect("");

}catch(Exception e){
	
};
%>
<body>

</body>
</html>