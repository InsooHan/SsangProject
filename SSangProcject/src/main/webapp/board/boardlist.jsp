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

#night_day{
			 
            width:40px; 
            height:15px;
            padding:20px;
            border:1px solid black;
            font-size: 25px;
           	
}
#title{
	 		display:inline-block; 
            width:2000px; 
            height:80px;
            background-color:lightgreen;
            padding:20px;
            border:1px solid lightgreen;
            color:white;
            font-size: 30px;
            
}
#title2{
	 		display:inline-block; 
            width:2000px; 
            height:60px;
            background-color:lightgreen;
            padding:20px;
            border:1px solid lightgreen;
            color:white;
            font-size: 15px;
            
}
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
	
	//?????? ????????? ????????? ???????????? ??????
	$("div.answer").hide();
	
	//?????? ???????????? ????????? ??????
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
				alert("?????? ??????")
				location.reload();
			}
			
			
			
		});
		
		
		
	});
	
});

</script>

<title>Insert title here</title>

</head>

<%
//????????? ?????? ????????? ?????????????????? ????????? ????????????
String loginok=(String)session.getAttribute("loginok");
String myid=(String)session.getAttribute("myid");
BoardDao dao=new BoardDao();
//????????? ????????????
int totalCount;
int totalPage;//????????????
int startPage;//????????????????????????
int endPage;//????????????
int start;//????????????
int perPage=4;//??????????????? ????????? ??? ??????
int perBlock=5;// ??? ????????? ???????????? ???????????????
int currentPage;//???????????????
int no;
totalCount=dao.getTotalCount();
//?????? ????????? ?????? ?????? null?????? 1?????????
if(request.getParameter("currentPage")==null)
	currentPage=1;
else
	currentPage=Integer.parseInt(request.getParameter("currentPage"));
//???????????? ?????? ?????????
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
<!--  <input id="night_day" type="button" value="night" onclick="
      if( document.querySelector('#night_day').value=='night'){
      document.querySelector('body').style.backgroundColor='lightyellow';
      //document.querySelector('body').style.color='white';
      //document.document.getelementbyid('title').style.backgroundColor='lightyellow';
      document.querySelector('#night_day').value='day';
      }
      else{
   	   document.querySelector('body').style.backgroundColor='white';
       //document.querySelector('body').style.color='black';
  	   //document.document.getelementbyid('title').style.backgroundColor='lightyellow';
   	   document.querySelector('#night_day').value='night';
    }
      " > -->




<div id="title3">
	<span id="title">???????????? ?????????</span>
	<span id="title2">??????????????? ????????????! ?????? ???????????? ?????? ?????????!</span>
</div>

<!--  <img src="image/title.png" align="left" style="width: 1500px; height: 80px;">-->
<%
if(loginok!=null){
	%>
	<jsp:include page="boardaddform.jsp"/>
	<hr align="left">
	<%}
%>
<div>

<b style="color:red"><%=totalCount %>?????? ?????? ????????????. </b>





<%
MemberDao mdao=new MemberDao();
for(BoardDto dto:list)
{
	String name=mdao.getName(dto.getBoard_id());
	%>
	<table class="table" style="">
		<tr>
			<td style="background-color: lightgreen; ">
				<b style="font-size: 20px; color:white;"><i class="fa-solid fa-user"></i>&nbsp;<%=name%>??? ???</b>
				<%
				//???????????? ?????????
				
				
				//???????????? ???????????? ?????? ??? ???????????? ?????? ???????????? ??????, ????????? ????????????
				if(loginok!=null && dto.getBoard_id().equals(myid)){%>
					<a style="color: white;">|</a>
					<a href="index.jsp?main=board/boardupdateform.jsp?board_num=<%=dto.getBoard_num()%>&currentPage=<%=currentPage%>" style="color:white;">??????</a>
					<a style="color: white;">|</a>
					<a href="board/boarddelete.jsp?board_num=<%=dto.getBoard_num()%>&currentPage=<%=currentPage%>" style="color:white;">??????</a>
					
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
				
				<img src="save/<%=dto.getBoard_photo()%>" align="left" style="width: 150px; border-radius: 1px solid black;"></a>
				<!-- ?????? ?????? -->
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
				//??? ???????????? ?????? ?????? ?????? ????????????
				BoardAnswerDao adao=new BoardAnswerDao();
			
				List<BoardAnswerDto> alist=adao.getAllAnswers(dto.getBoard_num());
			%>
		
			
			<span class="answer" style="cursor: pointer;" mum="<%=dto.getBoard_num() %>" >??????&nbsp;<%=alist.size()%>???</span>
			<span class="likes" style="margin-left: 20px; cursor: pointer;" num="<%=dto.getBoard_num() %>"><i class="fa-solid fa-heart" style="color:red;font-size:15px"></i></span>
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
										<button type="submit" class="btn" style="width: 70px; height: 70px; background-color:lightgreen; color:white;">??????</button>
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
										//???????????? ??????
										String aname=mdao.getName(adto.getBoard_id());
										%>
										<b><%=aname%></b>&nbsp;
										<%
										//??? ???????????? ?????? ???????????? ?????? ?????? ?????????
										if(dto.getBoard_id().equals(adto.getBoard_id())){%>
											<span style="color: red; font-size: 10pt;">?????????</span>
										<%}
										%>
										<span style="font-size: 9pt; color: gray; margin-left: 20px;"><%=sdf.format(adto.getReg_date())%></span>
										<%
										//?????? ????????? ????????? ???????????? ???????????? ???????????? ?????? ??????
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
<!-- ????????? ?????? -->
<div style="width: 200px; text-align:center;" class="container"  id="page">

	<ul class="pagination">
		<%
		
		//??????
		if(startPage>1)
		{%>
			<li>
				<a class="container p-1 my-5 border" href="index.jsp?main=board/boardlist.jsp?currentPage=<%=startPage-1%>">??????</a>
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
		
		//??????
		if(endPage<totalPage)
		{%>
			<li>
				<a class="container p-1 my-5 border" href="index.jsp?main=board/boardlist.jsp?currentPage=<%=endPage+1%>">??????</a>
			</li>
		<%}
		
		%>
		
	</ul>
</div>
</body>
</html>
