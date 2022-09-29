<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.QusAnsDto"%>
<%@page import="java.util.List"%>
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
//로그인 상태 확인 후 입력폼 나타내기
String loginok=(String)session.getAttribute("loginok");

QusAnsDao dao=new QusAnsDao();

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

List<QusAnsDto> list=dao.getlist(start, perPage);

no=totalCount-(currentPage-1)*perPage;

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");

%>
<body>
<!-- list /////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<%
for(QusAnsDto dto:list)
{%>
	
	<table class="table" style="width: 600px;">
		<tr>
			<td><b>작성자 : <%=dto.getQue_subject()%></b></td>
		</tr>
		
		<tr>
			<td colspan="1">
				<%=dto.getQue_content().replace("\n", "<br>")%>
			</td>
		</tr>
		
		<tr>
			<td>
				<button class="btn chu" id="chu" num=<%=dto.getQue_chu()%>>추천</button>
			</td>
		</tr>
	</table>
	
<%
}
%>

<!-- 페이징 처리 -->
<div style="width: 800px;" class="container" id="page">
	<ul class="pagination">
		<%
		
		//이전
		if(startPage>1)
		{%>
			<li>
				<a href="index.jsp?main=qusans/qusanslist.jsp?currentPage=<%=startPage-1%>">이전</a>
			</li>
		<%}
		for(int pp=startPage;pp<=endPage;pp++)
		{
			if(pp==currentPage)
			{%>
				<li class="active">
					<a href="index.jsp?main=qusans/qusanslist.jsp?currentPage=<%=pp%>"><%=pp%></a>
				</li>
			<%}else{%>
				<li>
					<a href="index.jsp?main=qusans/qusanslist.jsp?currentPage=<%=pp%>"><%=pp%></a>
				</li>
			<%}
		}
		
		//다음
		if(endPage<totalPage)
		{%>
			<li>
				<a href="index.jsp?main=qusans/qusanslist.jsp?currentPage=<%=endPage+1%>">다음</a>
			</li>
		<%}
		%>
	</ul>
</div>

</body>
</html>