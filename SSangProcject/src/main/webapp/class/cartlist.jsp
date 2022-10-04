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
<%
String user_id=(String)session.getAttribute("myid");

ClassDao dao=new ClassDao();
List<HashMap<String, String>> list=dao.getCartList(user_id);
%>
<style type="text/css">
.table{
   width: 800px;
}
.delbtn{
   float: right;
}
</style>
</head>
<body>
<div>
<h3>수강바구니</h3>
<table class="table">
  <tr>
    <th>
      <input type="checkbox"> 전체선택
      <button type="button" class="delbtn btn btn-light">선택삭제 <i class="fa fa-times" aria-hidden="true"></i></button> 
    </th>
  </tr>
  
  <%NumberFormat nf=NumberFormat.getCurrencyInstance();
  int totPrice=0;
  for(int i=0;i<list.size();i++)
	{
	  HashMap<String,String> map=list.get(i);
	  %>
	  <tr>
	    <td>
	      <input type="checkbox" name="cart_num" class="cart_num" cart_num="<%=map.get("cart_num")%>">
	    </td>
	    <td>
	      <div class_num="<%=map.get("class_num")%>" class="class">
	        <!-- save 폴더 만든 후 경로 활성화 -->
	        <img alt="" src="save/<%=map.get("class_image") %>" class="class_image">
	        <h5><b><%=map.get("class_name") %></b></h5>
	        <span><i class="fa fa-times" aria-hidden="true" cart_num="<%=map.get("cart_num")%>"></i></span>
	      </div>
	    </td>
	    <td>
	    <%int class_price=Integer.parseInt(map.get("class_price"));
	    totPrice+=class_price;%>
	    
	    <h4><%=nf.format(class_price) %></h4>
	    </td>
	  </tr>
    <%}%>
    
    <tr>
      <td colspan="3">
        <span><%=nf.format(totPrice) %></span>
      </td>
    </tr>
</table>
</div>
</body>
</html>