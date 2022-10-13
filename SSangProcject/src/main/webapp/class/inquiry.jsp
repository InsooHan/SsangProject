<%@page import="dao.MemberDao"%>
<%@page import="dto.InquiryDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.InquiryDao"%>
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
String loginok=(String)session.getAttribute("loginok");
String class_num = request.getParameter("class_num");
String id=(String)session.getAttribute("myid");
InquiryDao dao=new InquiryDao();
InquiryDto dto = new InquiryDto();
%>
<style type="text/css">
.btnlist{
border: 1px solid lightgray;
color: lightgray;
cursor: pointer;
font-weight: bold;
text-align: center;
background-color: white;
border-radius: 5px;
height: 40px;
}
.btnlist:hover, .alllist{color: green;}
div.select > *{
border: 1px solid lightgray;
border-radius: 5px;
height: 40px;
line-height: 40px;
}
div#list{
border
}
</style>
<script type="text/javascript">
$(function(){
	
	var class_num=<%=class_num%>
	
	//전체 문의 리스트 출력 default
	allinquirylist(class_num);
	
	//전체보기 클릭 시 전체 리스트 출력 메서드 호출
	$("button.alllist").click(function(){
		allinquirylist(class_num);
		$(this).css({"color":"green"});
		$(this).siblings().css({"color":"lightgray"});
	})
	//내 작성글 보기 클릭 시 내 작성글 출력
	  $("button.mylist").click(function(){
		$(this).css({"color":"green"});
		$(this).siblings().css({"color":"lightgray"});
		if(<%=loginok%>="yes"){
		$.ajax({
			type:"post",
			url:"class/inquirymylist.jsp",
			dataType:"json",
			data:{"class_num":class_num},
			success:function(res){
				//alert("su");
				 var s="";
				$.each(res,function(idx,item){
					s+="<div style='border:1px solid lightgray; border-radius:5px;'>";
					s+="<img src='image/review_img.png' style='width:30px; height:30px;'>";
					s+="<span style='font-weight:bold;'>"+item.name+"</span>";
					s+="<span style='float:right'>"+item.inquiry_num+"</span>&nbsp;&nbsp;";
					s+="<span style='float:right; color:lightgray;'>|</span>&nbsp;&nbsp; ";
					s+="<span style='float:right'>"+item.reg_date+"</span><hr>";
					s+="<span>"+item.inquiry_content+"</span>";
					s+="</div><br><br>";
				});
				$("#list").html(s);  
			}
		})}
		else{
			alert("로그인해주세요.");
			window.location.assign("index.jsp?main=login/loginform.jsp");
			}
	})  
	
	
});
// 전체 문의 list ajax
function allinquirylist(class_num){
	$.ajax({
		type:"post",
		dataType:"json",
		url:"class/inquirylist.jsp",
		data:{"class_num":class_num},
		success:function(res){
			//console.log(res);
			 var s="";
			$.each(res,function(idx,item){
				s+="<div style='border:1px solid black; border-radius:5px;'>";
				s+="<img src='image/review_img.png' style='width:30px; height:30px;'>";
				s+="<span>"+item.name+"</span>";
				s+="<span style='float:right'>"+item.inquiry_num+"</span>&nbsp;";
				s+="<span style='float:right; color:lightgray;'>|</span>&nbsp; ";
				s+="<span style='float:right'>"+item.reg_date+"</span><hr>";
				s+="<span>"+item.inquiry_content+"</span>";
				s+="</div><br><br>";
			});
			$("#list").html(s); 
		}
	});
}
</script>
</head>
<body>
<div>
  <button type="button" style="float: right" class="btn btn-dark btn-xl">작성하기</button>
</div>
<br><br>
<div style="display: flex; float: left;">
  <button type="button" class="btnlist alllist">전체보기</button>
  <button type="button" class="btnlist mylist">내 작성글 모아보기</button>
</div>  
<div style="display: flex; float: right;" class="select">
  <select>
    <option>문의 내용</option>
    <option>문의 번호</option>
    <option>질문자 이름</option>
  </select>
  <input type="text" placeholder="(으)로 검색" style="width: 300px;">
  <button type="button" class="btn btn-success">검색</button>
</div>
<br><br><br>
<div id="list" style="display: flex; flex-direction: column; ">

</div>
</body>
</html>