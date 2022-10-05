<%@page import="dto.MemberDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.MemberDao"%>
<%@page import="dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.BoardDao"%>
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
//로그인 상태 확인후 로그인중에만 입력폼 보여주기
String loginok=(String)session.getAttribute("loginok");

BoardDao dao=new BoardDao();
//페이징 필요변수
int totalCount;
int totalPage;//총페이지
int startPage;//각블럭시작페이지
int endPage;//끝페이지
int start;//시작번호
int perPage=5;//한페이지에 보여질 글 갯수
int perBlock=5;// 한 블럭당 보여지는 페이지개수
int currentPage;//현재페이지
int no;

totalCount=dao.getTotalCount();

//현재 페이지 번호 읽기 null이면 1페이지
if(request.getParameter("currentPage")==null)
	currentPage=1;
else
	currentPage=Integer.parseInt(request.getParameter("currentPage"));
//총페이지 갯수 구하기
totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

startPage=(currentPage-1)/perBlock*perBlock+1;
endPage=startPage+perBlock-1;

if(endPage>totalPage)
	endPage=totalPage;

start=(currentPage-1)*perPage;

List<BoardDto> list=dao.getlist(start, perPage);

no=totalCount-(currentPage-1)*perPage;

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");

%>
<body>
<%
if(loginok!=null){
	%>
	<jsp:include page="boardaddform.jsp"/>
	<hr align="left" width="700">
	<%}

%>
<div>
<b><%=totalCount %>개의 글이 있습니다 </b>
<%
MemberDao mdao=new MemberDao();
for(BoardDto dto:list)
{
	String name=mdao.getName(dto.getBoard_id());
	
	%>
	<table class="table" style="width: 600px;">
		<tr>
			<td>
				<b><%=name%></b>
				<%
				//로그인한 아이디
				String myid=(String)session.getAttribute("myid");
		
				//로그인한 아이디와 글을 쓴 아이디가 같을 경우에만 수정, 삭제가 보이도록
				if(loginok!=null && dto.getBoard_id().equals(myid))
				{%>
					
					<a href="" style="color: black;">수정</a>
					<a href="" style="color: black;">삭제</a>
					
				<%
				}
				%>
				  <span class="day"><%=sdf.format(dto.getReg_date())%></span>
			</td>
		</tr>

	</table> 	
<%
}
%>
</div>
</body>
</html>