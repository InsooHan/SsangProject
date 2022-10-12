<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.AdminboardDto"%>
<%@page import="dao.AdminboardDao"%>
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
<%
String num=request.getParameter("ab_num");

AdminboardDao dao=new AdminboardDao();

AdminboardDto dto=dao.getdata(num);

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");

//아이디
String myid=(String)session.getAttribute("myid");

//로그인상태
String loginok=(String)session.getAttribute("loginok");
%>
<body>
<div><b style="font-size: 1.4em;"><%=dto.getAd_subject()%></b></div>
<hr>
<div style="font-size: 10pt; color: gray;">
<span>관리자</span>
<span><%=sdf.format(dto.getAd_date())%></span>
</div>
<br>
<div>
<img alt="" src="save/<%=dto.getAd_image()%>">
<br>
<%=dto.getAd_content()%>
</div>

	<%
	if(loginok!=null){
		if(myid.equals("admin")){
	%>
	<button type="button" class="btn btn-info" onclick="location.href='adminboard/adminboardupdateform.jsp?ab_num=<%=dto.getAb_num()%>'">수정</button>
	<button type="button" class="btn btn-danger" onclick="location.href='adminboard/adminboardupdateform.jsp?ab_num=<%=dto.getAb_num()%>'">삭제</button>
	<%
		}
	}
	%>
</body>
</html>