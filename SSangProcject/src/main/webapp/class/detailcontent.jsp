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

span.star-prototype, span.star-prototype>* {
	height: 16px;
	background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
	width: 80px;
	display: inline-block;
}

span.star-prototype>* {
	background-position: 0 0;
	max-width: 80px;
}
</style>
<script type="text/javascript">
$(function(){
	
	//처음에 수강평 리스트 나오게 메서드 호출
	var class_num=<%=class_num%>
	defaultlist(class_num);
	
	//수강평 좋아요 순 정렬
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
					s+="<span class='star-prototype' style='text-align: left;'>"+item.reviewstar+"</span>";
					s+="<span style='font-size: 1.2em;'>"+item.reviewstar+"</span><br>";
					s+="<span>"+item.name+"</span><br>";
					s+="<span>"+item.review_content+"</span><br>";
					s+="<span style='color: lightgray;'>"+item.reg_date+"</span>"
					s+="<span class='likes glyphicon glyphicon-heart-empty' style='float: right; cursor: pointer;' num='"+item.review_chu+"'>"+item.review_chu+"</span>";
		    	    s+="</td></tr>";
				});
				$("#rlist").html(s);  
			}
		})
	 })
		//수강평 평점 낮은 순 정렬
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
					s+="<span class='star-prototype' style='text-align: left;'>"+item.reviewstar+"</span>";
					s+="<span style='font-size: 1.2em;'>"+item.reviewstar+"</span><br>";
					s+="<span>"+item.name+"</span><br>";
					s+="<span>"+item.review_content+"</span><br>";
					s+="<span style='color: lightgray;'>"+item.reg_date+"</span>"
					s+="<span class='likes glyphicon glyphicon-heart-empty' style='float: right; cursor: pointer;' num='"+item.review_chu+"'>"+item.review_chu+"</span>";
		    	    s+="</td></tr>";
				});
				$("#rlist").html(s);  
			}
		})
		})
		//수강평 최신순 정렬
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
					s+="<span class='star-prototype' style='text-align: left;'>"+item.reviewstar+"</span>";
					s+="<span style='font-size: 1.2em;'>"+item.reviewstar+"</span><br>";
					s+="<span>"+item.name+"</span><br>";
					s+="<span>"+item.review_content+"</span><br>";
					s+="<span style='color: lightgray;'>"+item.reg_date+"</span>"
					s+="<span class='likes glyphicon glyphicon-heart-empty' style='float: right; cursor: pointer;' num='"+item.review_chu+"'>"+item.review_chu+"</span>";
		    	    s+="</td></tr>";
				});
				$("#rlist").html(s);  
			}
		})
		})
		//수강평 평점 높은 순 정렬
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
					s+="<span class='star-prototype' style='text-align: left;'>"+item.reviewstar+"</span>";
					s+="<span style='font-size: 1.2em;'>"+item.reviewstar+"</span><br>";
					s+="<span>"+item.name+"</span><br>";
					s+="<span>"+item.review_content+"</span><br>";
					s+="<span style='color: lightgray;'>"+item.reg_date+"</span>"
					s+="<span class='likes glyphicon glyphicon-heart-empty' style='float: right; cursor: pointer;' num='"+item.review_chu+"'>"+item.review_chu+"</span>";
		    	    s+="</td></tr>";
				});
				$("#rlist").html(s);  
			}
		})
	})  
	
	//수강평 하트 누르면 chu 1씩 증가
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
//수강평 정렬 방식 클릭 시 css
$("div.reviewoption>span").click(function(){
	$(this).css({'color':'black','font-weight':'bold'});
	$(this).siblings('span').css({'color':'lightgray','font-weight':'normal'});
	});
		});
//전체 수강평 리스트 출력 메서드
 function defaultlist(class_num){
	$.ajax({
		type:"post",
		url:"class/reviewlist.jsp",
		dataType:"json",
		data:{"class_num":class_num},
		success:function(res){
			var s="";
			 $.each(res,function(idx,item){
				s+="<tr><td>";
				s+="<img src='image/review_img.png' style='width: 50px; height: 50px; border-radius: 100px'>";
				s+="<span class='star-prototype' style='text-align: left;'>"+item.reviewstar+"</span>";
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
			    	    s+="<span style='border: 1px black solid; padding: 5px 5px 5px 5px; color: gray;'>지식공유자</span>";
						s+="<span style='color: darkgray; font-weight: bold;'>"+rs.gongname+"</span><br>";
						s+="<span>"+rs.ans_content+"</span><br><span style='color: gray;'>날짜</span>";
						s+="<span class='anslikes glyphicon glyphicon-heart-empty'style='float: right; cursor: pointer;' num=''>"+rs.ans_chu+"</span>";
						s+="</div></td></tr>";
	    	    	}
	    	    }) */ 	
			});
			$("#rlist").html(s);
			
		} 
	})
} 
</script>
<title>Insert title here</title>
</head>

<body>
	<!--강의 소개 div  -->
	<div id="introduce">강의 소개</div>
	<!--수강평 div  -->
	<div id="score">
		<span style="font-size: 1.5em; font-weight: bold;">수강평</span>&nbsp;&nbsp;
		<span style="color: lightgray; font-size: 1.2em;">총<%=rdao.getTotalCount(class_num) %>개
		</span> <br> <br> <span>수강생분들이 직접 작성하신 수강평입니다. 수강평을 작성 시
			300잎이 적립됩니다.</span><br> <br>
		<div class="item1">
			<h1><%=star %></h1>
			<span class="star-prototype" style="text-align: left;"><%=star %></span><br>
			<span style="color: lightgray;"><%=rdao.getTotalCount(class_num) %>개의
				수강평</span>
		</div>
		<div class="item2" style="display: flex; flex-wrap: wrap;">
		 <span>5점</span><div class="bar" data-percent=30><div></div></div>
		 <span>4점</span><div class="bar" data-percent=30><div></div></div>
		 <span>3점</span><div class="bar" data-percent=30><div></div></div>
		 <span>2점</span><div class="bar" data-percent=30><div></div></div>
		 <span>1점</span><div class="bar" data-percent=30><div></div></div>
		</div>
		<!-- 평점 막대 그래프 자바스크립트 -->
		<script type="text/javascript">
		var bars = document.querySelectorAll('.bar');

		for (var i = 0; i < bars.length; i++) {
		  bars[i].querySelector('div').style.width = bars[i].dataset.percent + "%";
		}</script>
		<div class="reviewoption">
			<b style="color: black; cursor: default;">VIEW |</b> <span
				class="glyphicon glyphicon-triangle-bottom btnchu">좋아요 순</span>
			&nbsp;&nbsp;&nbsp; <span
				class="glyphicon glyphicon-triangle-bottom btnrec">최신 순</span>&nbsp;&nbsp;&nbsp;
			<span class="glyphicon glyphicon-triangle-bottom btnhigh">평점
				낮은 순</span>&nbsp;&nbsp;&nbsp; <span
				class="glyphicon glyphicon-triangle-bottom btnlow">평점 높은 순</span> <br>
			<hr>
		</div>
		<!--수강평 list  -->
			<table class="table" id="rlist">
			</table>	
		<!--수강평에 대한 답글  -->
		<div class="answer">
		</div>
	</div>
</body>
</html>