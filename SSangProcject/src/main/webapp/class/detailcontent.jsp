<%@page import="dao.ReviewAnswerDao"%>
<%@page import="dto.ReviewAnswerDto"%>
<%@page import="dao.MemberDao"%>
<%@page import="dto.ReviewDto"%>
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
<link
	href="https://fonts.googleapis.com/css2?family=Dongle&family=Hi+Melody&family=Jua&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<%
String class_num=request.getParameter("class_num");
ClassDao cldao = new ClassDao();
ClassDto cldto = cldao.getClass(class_num);
MemberDao mdao = new MemberDao();
String gongname = mdao.getGongname(cldto.getUser_num());
ReviewAnswerDao radao = new ReviewAnswerDao();


ReviewDao rdao = new ReviewDao();
double star = rdao.getReviewStar(class_num);
List<ReviewDto> rlist = rdao.getAllReview(class_num);
double starcount1 = Math.floor(rdao.getReviewStarCount(class_num, 1)/(double)(rdao.getTotalCount(class_num))*100);
double starcount2 = Math.floor(rdao.getReviewStarCount(class_num, 2)/(double)(rdao.getTotalCount(class_num))*100);
double starcount3 = Math.floor(rdao.getReviewStarCount(class_num, 3)/(double)(rdao.getTotalCount(class_num))*100);
double starcount4 = Math.floor(rdao.getReviewStarCount(class_num, 4)/(double)(rdao.getTotalCount(class_num))*100);
double starcount5 = Math.floor(rdao.getReviewStarCount(class_num, 5)/(double)(rdao.getTotalCount(class_num))*100);
System.out.print(starcount1);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<style type="text/css">
.bar {
  width: calc(99% - 2em);
  height: 8px;
  background: lightgray;
  margin: 5px;
  border-radius: 5px;
}

.bar div {
  width: 0;
  height: 100%;
  background: gold;
  border-radius: 5px;
}
div.reviewoption {
	color: lightgray;
	background-color: white;
	width: 100%;
	margin-top: 10px;
	justify-content: space-around;
}

div.reviewoption>span:hover {
	color: black;
	cursor: pointer;
	font-weight: bold;
}

div.item1 {
	border: 1.5px solid lightgray;
	border-radius: 10px;
	height: 150px;
	width: 150px;
	text-align: center;
	float: left;
}

div.item2 {
	border: 1.5px solid lightgray;
	border-radius: 10px;
	height: 150px;
	width: 400px;
	margin-left: 155px;
	text-align: center;
	padding-top: 10px;
}

 span.star-prototype1>* {
	height: 16px;
	background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
	width: 80px;
	display: inline-block;
}

span.star-prototype1>* {
	background-position: 0 0;
	max-width: 80px;
}
</style>
<script type="text/javascript">
$(function(){
	//????????? ????????? ????????? ????????? ????????? ??????
	var class_num=<%=class_num%>
	defaultlist(class_num);
	
	
	//????????? ????????? ??? ??????
	 $(".btnchu").click(function(){
		$.ajax({
			type:"post",
			url:"class/reviewlistchu.jsp",
			dataType:"json",
			data:{"class_num":class_num},
			success:function(res){
				 var s="";
				 $.each(res,function(idx,item){
					s+="<tr><td>";
					s+="<img src='image/review_img.png' style='width: 50px; height: 50px; border-radius: 100px'>";
					s+="<span class='star-prototype1' style='text-align: left;'>"+item.reviewstar+"</span>";
					s+="<span style='font-size: 1.2em;'>"+item.reviewstar+"</span><br>";
					s+="<span>"+item.name+"</span><br>";
					s+="<span>"+item.review_content+"</span><br>";
					s+="<span style='color: lightgray;'>"+item.reg_date+"</span>"
					s+="<span class='likes glyphicon glyphicon-heart-empty' style='float: right; cursor: pointer;' num='"+item.review_chu+"'>"+item.review_chu+"</span>";
		    	    s+="</td></tr>";
				});
				$("#rlist").html(s);  
				$('.star-prototype1').generateStars();
			}
		})
	 })
		//????????? ?????? ?????? ??? ??????
		$(".btnlow").click(function(){
			$.ajax({
			type:"post",
			url:"class/reviewlistrating2.jsp",
			dataType:"json",
			data:{"class_num":class_num},
			success:function(res){
				 var s="";
				 $.each(res,function(idx,item){
					s+="<tr><td>";
					s+="<img src='image/review_img.png' style='width: 50px; height: 50px; border-radius: 100px'>";
					s+="<span class='star-prototype1' style='text-align: left;'>"+item.reviewstar+"</span>";
					s+="<span style='font-size: 1.2em;'>"+item.reviewstar+"</span><br>";
					s+="<span>"+item.name+"</span><br>";
					s+="<span>"+item.review_content+"</span><br>";
					s+="<span style='color: lightgray;'>"+item.reg_date+"</span>"
					s+="<span class='likes glyphicon glyphicon-heart-empty' style='float: right; cursor: pointer;' num='"+item.review_chu+"'>"+item.review_chu+"</span>";
		    	    s+="</td></tr>";
				});
				$("#rlist").html(s);  
				$('.star-prototype1').generateStars();
			}
		})
		})
		//????????? ????????? ??????
		$(".btnrec").click(function(){
			$.ajax({
			type:"post",
			url:"class/reviewlistrecent.jsp",
			dataType:"json",
			data:{"class_num":class_num},
			success:function(res){
				 var s="";
				 $.each(res,function(idx,item){
					s+="<tr><td>";
					s+="<img src='image/review_img.png' style='width: 50px; height: 50px; border-radius: 100px'>";
					s+="<span class='star-prototype1' style='text-align: left;'>"+item.reviewstar+"</span>";
					s+="<span style='font-size: 1.2em;'>"+item.reviewstar+"</span><br>";
					s+="<span>"+item.name+"</span><br>";
					s+="<span>"+item.review_content+"</span><br>";
					s+="<span style='color: lightgray;'>"+item.reg_date+"</span>"
					s+="<span class='likes glyphicon glyphicon-heart-empty' style='float: right; cursor: pointer;' num='"+item.review_chu+"'>"+item.review_chu+"</span>";
		    	    s+="</td></tr>";
				});
				$("#rlist").html(s);  
				$('.star-prototype1').generateStars();
			}
		})
		})
		//????????? ?????? ?????? ??? ??????
		$(".btnhigh").click(function(){
			$.ajax({
			type:"post",
			url:"class/reviewlistrating1.jsp",
			dataType:"json",
			data:{"class_num":class_num},
			success:function(res){
				 var s="";
				 $.each(res,function(idx,item){
					s+="<tr><td>";
					s+="<img src='image/review_img.png' style='width: 50px; height: 50px; border-radius: 100px'>";
					s+="<span class='star-prototype1' style='text-align: left;'>"+item.reviewstar+"</span>";
					s+="<span style='font-size: 1.2em;'>"+item.reviewstar+"</span><br>";
					s+="<span>"+item.name+"</span><br>";
					s+="<span>"+item.review_content+"</span><br>";
					s+="<span style='color: lightgray;'>"+item.reg_date+"</span>"
					s+="<span class='likes glyphicon glyphicon-heart-empty' style='float: right; cursor: pointer;' num='"+item.review_chu+"'>"+item.review_chu+"</span>";
		    	    s+="</td></tr>";
				});
				$("#rlist").html(s);  
				$('.star-prototype1').generateStars();
			}
		})
	})  
	
	//????????? ?????? ????????? chu 1??? ??????
$("span.likes").click(function(){
	var review_num=$(this).attr("num");
	var tag=$(this);
	$.ajax({
		type:"post",
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
//????????? ?????? ?????? ?????? ??? css
$("div.reviewoption>span").click(function(){
	$(this).css({'color':'black','font-weight':'bold'});
	$(this).siblings('span').css({'color':'lightgray','font-weight':'normal'});
	});
		});
//?????? ????????? ????????? ?????? ?????????
 function defaultlist(class_num){
	$.ajax({
		type:"post",
		url:"class/reviewlist.jsp",
		dataType:"json",
		data:{"class_num":class_num},
		success:function(res){
			// ?????? ????????? ?????? ??????????????? ???????????? ??????
			
			var s="";
			 $.each(res,function(idx,item){
				s+="<tr><td>";
				s+="<img src='image/review_img.png' style='width: 50px; height: 50px; border-radius: 100px'>";
				s+="<span class='star-prototype1' style='text-align: left;'>"+item.reviewstar+"</span>";
				s+="<span style='font-size: 1.2em;'>"+item.reviewstar+"</span><br>";
				s+="<span>"+item.name+"</span><br>";
				s+="<span>"+item.review_content+"</span><br>";
				s+="<span style='color: lightgray;'>"+item.reg_date+"</span>"
				s+="<span class='likes glyphicon glyphicon-heart-empty' style='float: right; cursor: pointer;' num='"+item.review_chu+"'>"+item.review_chu+"</span>";
	    	    s+="</td></tr>";
	    	     /* $.ajax({
	    	    	type:"post",
	    	    	url:"class/reviewanswerajax.jsp",
	    	    	dataType:"json",
	    	    	data:{"review_num":item.review_num},
	    	    	success:function(rs){
	    	    		s+="<tr><td><div style='background-color: gainsboro;'>";
			    	    s+="<span style='border: 1px black solid; padding: 5px 5px 5px 5px; color: gray;'>???????????????</span>";
						s+="<span style='color: darkgray; font-weight: bold;'>"+rs.gongname+"</span><br>";
						s+="<span>"+rs.ans_content+"</span><br><span style='color: gray;'>??????</span>";
						s+="<span class='anslikes glyphicon glyphicon-heart-empty'style='float: right; cursor: pointer;' num=''>"+rs.ans_chu+"</span>";
						s+="</div></td></tr>";
	    	    	}
	    	    }) */ 	
			});
			$("#rlist").html(s);
			$('.star-prototype1').generateStars();
		} 
	})
} 
</script>
<title>Insert title here</title>
</head>

<body>
	<!--?????? ?????? div  -->
	<div id="introduce">
	<span style="font-size: 1.5em; font-weight: bold;">????????????</span><br><br>
	<%=cldto.getClass_content() %></div>
	<!--????????? div  -->
	<br><br>
	<div id="score">
		<span style="font-size: 1.5em; font-weight: bold;">?????????</span>&nbsp;&nbsp;
		<span style="color: lightgray; font-size: 1.2em;">???<%=rdao.getTotalCount(class_num) %>???
		</span> <br> <br> <span>?????????????????? ?????? ???????????? ??????????????????. ???????????? ?????? ???
			300?????? ???????????????.</span><br> <br>
		<div class="item1">
			<h1><%=star %></h1>
			<span class="star-prototype" style="text-align: left;"><%=star %></span><br>
			<span style="color: lightgray;"><%=rdao.getTotalCount(class_num) %>??????
				?????????</span>
		</div>
		<div class="item2" style="display: flex; flex-wrap: wrap;">
		 <span>5???</span><div class="bar" data-percent=<%=starcount5 %>><div></div></div>
		 <span>4???</span><div class="bar" data-percent=<%=starcount4 %>><div></div></div>
		 <span>3???</span><div class="bar" data-percent=<%=starcount3 %>><div></div></div>
		 <span>2???</span><div class="bar" data-percent=<%=starcount2 %>><div></div></div>
		 <span>1???</span><div class="bar" data-percent=<%=starcount1 %>><div></div></div>
		</div>
		<!-- ?????? ?????? ????????? ?????????????????? -->
		<script type="text/javascript">
		var bars = document.querySelectorAll('.bar');

		for (var i = 0; i < bars.length; i++) {
		  bars[i].querySelector('div').style.width = bars[i].dataset.percent + "%";
		}</script>
		<div class="reviewoption">
			<b style="color: black; cursor: default;">VIEW |</b> <span
				class="glyphicon glyphicon-triangle-bottom btnchu">????????? ???</span>
			&nbsp;&nbsp;&nbsp; <span
				class="glyphicon glyphicon-triangle-bottom btnrec">?????? ???</span>&nbsp;&nbsp;&nbsp;
			<span class="glyphicon glyphicon-triangle-bottom btnhigh">??????
				?????? ???</span>&nbsp;&nbsp;&nbsp; <span
				class="glyphicon glyphicon-triangle-bottom btnlow">?????? ?????? ???</span> <br>
			<hr>
		</div>
		<!--????????? list  -->
			<table class="table" id="rlist">
			</table>	
		<!--???????????? ?????? ??????  -->
		<div class="answer">
		</div>
	</div>
</body>
</html>