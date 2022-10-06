<%@page import="dto.ReviewDto"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="dao.ReviewDao"%>
<%@page import="dto.ClassDto"%>
<%@page import="dao.ClassDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Hi+Melody&family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">    
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
div.reviewoption{
	color: lightgray;
	background-color: white;
	width: 100%;
	margin-top: 10px;
	justify-content: space-around;
}
div.reviewoption>span:hover{
	color: black;
	cursor: pointer;
	font-weight: bold;
	
}
div.item1{
	border: 1.5px solid lightgray;
	border-radius: 10px;
	height:150px;
	width: 150px;
	text-align: center;
	float: left;
}
div.item2{
	border: 1.5px solid lightgray;
	border-radius: 10px;
	height: 150px;
	width: 400px;
	margin-left: 155px;
	text-align: center;
	padding-top: 10px;
	
}
</style>
<script type="text/javascript">
//수강평 하트 클릭 메서드
$(function(){
$("span.likes").click(function(){
	
	var review_num=$(this).attr("num");
	var tag=$(this);
	
	$.ajax({
		type:"get",
		dataType:"json",
		url:"reviewChuAjax.jsp",
		data:{"review_num":review_num},
		success:function(res){
			
			tag.text(res.reivew_chu);
			tag.css({'color':'red'})
			}
		}
	)
	
});
//수강평 정렬 방식 클릭 시 css
$("div.reviewoption>span").click(function(){
	$(this).css({'color':'black','font-weight':'bold'});
	$(this).siblings('span').css({'color':'lightgray','font-weight':'normal'});
	})
})
</script>
<title>Insert title here</title>
</head>
<%
String class_num=request.getParameter("class_num");
ClassDao cldao = new ClassDao();
ClassDto cldto = cldao.getClass(class_num);

ReviewDao rdao = new ReviewDao();
double star = rdao.getReviewStar(class_num);
List<ReviewDto> rlist = rdao.getAllReview(class_num);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
NumberFormat numberFormat = NumberFormat.getInstance();
%>
<body>
<div id="introduce">강의 소개</div>
<div id="score"> 
  <span style="font-size: 1.5em; font-weight: bold;">수강평</span>&nbsp;&nbsp;
  <span style="color: lightgray; font-size: 1.2em;">총<%=rdao.getTotalCount(class_num) %>개</span> <br><br>
  <span>수강생분들이 직접 작성하신 수강평입니다. 수강평을 작성 시 300잎이 적립됩니다.</span><br><br>
    <div class="item1">
      <h1><%=star %></h1>
      <span class="star-prototype" style="text-align: left;"><%=star %></span><br>
      <span style="color: lightgray;"><%=rdao.getTotalCount(class_num) %>개의 수강평</span>
    </div>
    <div class="item2">
      <span>5점</span><br>
      <span>4점</span><br>
      <span>3점</span><br>
      <span>2점</span><br>
      <span>1점</span><br>
    </div>
  <div class="reviewoption">
  	<b style="color: black; cursor: default;">VIEW |</b>
    <span class="glyphicon glyphicon-triangle-bottom " >좋아요 순</span> &nbsp;&nbsp;&nbsp;
    <span class="glyphicon glyphicon-triangle-bottom" >최신 순</span>&nbsp;&nbsp;&nbsp;
    <span class="glyphicon glyphicon-triangle-bottom" >평점 높은 순</span>&nbsp;&nbsp;&nbsp;
    <span class="glyphicon glyphicon-triangle-bottom" >평점 낮은 순</span>
    <br>
    <hr>
  </div>
  <table class="table">
      <%
      for(ReviewDto rdto : rlist){%>
    	  <tr>
    	    <td>
    	    
    	      <img src="image/review_img.png" style="width: 50px; height: 50px; border-radius: 100px">
    	      <span class="star-prototype" style="text-align: left;"><%=rdto.getReviewstar() %></span>
    	      <span style="font-size: 1.2em;"><%=rdto.getReviewstar() %></span><br>
    	      <span>사용자 이름</span>
    	      <br>
    	      <span><%=rdto.getReview_content() %></span><br>
    	      <span style="color: lightgray;"><%=sdf.format(rdto.getReg_date()) %></span>
    	      <span class="likes glyphicon glyphicon-heart-empty" style="float: right; cursor: pointer;"
    	       num="<%=rdto.getReview_num()%>"><%=rdto.getReview_chu()%></span>
    	       
    	    </td>
    	  </tr>
      <%}
      %>
    </table>
</div>
</body>
</html>