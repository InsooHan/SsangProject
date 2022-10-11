<%@page import="dto.BoardAnswerDto"%>
<%@page import="dao.BoardAnswerDao"%>
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
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://kit.fontawesome.com/4ea0bf99ed.js" crossorigin="anonymous"></script>
<style type="text/css">


span.day
{
	float: right;
	font-size: 11pt;
	color: gray;
}
</style>
<script type="text/javascript">
$(function() {
	
	$("span.likes").click(function() {
		
		var num=$(this).attr("num");
		var tag=$(this)
		console.log(num);
		
		$.ajax({
			type:"get",
			dataType:"json",
			url:"board/boardlikes.jsp",
			data:{"num":num},
			success:function(res){
				//alert(res.board_likes)
				tag.next().text(res.board_likes);
				tag.next().next().animate({"font-size":"20px"},1500,function(){
					
					$(this).css("font-size","0px");
				});
				
			}
		});
		
	});
	
	//댓글 부분은 처음엔 안보이게 처리
	$("div.answer").hide();
	
	//댓글 클릭하면 나오게 처리
	$("span.answer").click(function() {
	
		$(this).parent().find("div.answer").toggle();
	});
	
	$("#adel").click(function() {
		var idx=$(this).attr("idx");
		
		//alert(idx);
		
		$.ajax({
			type:"get",
			dataType:"html",
			url:"board/boardanswerdelete.jsp",
			data:{"idx":idx},
			success:function(){
				alert("삭제 완료")
				location.reload();
			}
			
			
			
		});
		
		
		
	});
	
});
</script>
<title>Insert title here</title>

</head>
<%
//로그인 상태 확인후 로그인중에만 입력폼 보여주기
String loginok=(String)session.getAttribute("loginok");
String myid=(String)session.getAttribute("myid");
BoardDao dao=new BoardDao();


//페이징 필요변수
int totalCount;
int totalPage;//총페이지
int startPage;//각블럭시작페이지
int endPage;//끝페이지
int start;//시작번호
int perPage=4;//한페이지에 보여질 글 갯수
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
<img src="image/title.png" align="left" style="width: 1500px; height: 100px;">
<%
if(loginok!=null){
	%>
	<jsp:include page="boardaddform.jsp"/>
	<hr align="left">
	<%}
%>
<div>
<a></a>
<b   style="color:red"><%=totalCount %>개의 글이 있습니다 </b>
<%
MemberDao mdao=new MemberDao();
for(BoardDto dto:list)
{
	String name=mdao.getName(dto.getBoard_id());
	%>
	<table class="table" style="">
		<tr>
			<td style="background-color:">
				<b style="font-size: 20px; "><i class="fa-solid fa-user"></i><%=name%>님 글</b>
				<%
				//로그인한 아이디
				
				
				//로그인한 아이디와 글을 쓴 아이디가 같을 경우에만 수정, 삭제가 보이도록
				if(loginok!=null && dto.getBoard_id().equals(myid)){%>
					<a style="color: gray;">|</a>
					<a href="index.jsp?main=board/boardupdateform.jsp?board_num=<%=dto.getBoard_num()%>&currentPage=<%=currentPage%>" style="color: gray;">수정</a>
					<a style="color: gray;">|</a>
					<a href="board/boarddelete.jsp?board_num=<%=dto.getBoard_num()%>&currentPage=<%=currentPage%>" style="color: gray;">삭제</a>
					
				<%}//System.out.print(dto.getBoard_num());
				%>
				  <span class="day"><%=sdf.format(dto.getReg_date())%></span>
			 </td>
		</tr>
		<tr height="200">
			<td>
				<%
				if(dto.getBoard_photo()==null)
				{%>
					<a href="save/<%=dto.getBoard_photo()%>" target="_blank">
					<img src="image/review_img.png" align="left" style="width: 150px; height: 150px;"></a>
				<%
				}else{%>
				
				<a href="save/<%=dto.getBoard_photo()%>" target="_blank">
				
				<img src="save/<%=dto.getBoard_photo()%>" align="left" style="width: 150px;"></a>
				<!-- 사진 크기 -->
				<%
				}
				%>
				<br>
				<%=dto.getBoard_content().replace("\n", "<br>")%>
			</td>
		</tr>
		<tr>
			<td>
		
			<%
				//각 방명록에 달린 댓글 목록 가져오기
				BoardAnswerDao adao=new BoardAnswerDao();
			
				List<BoardAnswerDto> alist=adao.getAllAnswers(dto.getBoard_num());
			%>
		
			
			<span class="answer" style="cursor: pointer;" mum="<%=dto.getBoard_num() %>" >댓글<%=alist.size()%></span>
			<span class="likes" style="margin-left: 20px; cursor: pointer;" num="<%=dto.getBoard_num() %>">추천</span>
			<span><%=dto.getBoard_likes() %></span>
			<i class="fa-solid fa-heart" style="color:red;font-size:0px"></i>
			
			<div class="answer">
				<%
					if(loginok!=null){%>
					
					<div class="answerform">
						<form action="board/boardanswerinsert.jsp" method="post">
							<input type="hidden" name="num" value="<%=dto.getBoard_num()%>">
							<input type="hidden" name="myid" value="<%=myid%>">
							<input type="hidden" name="currentPage" value="<%=currentPage%>">
						<table class="table">
								<tr>
									<td width="520">
										<textarea style="width: 510; height: 70px;" name="content"
										required="required" class="form-control"></textarea>
									</td>
									<td>
										<button type="submit" class="btn btn-info" style="width: 70px; height: 70px;">등록</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
					
					<%
					}
				%>
					<div class="boardanswerlist">
						<table style="width: 500px;">
							<%
							for(BoardAnswerDto adto:alist)
							{%>
								<tr>
									<td>
										<span class="glyphicon glyphicon-user" style="font-size: 18px;"></span>
									</td>
									<td>
										<%
										//작성자명 얻기
										String aname=mdao.getName(adto.getBoard_id());
										%>
										<b><%=aname%></b>&nbsp;
										<%
										//글 작성자와 댓글 작성자가 같을 경우 작성자
										if(dto.getBoard_id().equals(adto.getBoard_id())){%>
											<span style="color: red; font-size: 10pt;">작성자</span>
										<%}
										%>
										<span style="font-size: 9pt; color: gray; margin-left: 20px;"><%=sdf.format(adto.getReg_date())%></span>
										<%
										//댓글 삭제는 로그인 중이면서 로그인한 아이디와 같을 경우
										if(loginok!=null && adto.getBoard_id().equals(myid)){%>
											<span class="adel " idx="<%=adto.getIdx()%>" 
											 style="cursor: pointer; margin-left: 30px;" id="adel"><i class="fa-solid fa-trash"></i></span>
										<%	
										}
										%>
										<br>
										<span style="font-size: 10pt;"><%=adto.getBoard_content().replace("\n","<br>")%></span>
										<br>
									</td>
								</tr>
							<%
							}
							%>
						</table>
					</div>
			
				</div>
					
			</td>
		</tr>
	</table> 	
<%
}
%>
</div>
<!-- 페이징 처리 -->
<div style="width: 200px; text-align:center;" class="container" id="page">

	<ul class="pagination">
		<%
		
		//이전
		if(startPage>1)
		{%>
			<li>
				<a class="container p-1 my-5 border" href="index.jsp?main=board/boardlist.jsp?currentPage=<%=startPage-1%>">이전</a>
			</li>
		<%}
		for(int pp=startPage;pp<=endPage;pp++)
		{
			if(pp==currentPage)
			{%>
				<li class="active">
					<a class="container p-1 my-5 border" href="index.jsp?main=board/boardlist.jsp?currentPage=<%=pp%>"><%=pp%></a>
				</li>
			<%}else{%>
				<li>
					<a class="container p-1 my-5 border" href="index.jsp?main=board/boardlist.jsp?currentPage=<%=pp%>"><%=pp%></a>
				</li>
			<%}
		}
		
		//다음
		if(endPage<totalPage)
		{%>
			<li>
				<a class="container p-1 my-5 border" href="index.jsp?main=board/boardlist.jsp?currentPage=<%=endPage+1%>">다음</a>
			</li>
		<%}
		%>
	</ul>
</div>
</body>
</html>