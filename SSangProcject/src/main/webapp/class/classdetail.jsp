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
	
	margin-bottom : 20px;
	position: absolute;
	left: 200px;
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
	position: absolute;
	left: 1030px;
}
.fix{position:fixed;_position:absolute;width:100%;top:0  ;z-index:100
</style>
<script type="text/javascript">
$(function(){
	$("div.move").children().click(function(){
		$(this).css({'color':'black','font-weight':'bold'});
		$(this).siblings().css({'color':'black','font-weight':'normal'});
	})
	//특정위치부터 스크롤 따라오기 장바구니 div
	$(window).scroll(  
		    function(){  
		        //스크롤의 위치가 상단에서 장바구니 div를 넘어서면  
		        if(window.pageYOffset >= $('div.cart').offset().top){   
		            $('div.cart').addClass("fix");  
		            //위의 if문에 대한 조건 만족시 fix라는 class를 부여함  
		        }else{  
		            $('div.cart').removeClass("fix");  
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
<body>
<!-- 강의 타이틀 -->
<div class="title">
<!-- 강의 영상 미리보기 이미지 -->
<img src="class/thumbnail.png" style="border: 1px solid black; width: 400px; height: 250px;
position: absolute; top: 20px; left: 200px;">
<!-- 강의 정보 -->
<div style="border: 1px solid black; width: 700px; height: 250px;
position: absolute; top: 20px; left: 620px;">
<span>강의 카테고리 분류</span><br>
<span>강의 명</span><br><br><br>
<span>수강평</span><br>
<span>지식공유자</span><br>
<span>기술필터</span><br>
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
<span>가격</span><br>
<span>할부 가격</span><br>
<button>수강신청하기</button><br>
<button>바구니에담기</button><br>
<span>관심 공유</span><br>

</div>
</body>
</html>