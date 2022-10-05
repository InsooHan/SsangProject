<%@page import="dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="dto.ReviewDto"%>
<%@page import="dao.ReviewDao"%>
<%@page import="dao.ClassDao"%>
<%@page import="dto.ClassDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Hi+Melody&family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">    
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
/*강의 타이틀 style  */
div.title{
	background-color: #000033;
	color: white;
	width: 100%;
	height: 300px;
}
/*강의소개, 수강평, 수강전문의 커뮤니티 이동 버튼 style*/
div.move{
	color: lightgray;
	font-size: 1.2em;
	background-color: white;
	margin-bottom : 20px;
	margin-left: 200px;
	box-sizing:border-box;
	width: 100%;
}

/*강의소개, 수강평, 수강전문의 커뮤니티 이동 버튼 hover*/
div.move>span:hover{
	color: black;
	cursor: pointer;
	font-weight: bold;
}

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

div.content{
	/* border: 1px solid black; */
	width: 800px;
	height: 100%;
	position: absolute;
	left: 200px;
	flex-direction: column;
}

div.cart{
	border: 1px solid black;
	width: 300px;
	height: 500px;
	margin-left: 1030px;
}
span.star-prototype, span.star-prototype > * {
    height: 16px; 
    background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
    width: 80px;
    display: inline-block;
}
 
span.star-prototype > * {
    background-position: 0 0;
    max-width:80px; 
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
.fixmove{position: fixed; top: 0px; z-index: 1;}
.fixcart{position: fixed; top: 465px; z-index: 1;}
</style>
<script type="text/javascript">
$(function(){
	console.log($('div.cart').offset());
	//move클릭시 css
	$("div.move").children().click(function(){
		$(this).css({'color':'black','font-weight':'bold'});
		$(this).siblings().css({'color':'black','font-weight':'normal'});
		})
	 //특정위치부터 스크롤 따라오기 장바구니 div
	$(window).scroll(function(){  
		  //스크롤의 위치가 상단에서 장바구니 div를 넘어서면  
		  if($(document).scrollTop() > $('div.cart').offset().top){   
		     $('div.cart').addClass('fixcart');
		     //위의 if문에 대한 조건 만족시 fix라는 class를 부여함  
		  }else{  
		     $('div.cart').removeClass('fixcart');  
		     //위의 if문에 대한 조건 아닌경우 fix라는 class를 삭제함  
		    }  
		  });
	//특정위치부터 스크롤 따라오기 헤더
	$(window).scroll(function(){  
		        //스크롤의 위치가 상단에서 move div를 넘어서면  
		        if($(document).scrollTop() > $('div.move').offset().top){   
		            $('div.move').addClass('fixmove');
		            //위의 if문에 대한 조건 만족시 fix라는 class를 부여함  
		        }else{  
		        	$('div.move').removeClass('fixmove');
		            //위의 if문에 대한 조건 아닌경우 fix라는 class를 삭제함  
		        }  
		    }  
		); 
	$.fn.generateStars = function() {
	    return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
	};

	// 숫자 평점을 별로 변환하도록 호출하는 함수
	$('.star-prototype').generateStars();
	
	//장바구니에 담기
	$("#btncart").click(function(){
		
		var formdata=$("#frm").serialize();
		//alert(formdata);
		
		$.ajax({
			
			type:"post",
			url:"class/cartproc.jsp",
			dataType:"html",
			data:formdata,
			success:function(res){
				
				if(confirm("장바구니에 저장하였습니다.\n장바구니로 이동하시겠습니까?")){
					location.href="index.jsp?main=class/cartlist.jsp";
				}
			}
		});
		
	});
})

/* 스크롤 이동 메서드 */
function fnMove(seq){
	 var offset = $("#" + seq).offset();
	 $('html, body').animate({scrollTop : offset.top}, 400);
}
</script>
</head>
<%
String class_num=request.getParameter("class_num");
ClassDao cldao = new ClassDao();
ClassDto cldto = cldao.getClass(class_num);

ReviewDao rdao = new ReviewDao();
double star = rdao.getReviewStar(class_num);
List<ReviewDto> rlist = rdao.getAllReview(class_num);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

//카트에 담을때 로그인한 상태여야 하므로
String loginok=(String)session.getAttribute("loginok");
//로그인한 id
String myid=(String)session.getAttribute("myid");
//id에 해당하는 멤버테이블의 시퀀스번호(로그인한 '나'의 user_num)
MemberDao mdao=new MemberDao();
String user_num=mdao.getNum(myid);
//지식공유자의 이름
String gongname=mdao.getGongname(cldto.getUser_num());
%>
<body>
<form id="frm">
  <input type="hidden" name="class_num" value="<%=class_num%>">
  <input type="hidden" name="user_num" value="<%=user_num%>">
<!-- 강의 타이틀 -->
<div class="title">
	<!-- 강의 영상 미리보기 이미지 -->
	<img src="../class/thumbnail.png" style="width: 400px; height: 250px;
	position: absolute; top: 20px; left: 200px; border-radius: 30px">
	<!-- 강의 정보 -->
	<div style="width: 700px; height: 250px; padding: 20px 20px;
		position: absolute; top: 20px; left: 620px;">
		<span><%=cldto.getCategory() %><%=cldto.getSub_category()!=null?" > "+cldto.getSub_category():"" %></span><br>
		<span><h2><%=cldto.getClass_name() %></h2></h2></span><br><br>
		<span class="star-prototype" style="text-align: left;"><%=star %></span>
		<span style="font-weight: bold;">(<%=star%>)</span> &nbsp;&nbsp;&nbsp;
		<span><%=rdao.getTotalCount(class_num) %>개의 수강평</span>
		<br>
		<span>지식공유자: <%=gongname %></span><br>
	</div>
</div>
<br>

<!-- 강의소개 수강평 수강전 문의 커뮤니티 버튼 -->
<div class="move">
<span class="btnclass" onclick="fnMove('introduce')">강의 소개</span> &nbsp;&nbsp;&nbsp;
<span class="btnclass " onclick="fnMove('score')">수강 평</span>&nbsp;&nbsp;&nbsp;
<span class="btnclass" onclick="fnMove('inquiry')">수강전 문의</span>&nbsp;&nbsp;&nbsp;
<span class="btnclass" onclick="fnMove('community')">커뮤니티</span>
<br>
<hr>
</div>
<br><br><br><br>

<!-- 강의소개 수강평 수강전 문의 커뮤니티 div -->
<div class="content">
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
  	<span style="color: black; font-weight: bold; cursor: default;">VIEW |</span>
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
    	    
    	      <img src="../image/review_img.png" style="width: 50px; height: 50px; border-radius: 100px">
    	      <span class="star-prototype" style="text-align: left;"><%=rdto.getReviewstar() %></span>
    	      <span style="font-size: 1.2em;"><%=rdto.getReviewstar() %></span><br>
    	      <span>사용자 이름</span>
    	      <br>
    	      <span><%=rdto.getReview_content() %></span><br>
    	      <span style="color: lightgray;"><%=sdf.format(rdto.getReg_date()) %></span>
    	      <span class="glyphicon glyphicon-heart-empty" style="float: right;"><%=rdto.getReview_chu()%></span>
    	    </td>
    	  </tr>
      <%}
      %>
    </table>
</div>
<div id="inquiry" >수강 전 문의</div>
<div id="community">커뮤니티</div>
</div>

<!-- 수강바구니 div -->
<div class="cart" align="center">
<span><%=cldto.getClass_price() %></span><br>
<span>할부 가격</span><br>
<button>수강신청하기</button><br>
<button type="button" id="btncart">바구니에담기</button><br>
<span>관심 공유</span><br>

</div>
</form>
</body>
</html>