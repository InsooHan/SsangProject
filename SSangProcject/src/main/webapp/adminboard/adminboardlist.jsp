<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.AdminboardDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.AdminboardDao"%>
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
<script type="text/javascript">
$(function() {
	
});

</script>


<%
request.setCharacterEncoding("utf-8");

AdminboardDao dao=new AdminboardDao();

//변수
int totalCount;
int totalPage;
int startPage;
int endPage;
int start;
int perPage=5;
int perBlock=5;
int currentPage;
int no;

totalCount=dao.getTotalCount();

if(request.getParameter("currentPage")==null)
	currentPage=1;
else
	currentPage=Integer.parseInt(request.getParameter("currentPage"));

totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

startPage=(currentPage-1)/perBlock*perBlock+1;
endPage=startPage+perBlock-1;

if(endPage>totalPage)
	endPage=totalPage;

start=(currentPage-1)*perPage;

//검색 내용 추가 필요

List<AdminboardDto> list=dao.getlistsearch(start, perPage, keyword);

no=totalCount-(currentPage-1)*perPage;

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");

%>
<body>

</body>
</html>