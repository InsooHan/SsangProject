<%@page import="java.text.NumberFormat"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="dto.ClassDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.ClassDao"%>
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
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://kit.fontawesome.com/4f8084f592.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style type="text/css">
.table{float: left;}
input.form-check-input{margin-left: 8px;}
.allcheck{margin-left: 40px;}
.carttb, h4{
   width: 750px;
   margin-left: 100px;
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
.kakaopay, .kginicis{
   width: 100px;
   height: 50px;
   border-radius: 20px;
   margin-left: 40px;
}
#video{
   width: 400px;
   height: 300px;
   margin: 0 auto;
   cursor: pointer;
}
#play{
   float: right;
   color: green;
   font-size: 1.5em;
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
		
		//바로 선택상품가격에 바로 출력되도록, 전체상품가격에도 출력
		var cnt=$(".cart_num:checked").length;
		if(cnt==0) {
			$(".selectprice").html("0");
			$(".endprice").html("0");
		}
		
		var price=0;
		
		$(".cart_num:checked").each(function(i,ele){
			price+=parseInt($(this).attr("class_price"));
			$(".selectprice").html(price.toLocaleString('ko-KR'));
			$(".endprice").html(price.toLocaleString('ko-KR'));
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
	
	//개별 체크할때마다 선택상품가격에 바로 출력되도록,전체상품가격에도 출력
	var cnt=$(".cart_num:checked").length;
	if(cnt==0){
		$(".selectprice").html("0");
		$(".endprice").html("0");
	}
		
	$(".cart_num").click(function(){ 
		
		var cnt=$(".cart_num:checked").length;
		if(cnt==0) {
			$(".selectprice").html("0");
			$(".endprice").html("0");
		}
		
	    var price=0;
		
		$(".cart_num:checked").each(function(i,ele){
			price+=parseInt($(this).attr("class_price"));
			$(".selectprice").html(price.toLocaleString('ko-KR'));
			$(".endprice").html(price.toLocaleString('ko-KR'));
		});
		
	});
	
	//Tooltip
	// Initialize tooltips
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
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
<%
String myid=(String)session.getAttribute("myid");

ClassDao dao=new ClassDao();
List<HashMap<String,String>> list=dao.getCartList(myid);

NumberFormat nf=NumberFormat.getCurrencyInstance();
MemberDao mdao=new MemberDao();
%>
<body>
<div class="container mt-3">
  <h2>MyPage</h2>
  <br>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-bs-toggle="tab" href="#home">내 학습</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#menu1">수강바구니</a>
    </li> 
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="home" class="container tab-pane active"><br>
      <div class="container mt-3">
        <div class="alert alert-success">
           수강신청한 학습의 <strong>무료회차</strong>를 보실 수 있습니다.
        </div>
      </div>
      <p>
        <table class="table table-borderless"><tr>
        <% int s=1;
        for(int i=0;i<list.size();i++)
        {
           HashMap<String,String> map=list.get(i);
           ClassDto dto=dao.getClass(map.get("class_num")); 
            String video=dto.getClass_video();
            String thumbnail=dto.getClass_image();
	        String gongname=mdao.getGongname(dto.getUser_num()); %>
           <td>
           <video src="<%=request.getContextPath()%>/<%=video %>" 
           poster="<%=thumbnail %>" id="video" onclick="location.href='index.jsp?main=class/classdetail.jsp?class_num=<%=dto.getClass_num()%>'"></video>
           <h5><b><%=map.get("class_name") %></b></h5>
           <i class="fa fa-graduation-cap" aria-hidden="true"></i><%=gongname %>
           <a href="<%=request.getContextPath()%>/<%=video %>" target="_blank"><i class="fa fa-play-circle" aria-hidden="true" id="play"></i></a>
           </td>
          
          <% if((s+3)%3==0) %> </tr><tr> <%s++; %>
           
        <%}
        %>
        </tr></table>
      </p>
            
    </div>
    <div id="menu1" class="container tab-pane fade"><br>
      <p>
      
      <div>
<h4>수강바구니</h4>

<table class="carttb table">
  <tr>
    <td colspan="2" align="left">
      <input type="checkbox" class="form-check-input" id="allcheck"> 
      <label class="allcheck"> 전체선택</label>
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
	      <input type="checkbox" name="cart_num" class="cart_num form-check-input" cart_num="<%=map.get("cart_num")%>" class_price=<%=class_price%>>
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
    <td><span class="selectprice"></span>원</td>
  </tr>
  <tr>
    <th>총 결제금액</th>
    <th><span class="endprice"></span>원</th>
  </tr>
  <!-- <tr>
    <td colspan="2">
      <button type="button" class="btn btn-success" onclick="window.open('class/paymentpage.jsp','',
    		  'width=400,height=200,left=500,top=300')">결제하기</button>
    </td>
  </tr> -->
  <tr>
    <td colspan="2" rowspan="2">
    <div class="container mt-3">
      <button type="button" class="paybtn btn" data-bs-toggle="tooltip" title="카카오페이로 결제하기">
      <img src="image/kakaopay.png" class="kakaopay"></button>
      <button type="button" class="inicisbtn btn" data-bs-toggle="tooltip" title="KG이니시스로 결제하기">
      <img src="image/kginicis.jpeg" class="kginicis"></button>
    </div>
    </td>
  </tr>
</table>

<script type="text/javascript">
//카카오페이
IMP.init('imp32367747');

$(".paybtn").click(function(){
	IMP.request_pay({
		
		pg: "kakaopay",
		pay_method: "card",
		merchant_uid: "iamport_sist4_id(1)",
		name: "온라인 강의",
		amount: $(".endprice").html(),
		buyer_name: "<%=mdao.getName(myid)%>",
		buyer_tel: "<%=mdao.getPhone(myid) %>"
	}, function(rsp){
		console.log(rsp);
		
		if(rsp.success){
			
			var msg="결제가 완료되었습니다.";
			//msg+="\n고유ID : " + rsp.imp_uid;
			//msg+="\n상점거래ID : " + rsp.merchant_uid; 
			msg+="\n결제금액 : " + rsp.paid_amount + " 원";
			
			location.href="index.jsp?main=class/paysuccess.jsp?msg="+msg;
			} else {
			
			var msg="결제에 실패하였습니다.";
			msg+=rsp.error_msg;
			
			//실패시 reload
			location.reload();
			}
		    alert(msg);
	});	
});

//KG이니시스
$(".inicisbtn").click(function(){
	IMP.request_pay({
		
		pg: "html5_inicis",
		pay_method: "card",
		merchant_uid: "iamport_sist4_id(2)",
		name: "온라인 강의",
		amount: $(".endprice").html(),
		buyer_name: "<%=mdao.getName(myid)%>",
		buyer_tel: "<%=mdao.getPhone(myid) %>"
	}, function(rsp){
		console.log(rsp);
		
		if(rsp.success){
			
			var msg="결제가 완료되었습니다.";
			//msg+="\n고유ID : " + rsp.imp_uid;
			//msg+="\n상점거래ID : " + rsp.merchant_uid; 
			msg+="\n결제금액 : " + rsp.paid_amount + " 원";
			
			location.href="index.jsp?main=class/paysuccess.jsp?msg="+msg;
			} else {
			
			var msg="결제에 실패하였습니다.";
			msg+=rsp.error_msg;
			
			//실패시 reload
			location.reload();
			}
		    alert(msg);
	});	
});
</script>

</div>
      
      </p>
    </div>
  </div>
</div>
</body>
</html>