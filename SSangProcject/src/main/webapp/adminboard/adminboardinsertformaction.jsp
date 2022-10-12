<%@page import="dto.AdminboardDto"%>
<%@page import="dao.AdminboardDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
<script src="https://kit.fontawesome.com/a47cf79e39.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
<%
String realpath=getServletContext().getRealPath("/save");

int uploadsize=1024*1024*5;

AdminboardDao dao=new AdminboardDao();

//System.out.print(realpath);

try
{
MultipartRequest multi=new MultipartRequest(request,realpath,uploadsize,"utf-8",new DefaultFileRenamePolicy());

//String writer=multi.getParameter("writer");
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");

String mainphoto=multi.getFilesystemName("mainphoto");

AdminboardDto dto=new AdminboardDto();

dto.setAd_id("admin");
dto.setAd_subject(subject);
dto.setAd_content(content);
dto.setAd_image(mainphoto);

dao.insertAdminboard(dto);

//response.sendRedirect("../index.jsp?main=smart/smartlist.jsp");

}catch(Exception e){
	
};

%>
</body>
</html>