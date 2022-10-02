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
	background-color: navy;
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

div.content{
	border: 1px solid black;
	width: 800px;
	height: 100%;
	position: absolute;
	left: 200px;
}

div.cart{
	border: 1px solid black;
	width: 300px;
	height: 500px;
	margin-left: 1030px;
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
%>
<body>
<!-- 강의 타이틀 -->
<div class="title">
<!-- 강의 영상 미리보기 이미지 -->
<img src="class/thumbnail.png" style="border: 1px solid black; width: 400px; height: 250px;
position: absolute; top: 20px; left: 200px;">
<!-- 강의 정보 -->
<div style="border: 1px solid black; width: 700px; height: 250px;
position: absolute; top: 20px; left: 620px;">
<span><%=cldto.getCategory() %><%=cldto.getSub_category()!=null?" > "+cldto.getSub_category():"" %></span><br>
<span><%=cldto.getClass_name() %></span><br><br><br>
<span><%=star %></span><br>
<span>지식공유자</span><br>
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
<div id="introduce" style="position: absolute;">강의 소개</div>
<div id="score" style="position: absolute; top: 500px;"> 수강평</div>
<div id="inquiry" style="position: absolute; top: 1000px;">수강 전 문의</div>
<div id="community" style="position: absolute; top: 1500px;">커뮤니티</div>
</div>

<!-- 수강바구니 div -->
<div class="cart" align="center">
<span><%=cldto.getClass_price() %></span><br>
<span>할부 가격</span><br>
<button>수강신청하기</button><br>
<button>바구니에담기</button><br>
<span>관심 공유</span><br>

</div>
</body>
</html>