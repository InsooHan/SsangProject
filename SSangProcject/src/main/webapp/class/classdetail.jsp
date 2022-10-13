<%@page import="dao.MemberDao"%>
<%@page import="java.text.NumberFormat"%>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>    
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Insert title here</title>
<%
String class_num=request.getParameter("class_num");
ClassDao cldao = new ClassDao();
ClassDto cldto = cldao.getClass(class_num);
ReviewDao rdao = new ReviewDao();
double star = rdao.getReviewStar(class_num);
List<ReviewDto> rlist = rdao.getAllReview(class_num);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
NumberFormat numberFormat = NumberFormat.getInstance();
//content div에 내용 표시
String contentpage = "detailcontent.jsp";
//url을 통해서 content값을 읽어서 content에 출력한다
if(request.getParameter("content")!=null) {
	contentpage = request.getParameter("content");
}
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
<style type="text/css">
#frm{
height: auto;
}
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
	height: auto;
	position: sticky;
	top: 0;
}
/*강의소개, 수강평, 수강전문의 커뮤니티 이동 버튼 hover*/
div.move>span:hover{
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
	padding: 0 0 0 0;
}
div.cartdetail{
	border: 1px solid lightgray;
	border-radius:20px;
	width: 310px;
	margin-left: 1030px;
	text-align: center;
	height: auto;
	position: sticky;
	top: 0;
	
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
.fixmove{position: fixed; top: 0px; z-index: 1;}
.fixcart{position: fixed; top: 465px; z-index: 1;}
</style>
<script type="text/javascript">
$(function(){
	console.log($('div.cartdetail').offset());
	
	//move클릭시 css
	$("div.move").children().click(function(){
		$(this).css({'color':'black','font-weight':'bold'});
		$(this).siblings().css({'color':'lightgray','font-weight':'normal'});
		});
		
	 
	 /* //특정위치부터 스크롤 따라오기 장바구니 div
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
		);  */
	$.fn.generateStars = function() {
	    return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
	};
	// 숫자 평점을 별로 변환하도록 호출하는 함수
	$('.star-prototype').generateStars();
	
	//장바구니에 담기
	$("#btncart").click(function(){
		
		if(<%=loginok%>="yes"){
			
		    var formdata=$("#frm").serialize();

		    $.ajax({
				
				type:"post",
				url:"class/cartproc.jsp",
				dataType:"html",
				data:formdata,
				success:function(){
					
					if(confirm("장바구니에 저장하였습니다.\n장바구니로 이동하시겠습니까?"))
						location.href="index.jsp?main=class/cartlist.jsp";
				}
			});
		} else {
			alert("장바구니에 담기위해 로그인해주세요.");
			window.location.assign("index.jsp?main=login/loginform.jsp");
		}
	});
	
	//수강신청하기
	$("#application").click(function(){
		
            if(<%=loginok%>="yes"){
			
		    var formdata=$("#frm").serialize();

		    $.ajax({
				
				type:"post",
				url:"class/cartproc.jsp",
				dataType:"html",
				data:formdata,
				success:function(){
					
					if(confirm("수강신청하였습니다.\n수강신청한 학습으로 이동하시겠습니까?"))
						location.href="index.jsp?main=class/mypage.jsp";
				}
			});
		} else {
			alert("수강신청을 하기위해 로그인해주세요.");
			window.location.assign("index.jsp?main=login/loginform.jsp");
		}
	}); 

});

/* move 클릭 시 스크롤 이동 메서드 */
 function fnMove(seq){
	<%if(!contentpage.equals("detailcontent.jsp")){%>
	location.href='index.jsp?main=class/classdetail.jsp?class_num=<%=class_num%>&content=detailcontent.jsp?class_num=<%=class_num%>'
	<%}
	%>
	 var offset = $("#" + seq).offset();
	 $('html, body').animate({scrollTop : offset.top}, 400);
}
</script>
</head>
<body>
<form id="frm">
  <input type="hidden" name="class_num" value="<%=class_num%>">
  <input type="hidden" name="user_num" value="<%=user_num%>">
<!-- 강의 타이틀 -->
<div class="title">
	<!-- 강의 영상 미리보기 이미지 -->
	<img src="<%=cldto.getClass_image() %>" style="width: 400px; height: 250px;
	position: absolute; top: 20px; left: 200px; border-radius: 30px">
	<!-- 강의 정보 -->
	<div style="width: 700px; height: 250px; padding: 20px 20px;
		position: absolute; top: 20px; left: 620px;">
		<span><%=cldto.getCategory() %><%=cldto.getSub_category()!=null?" > "+cldto.getSub_category():"" %></span><br>
		<span><h2><%=cldto.getClass_name() %></h2></span><br><br>
		<span class="star-prototype" style="text-align: left;"><%=star %></span>
		<span style="font-weight: bold;">(<%=star%>)</span> &nbsp;&nbsp;&nbsp;
		<span><%=rdao.getTotalCount(class_num) %>개의 수강평</span>
		<br>
		<span class="glyphicon glyphicon-user"></span>
		<span><%=gongname %><span class="glyphicon glyphicon-education"></span></span>
		
	</div>
</div>
<br>

<!-- 강의소개 수강평 수강전 문의 커뮤니티 버튼 -->
<div class="move">
<span class="btnclass" onclick="fnMove('introduce')">강의 소개</span> &nbsp;&nbsp;&nbsp;
<span class="btnclass " onclick="fnMove('score')">수강 평</span>&nbsp;&nbsp;&nbsp;
<span class="btnclass" onclick=
"location.href='index.jsp?main=class/classdetail.jsp?class_num=<%=class_num %>&content=inquiry.jsp?class_num=<%=class_num%>'">수강전 문의</span>&nbsp;&nbsp;&nbsp;
<span class="btnclass" onclick=
"location.href='index.jsp?main=class/classdetail.jsp?class_num=<%=class_num%>&content=../qusans/questions.jsp?class_num=<%=class_num%>'">커뮤니티</span>
<br>
<hr>
</div>
<br><br>

<!-- 강의소개 수강평 수강전 문의 커뮤니티 include -->
<div class="content">
	<jsp:include page="<%=contentpage%>"/>
</div>

<!-- 수강바구니 div -->
<div class="cartdetail">
<div style="border-radius:20px; background-color: white; width: 300px;">
<h2 style="text-align: left; margin: 10px 10px;"><%=numberFormat.format(cldto.getClass_price())%>원</h2><br>
<button type="button" style="width: 260px;height: 50px;" class="btn btn-success" id="application">수강신청하기</button><br>
<button type="button" style="width: 260px;height: 50px; margin-top: 10px; border: 1px solid lightgray" class="btn btn-Light" id="btncart">바구니에담기</button><br>
<span>관심</span>&nbsp;&nbsp;&nbsp;&nbsp;
<span>공유</span><br>
</div>
<div style="background-color: lightgray; text-align: left; border-radius: 20px; margin-top: 5px;
padding: 10px 10px 10px 10px;">
<ul>
 <li>지식공유자 : <%=gongname %></li>
 <li>수강기한 : 무제한</li>
 <li>수료증 : 발급</li>
 <li>난이도: <%=cldto.getLevels() %></li>
 </ul>
</div>
</div>
</form>
</body>
</html>