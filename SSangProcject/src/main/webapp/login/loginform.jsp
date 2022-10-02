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
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>loginForm</title>
</head>
<%
	//세션값 얻기
	String saveok = (String)session.getAttribute("saveok");

	String myid = "";
	if(saveok!=null) {
		myid = (String)session.getAttribute("myid");
	}
%>
<body>
	<br><br>
	<div style="padding-left: 660px;">
	  <h3 style="padding-left: 110px;"><b>로그인</b></h3><br>
		<form action="login/loginaction.jsp" method="post" class="form-inline"><br><br><br>
			<table class="table table-borderless" style="width: 300px;">
				<tr>
					<td colspan="2" align="right" style="padding-right: 44px;">
						<input type="checkbox" name="cbsave" <%=saveok==null?"":"checked" %>>&nbsp;아이디저장
					</td>
				</tr>
				<tr>
					<th colspan="2" style="padding-left: 52px;">아이디</th>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="text" name="user_id" class="form-control" style="width: 220px;" autofocus="autofocus" 
								required="required" value="<%=myid%>">
					</td>
				</tr>
				<tr>
					<th colspan="2" style="padding-left: 52px;">비밀번호</th>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="password" name="user_pass" class="form-control" style="width: 220px;" required="required">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<br><br>
						<button type="submit" class="btn btn-success" style="width: 220px; height: 50px;">로그인</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>