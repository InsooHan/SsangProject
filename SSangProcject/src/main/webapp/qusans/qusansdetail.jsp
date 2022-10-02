<%@page import="dto.QusAnsAnswerDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.QusAnsAnswerDao"%>
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
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://kit.fontawesome.com/a47cf79e39.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function() {

var currentPosition = parseInt($(".quickmenu").css("top"));

$(window).scroll(function() {
	var position = $(window).scrollTop(); 
	$(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
});

});
</script>
</head>
<%
String num=request.getParameter("que_num");

QusAnsDao dao=new QusAnsDao();

QusAnsDto dto=dao.getdata(num);

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");

//System.out.print("시스템아웃프린트");

QusAnsAnswerDao adao=new QusAnsAnswerDao();

List<QusAnsAnswerDto> list=adao.getAllDatas();
%>
<body>
<!-- 질문글 -->
<table class="table table-borderless" style="width: 800px;">
	<tr>
		<th>
			<i class="fa-solid fa-q fa-2x" style="color: #78EFAD;"></i>
			<b style="font-size: 1.8em;"><%=dto.getQue_subject()%></b>
		</th>
	</tr>
	<tr style="border-bottom: solid 2px #dcdcdc;">
		<td style="font-size: 10pt; color: gray;"><b><%=dto.getQue_id()%></b>&nbsp;<%=sdf.format(dto.getQue_date())%></td>
	</tr>
	<tr>
		<td>
			<div style="height: 540px;">
				<%=dto.getQue_content()%>
	        </div>
		</td>
	</tr>
</table>

<!-- 답변 list -->
<table class="table table-borderless" style="width: 800px;">
<%

for(int i=0;i<list.size();i++)
{
	QusAnsAnswerDto adto=list.get(i);
	
	if(adto.getQue_num().equals(num))
	{
	%>
	<tr style="border-bottom: solid 2px #dcdcdc;">
		<td><b><%=adto.getAns_id()%></b>&nbsp;<span style="font-size: 10pt; color: gray;"><%=adto.getReg_date()%></span></td>
	</tr>
	<tr>
		<td><%=adto.getAns_content()%></td>
	</tr>
	<tr>
		<td>댓글</td>
	</tr>
<%
	}
}
%>
</table>

<!-- 답변 insert form -->
<form action="answerinsert.jsp" method="post" enctype="multipart/form-data">
	<input type="hidden" value="<%=num%>" name="num">
	<table>
		<tr>
			<td>
				<i class="fa-regular fa-file"></i>
				<input type="file" name="photo" class="form-control">
			</td>
		</tr>
		<tr>
			<td>
				<textarea style="width: 700px; height: 300px;" name="content" class="form-control"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				<button type="submit" class="btn btn-success">저장</button>
			</td>
		</tr>
	</table>
</form>

<!-- 퀵메뉴 -->
<div class="quickmenu">
  <ul class="list-group" style="width: 100px;">
    <li class="list-group-item"><a href="#">미해결</a></li>
    <li class="list-group-item"><a href="#">1:1문의</a></li>
    <li class="list-group-item"><a href="#">후기</a></li>
  </ul>
</div>
</body>
</html>