<%@page import="dao.ClassDao"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/4f8084f592.js" crossorigin="anonymous"></script>
<title>top</title>
<style type="text/css">
	div.cart {
		float: left;
		cursor: pointer;
	}
	
	div.cart .carticon {
		cursor: pointer;
		color: green;
		width: 30px;
		padding-left: 13px;
	}
	
	div.count {
		width: 24px;
		height: 24px;
		line-height: 24px;
		float: right;
		text-align: center;
		font-size: 0.5em;
		font-weight: bold;
		color: white;
		background-color: #198754;
		border-radius: 100px;
		position: relative;
		top: -9px;
		left: -8px;
		z-index: 10;
	}

	i.search {
		cursor: pointer;
		font-size: 20px;
		padding-top: 5px;
		padding-right: 20px;
	}
	
	i.user {
		cursor: pointer;
		color: black;
		font-size: 23px;
		padding-right: 16px;
	}
	
	i.cart {
		cursor: pointer;
		color: black;
		font-size: 23px;
	}
	
	i.cart:hover, i.user:hover {
		color: green;
	}
	
	button.login {
		height: 35px;
		margin-right: 10px;
		border: 1px solid gray;
	}
	
	button.join, button.logout {
		height: 35px;
	}
</style>
</head>
<body>
	<div style="float: right; margin-right: 150px;">
		<form class="d-flex form">
			<input class="form-control me-2" type="text" placeholder="Search" style="width: 200px; height: 25px;">&nbsp;
			<i class="fa fa-search search" aria-hidden="true"></i>
		
<%
	String loginok = (String)session.getAttribute("loginok");
	String myid = (String)session.getAttribute("myid");

	MemberDao dao = new MemberDao();
	String name = dao.getName(myid);
	
	ClassDao cdao=new ClassDao();
	int cartSize=cdao.getCartList(myid).size();

	//로그아웃 상태
	if (loginok == null) {
	%>
		<button type="button" class="btn btn-outline-secondary login"
				onclick="location.href='index.jsp?main=login/loginform.jsp'">로그인</button>
		<button type="button" class="btn btn-success join"
				onclick="location.href='index.jsp?main=member/memberform.jsp'">회원가입</button>
	<%
	} else {
	%>
		<div class="cart">
			<a href="index.jsp?main=class/cartlist.jsp"><i class="fa fa-shopping-cart cart" aria-hidden="true"></i></a>	
			<div class="count" onclick="location.href='index.jsp?main=class/cartlist.jsp'"><%=cartSize %></div>	
		</div>
		<a href="index.jsp?main=class/mypage.jsp"><i class="fa fa-user-o user" aria-hidden="true"></i></a>
		<button type="button" class="btn btn-secondary logout" style="width: 90px;"
				onclick="location.href='login/logoutaction.jsp'">로그아웃</button>
	<%
	}
%>
		</form>
	</div>
</body>
</html>