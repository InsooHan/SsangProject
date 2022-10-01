<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.QusAnsDto"%>
<%@page import="dao.QusAnsDao"%>
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
String num=request.getParameter("que_num");

QusAnsDao dao=new QusAnsDao();

QusAnsDto dto=dao.getdata(num);

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
<body>
<!-- 질문글 -->
<table class="table">
	<tr>
		<th><%=dto.getQue_subject()%></th>
	</tr>
	<tr>
		<td><%=dto.getQue_id()%>&nbsp;<%=sdf.format(dto.getQue_date())%></td>
	</tr>
	<tr>
		<td><%=dto.getQue_content()%></td>
	</tr>
</table>

<!-- 답변 insert form -->
<form action="answerinsert.jsp" method="post" enctype="multipart/form-data">
	<input type="hidden" value="<%=num%>" name="num">
	<table>
		<tr>
			<td>
				<input type="text" name="title">
			</td>
		</tr>
		<tr>
			<td>
				<input type="file" name="photo">
			</td>
		</tr>
		<tr>
			<td>
				<textarea style="width: 500px; height: 200px;" name="content"></textarea>
			</td>
		</tr>
		<tr>
			<button type="submit" class="btn btn-success">저장</button>
		</tr>
	</table>
</form>
</body>
</html>