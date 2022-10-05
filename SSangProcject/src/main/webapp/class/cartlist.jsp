<%@page import="dto.MemberDto"%>
<%@page import="dto.ClassDto"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="dao.ClassDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://kit.fontawesome.com/4f8084f592.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style type="text/css">
.table{float: left;}
.carttb, h4{
   width: 750px;
   margin-left: 150px;
   margin-top: 20px;
}
.delbtn{
   margin-right: 35px;
}
.cart_num{
   float: left;
}
.info{
   float: left;
   margin-left: 30px;
   cursor: pointer;
}
.img{
   width: 100px;
}
.del{
   margin-right: 10px;
   cursor: pointer;
}
.totprice{
   margin-right: 45px;
}
.gongname{
   color: gray; font-size: 0.8em;
}
.infotb{
   margin-top: 20px;
   margin-left: 60px;
   width: 250px;
   height: 130px;
   font-size: 0.8em;
   border: 1px solid lightgray;
}
.infotb td{
   color: gray;
}
.paytb{
   margin-left: 60px;
   width: 250px;
   border: 1px solid lightgray;
}
.paybtn{
   width: 230px;
}
</style>
<script type="text/javascript">
$(function(){
	
	//정보 클릭시 해당상품으로 이동
	$("div.info").click(function(){
		var class_num=$(this).attr("class_num");
		location.href="index.jsp?main=class/classdetail.jsp?class_num="+class_num;
	});
	
	//전체선택
	$("#allcheck").click(function(){
		
		//체크값 얻기
		var chk=$(this).is(":checked");
		console.log(chk); //true,false
		
		//전체 체크값을 글 앞의 체크값에 일괄전달
		$(".cart_num").prop("checked",chk);
		
		//바로 선택상품가격에 바로 출력되도록
		var cnt=$(".cart_num:checked").length;
		if(cnt==0) $(".selectprice").html("0원");
		
		var price=0;
		
		$(".cart_num:checked").each(function(i,ele){
			price+=parseInt($(this).attr("class_price"));
			$(".selectprice").html(price+"원");
		});
	});
	
	//각 상품삭제
	$("span.del").click(function(){
		
		var cart_num=$(this).attr("cart_num");
		
		if(confirm("삭제하시겠습니까?")){
			del(cart_num);
			location.reload();
		}
	}); 
	
	//선택상품삭제
	$(".delbtn").click(function(){
		
		var cnt=$(".cart_num:checked").length;
		//alert(cnt);
		
		if(cnt==0){
			alert("삭제할 상품을 선택하세요.");
			return;
		}
		
		$(".cart_num:checked").each(function(i,ele){
			
			var cart_num=$(this).attr("cart_num");
			
			//선택한 상품 모두 삭제
			del(cart_num);
		});
		
		location.reload();
	});
	
	//개별 체크할때마다 선택상품가격에 바로 출력되도록
	var cnt=$(".cart_num:checked").length;
	if(cnt==0) $(".selectprice").html("0원");
		
	$(".cart_num").click(function(){
		
		var cnt=$(".cart_num:checked").length;
		if(cnt==0) $(".selectprice").html("0원");
		
	    var price=0;
		
		$(".cart_num:checked").each(function(i,ele){
			price+=parseInt($(this).attr("class_price"));
			$(".selectprice").html(price+"원");
		});
		
	});
		
});

function del(cart_num){
	
	$.ajax({
		type:"get",
		url:"class/cartdelete.jsp",
		dataType:"html",
		data:{"cart_num":cart_num},
		success:function(){
			
		}
	});
}

</script>
</head>
<body>
<%
String myid=(String)session.getAttribute("myid");

ClassDao dao=new ClassDao();
List<HashMap<String,String>> list=dao.getCartList(myid);

NumberFormat nf=NumberFormat.getCurrencyInstance();

MemberDao mdao=new MemberDao();
%>
<div>
<h4>수강바구니</h4>

<table class="carttb table">
  <tr>
    <td colspan="2" align="left">
      <input type="checkbox" id="allcheck"> 전체선택
    </td>
    <td align="right" width="150px;">
      <button type="button" class="delbtn btn btn-light">선택삭제 <i class="fa fa-times" aria-hidden="true"></i></button> 
    </td>
  </tr>
  
  <%
  int totPrice=0;
  for(int i=0;i<list.size();i++)
	{
	  HashMap<String,String> map=list.get(i);
	  
	  int class_price=Integer.parseInt(map.get("class_price"));
	  totPrice+=class_price;%>
	  
	  <tr>
	    <td colspan="2">
	      <input type="checkbox" name="cart_num" class="cart_num" cart_num="<%=map.get("cart_num")%>" class_price=<%=class_price%>>
	      <div class_num="<%=map.get("class_num")%>" class="info">
	        <img src="<%=map.get("class_image") %>" class="img" class_num="<%=map.get("class_num")%>">
	      </div>
	      <div class_num="<%=map.get("class_num")%>" class="info info2">
	        <b><%=map.get("class_name") %></b><br>
	        
	        <%ClassDto dto=dao.getClass(map.get("class_num")); 
	        String gongname=mdao.getGongname(dto.getUser_num());%>
	        
	        <span class="gongname"><%=gongname %></span>
	      </div>	        
	    </td>
	    
	    <td>
	    <span class="del" cart_num="<%=map.get("cart_num")%>"><i class="fa fa-times" aria-hidden="true"></i></span>
	    
	    <%=nf.format(class_price) %>
	    </td>
	  </tr> 
    <%} %>
    
    <tr>
      <td colspan="3" align="right">
        <span class="totprice"><b><%=nf.format(totPrice) %></b></span>
      </td>
    </tr>
</table>

<table class="infotb table table-borderless">
  <tr>
    <th colspan="3">&nbsp;&nbsp;<u>구매자 정보</u></th>
  </tr>
  <tr>
    <td width="100px;">&nbsp;&nbsp;이름</td>
    <td><%=mdao.getName(myid) %></td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;휴대폰 번호</td>
    <td><%=mdao.getPhone(myid) %></td>
  </tr>
</table>

<table class="paytb table table-borderless">
  <tr>
    <td>선택상품금액</td>
    <td class="selectprice"></td>
  </tr>
  <tr>
    <th>총 결제금액</th>
    <th class="endprice"></th>
  </tr>
  <tr>
    <td colspan="2">
      <button type="button" class="paybtn btn btn-success">결제하기</button>
    </td>
  </tr>
</table>
</div>
</body>
</html>