<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>index</title>
<style type="text/css">
	div.layout {
		position: absolute;
	}
	
	div.top {
		width: 100%;
		height: 40px;
		line-height: 40px;
		font-size: 14px;
		text-align: center;
		top: 20px;
	}

	div.menu {
		width: 100%;
		height: 30px;
		line-height: 30px;
		top: 50px;
	}
	
	div.main {
		width: 100%;
		left: 0px;
		top: 150px;
	}
	
	a, a:hover {
		color: black;
		text-decoration: none;
	}
</style>
</head>
<%
	String mainPage = "layout/main.jsp";

	//url을 통해서 main값을 읽어서 메인페이지에 출력한다
	if(request.getParameter("main")!=null) {
		mainPage = request.getParameter("main");
	}
%>
<body>
	<div class="layout top">
		<jsp:include page="layout/top.jsp"/>
	</div>
	<div class="layout menu">
		<jsp:include page="layout/menu.jsp"/>
	</div>
	<div class="layout main">
		<jsp:include page="<%=mainPage %>"/>
	</div>
</body>
</html>