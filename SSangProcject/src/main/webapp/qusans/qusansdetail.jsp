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
<style type="text/css">
.quickmenu
{
position: absolute;
left: 900px;
top: 100px;
}

#lookanswer
{
cursor: pointer;

}
</style>
<script type="text/javascript">
$(function() {

var currentPosition = parseInt($(".quickmenu").css("top"));

//퀵메뉴 스크롤 따라가게 하기
$(window).scroll(function() {
	var position = $(window).scrollTop(); 
	$(".quickmenu").stop().animate({"top":100+position+"px"},500);
	//alert("스크롤이동");
});

//트위터 공유
$(document).on("click", "#btnTwitter", function(){
    var sendText = "공유"; // 전달할 텍스트
    var sendUrl = "naver.com/"; // 전달할 URL
    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
});

//facebook 공유
$("#btnFacebook").click(function shareFacebook() {
    var sendUrl = "naver.com/"; // 전달할 URL
    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
});

//댓글창 띄우기
$("#lookanswer").click(function() {
	
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

int to=adao.answerNum(num);
%>
<body>
<!-- 질문글 -->
<div>
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
</div>
<!-- 답변 list -->
<div style="background-color: #FDFDFD;">
<h6 style="color: gray; margin-left: 10px;"><br><i class="fa-solid fa-a fa-2x"></i>총 <b><%=to%></b>개의 답변이 달렸습니다.<br></h6>
<%
for(int i=0;i<list.size();i++)
{
	QusAnsAnswerDto adto=list.get(i);
	
	if(adto.getQue_num().equals(num))
	{
	%>
<div class="" style="width: 800px; background-color: white; border-radius: 10px; border: 1px solid #EEEEEF; margin-left: 10px; margin-bottom: 20px;">
	<table class="table table-borderless" style="width: 800px;">
		<tr style="border-bottom: solid 2px #dcdcdc;">
			<td>
				<i class="fa-solid fa-leaf" style="color: #78F681;"></i>
				<b style="font-size: 1.1em;"><%=adto.getAns_id()%></b>&nbsp;<span style="font-size: 10pt; color: gray;"><%=adto.getReg_date()%></span>
			</td>
		</tr>
		<tr>
			<td>
				<img alt="" src="save/<%=adto.getImage()%>">
				<br>
				<%=adto.getAns_content()%>
			</td>
		</tr>
	</table>
	<div style="background-color: #F5F6F5;">
	<b><br>&nbsp;&nbsp;댓글</b>
	<span id="lookanswer" style="float: right;"><i class="fa-solid fa-angle-down"></i>더보기&nbsp;&nbsp;</span>
	<b><br><br></b>
	</div>
</div>
<%
	}
}
%>
</div>
<!-- 답변 insert form -->
<form action="qusans/answerinsert.jsp" method="post" enctype="multipart/form-data">
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
  <ul class="list-group" style="width: 110px;">
    <li class="list-group-item"><button type="button" class="btn">미해결</button></li>
    <li class="list-group-item"><button type="button" class="btn">&nbsp;<i class="fa-regular fa-heart"></i>
    <%=dto.getQue_chu()%></button></li>
    <li class="list-group-item"><button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#myModal">
    <i class="fa-regular fa-share-from-square"></i>공유</button></li>
  </ul>
</div>

<!-- 공유 모달 -->
<div class="modal" id="myModal">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">

      <!-- Modal Header -->

    

      <!-- Modal body -->
      
      <div class="modal-body" style="text-align: center;">
        <a id="btnTwitter" class="link-icon twitter" href="javascript:shareTwitter();"><i class="fa-brands fa-twitter fa-2xl"></i></a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      	<a id="btnFacebook" class="link-icon facebook" href="javascript:shareFacebook();"><i class="fa-brands fa-facebook fa-2xl"></i></a>

        <button type="button" class="btn-close" data-bs-dismiss="modal" style="float: right;"></button>
      </div>
 	   
      <!-- Modal footer -->
      
      <div class="modal-footer">
      	<i class="fa-solid fa-share-from-square"></i>
      </div>
	  
    </div>
  </div>
</div>
</body>
</html>