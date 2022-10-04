<%@page import="dto.QusAnsAnswerDto"%>
<%@page import="dao.QusAnsAnswerDao"%>
<%@page import="dto.Dto"%>
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
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://kit.fontawesome.com/a47cf79e39.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style type="text/css">
#listlink
{
float: left;
}
#alltablecontent
{
margin-top: 70px;
width: 800px;
}
</style>
</style>
<script type="text/javascript">
$(function() {
	//검색버튼
	$("#btnsearch").click(function(){
		//search($("#searchtool").val().trim());
		//trim()은 공백 제거 후 보내기
	});
	
	$("#btnwrite").click(function() {
		//alert("글쓰기입니다!");
		<%
		
		//로그인 상태 확인 위한 session의 속성 가져오기
		String loginok=(String)session.getAttribute("loginok");
		
		if(loginok!=null)
		{%>
			location.href="index.jsp?main=qusans/qusansinsertform.jsp";
		<%}else{
			%>
			alert("먼저 로그인을 해주세요!");
			location.href="index.jsp?main=login/loginform.jsp";
		<%}
		%>
	});
});
</script>
</head>
<%
request.setCharacterEncoding("utf-8");

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

//검색 내용 추가 필요
String searchtool=request.getParameter("searchtool");

List<QusAnsDto> list=dao.getlistsearch(start, perPage, searchtool);

no=totalCount-(currentPage-1)*perPage;

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");

//System.out.println(searchtool);
//onclick="location.href='index.jsp?main=qusans/qusanslistsearch.jsp'"
%>
<body>
<!-- list -->

<form action="qusans/qusansinsertformaction.jsp" method="post">
<div class="form-inline">
	<svg width="16" width="16" height="16" viewBox="0 0 16 16"  xmlns="http://www.w3.org/2000/svg"><path fill="#212529" fill-rule="evenodd" clip-rule="evenodd" d="M11.5 7c0 .59-.116 1.176-.343 1.722-.226.546-.557 1.042-.975 1.46-.418.418-.914.75-1.46.975-.546.226-1.131.343-1.722.343-.59 0-1.176-.117-1.722-.343-.546-.226-1.042-.557-1.46-.975-.418-.418-.75-.914-.975-1.46C2.616 8.176 2.5 7.591 2.5 7c0-1.194.474-2.338 1.318-3.182C4.662 2.974 5.807 2.5 7 2.5c1.193 0 2.338.474 3.182 1.318C11.026 4.662 11.5 5.806 11.5 7zm-.82 4.74c-1.206.936-2.723 1.377-4.242 1.234-1.52-.143-2.928-.86-3.937-2.005C1.49 9.825.956 8.34 1.004 6.813c.047-1.526.675-2.976 1.754-4.055 1.08-1.08 2.53-1.707 4.055-1.755 1.525-.047 3.012.488 4.156 1.498 1.145 1.01 1.862 2.417 2.005 3.937.143 1.52-.298 3.036-1.234 4.242l3.04 3.04c.074.069.133.151.174.243.04.092.063.192.065.292.001.101-.017.201-.055.294-.038.094-.094.179-.165.25-.071.071-.156.127-.25.165-.093.038-.193.056-.293.054-.101-.001-.2-.023-.293-.064-.091-.041-.174-.1-.243-.174l-3.04-3.04z" /></svg>
	<input type="text" class="" style="width: 300px;" id="searchtool" name="searchtool" placeholder="궁금한 질문을 검색해보세요!">
	<button type="submit" class="btn btn-success" id="btnsearch">검색</button>
</div>
</form>
<div class="container mt-3" id="listlink">
  <ul class="nav">
    <li class="nav-item">
      <a class="nav-link" href="#" style="color: black; font-weight: bold;"><i class="fa-solid fa-chevron-down fa-2xs" style="color: #78EFAD"></i>&nbsp;최신순</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#" style="color: black; font-weight: bold;"><i class="fa-solid fa-chevron-down fa-2xs" style="color: #78EFAD"></i>&nbsp;좋아요순</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#" style="color: black; font-weight: bold;"><i class="fa-solid fa-chevron-down fa-2xs" style="color: #78EFAD"></i>&nbsp;답변많은순</a>
    </li>
    <li class="nav-item" style="margin-left: 300px;">
	    <button type="button" class="btn btn-dark" id="btnwrite">
		<i class="fa-solid fa-pencil"></i>
		글쓰기
		</button>
    </li>
  </ul>
</div>
<div id="alltablecontent">
<%
QusAnsAnswerDao adao=new QusAnsAnswerDao();
List<QusAnsAnswerDto> alist=adao.getAllDatas();
for(QusAnsDto dto:list)
{%>
<div class="tablecontent" onclick="location.href='index.jsp?main=qusans/qusansdetail.jsp?que_num=<%=dto.getQue_num()%>'">
	<div>
		<b style="font-size: 1.2em;"><%=dto.getQue_subject()%></b>
		<span style="float: right; border: 1px solid gray; border-radius: 100px; 
		width: 70px; height: 70px; margin-top: 30px; line-height: 70px; text-align: center;">
			<b>
			<%
			int a=0;
			for(QusAnsAnswerDto adto:alist)
			{
				if(dto.getQue_num().equals(adto.getQue_num()))
				{
					a++;
				}
			}
			%>
			<%=a%>
			</b>
			<span>
			답변
			</span>
		</span>
	</div>
	<div style="margin-top: 10px; min-height: 70px;">
		<span><%=dto.getQue_content().replace("\n", "<br>")%></span>
	</div>
	<div style="font-size: 10pt; color: gray; margin-top: 10px;">
	<%=dto.getQue_id()%>&nbsp;<%=sdf.format(dto.getQue_date())%>
	<span style="float: right;"><i class="fa-solid fa-heart"></i>&nbsp;<%=dto.getQue_chu()%></span>
	</div>
</div>
<%
}
%>
</div>
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

<script type="text/javascript">
//마우스를 리스트에 가져가면 리스트의 배경색이 변하고 마우스 포인터가 변하는 스크립트
$(".tablecontent").hover(function() {
	$(this).css("background-color","#F9FFFF");
	$(this).css("cursor","pointer");
}, function() {
	$(this).css("background-color","white");
});


//리스트를 클릭하면 디테일 페이지로 넘어가도록 하는 스크립트
$(".tablecontent").click(function() {
	//location.href="qusansdetail.jsp?que_num=";
});

</script>
</body>
</html>