<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.AdminboardDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.AdminboardDao"%>
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
</head>
<%
int currentPage;

if(request.getParameter("currentPage")==null)
	currentPage=1;
else
	currentPage=Integer.parseInt(request.getParameter("currentPage"));

String search="";

if(request.getParameter("searchtool")!=null){
	search=request.getParameter("searchtool");
}else{
	search="nosearch";
}
%>
<script type="text/javascript">
$(function() {
	
	currentPage=<%=currentPage%>;
	var searchtest="<%=search%>";
	
	if(searchtest!="nosearch"){
		$("#searchtool").val(searchtest);
	}
	
	
	search=$("#searchtool").val();
	
	//alert(search);
	
	if(search==""){
		baselist();
	}else{
		list();
	}
	
	pagebu();

	
	$("#btnsearch").click(function() {
		//window.history.replaceState({},null,"./adminboardlist.jsp?currentPage=1&searchtool="+search);
		currentPage=1;
		$("#baselistboard").hide();
		list();
		pagebu();
		//var search=$("#searchtool").val();
		
	});
	
	$("#btntest").click(function() {
		list();
	});
	
	$("#btntesttest").click(function() {
		var searchtst=$("#searchtool").val();
		
		alert(searchtst);
	});
	
});

//처음 시작 기본 리스트
function baselist() {
	
	$.ajax({
		type:"get",
		dataType:"json",
		data:{"currentPage":currentPage},
		url:"adminboardlistbaseaction.jsp",
		success:function(res){
			//alert(res.length);
			
			var s="<table>";
			
			$.each(res,function(i,item){
				s+="<tr><td>"+(i+1)+"</td></tr>";
				s+="<tr><td>"+item.ad_id+"</td></tr>";
				s+="<tr><td>"+item.ad_subject+"</td></tr>";
				s+="<tr><td>"+item.ad_content+"</td></tr>";
				
			});

			s+="</table>";
			
			$("#baselistboard").html(s);
		}
	});
}

//검색을 하면 출력되는 리스트
function list() {
	var searchtool=$("#searchtool").val();
	
	//새로운 시도
	//var state={start:"start",perpage:"perpage",searchtool:"searchtool"};
	//window.history.replaceState(state,null,"./adminboardlist.jsp");

	$.ajax({
		type:"get",
		dataType:"json",
		data:{"searchtool":searchtool,"currentPage":currentPage},
		url:"adminboardlistaction.jsp",
		success:function(res){
			//alert(currentPage);
			
			var s="<table>";
			
			$.each(res,function(i,item){
				s+="<tr><td>"+(i+1)+"</td></tr>";
				s+="<tr><td>"+item.ad_id+"</td></tr>";
				s+="<tr><td>"+item.ad_subject+"</td></tr>";
				s+="<tr><td>"+item.ad_content+"</td></tr>";
			});
			
			s+="</table>";
			
			$("#searchtool").val(searchtool);
			$("#listboard").html(s);
			
		}
	});
}

//ajax page 버튼
function pagebu() {
	var searchtool=$("#searchtool").val();
	//alert(searchtool);
	
	$.ajax({
		type:"get",
		dataType:"json",
		data:{"searchtool":searchtool},
		url:"adminboardlistpage.jsp",
		success:function(res){
			//alert(res.endPage);
			
			var s="<ul class='pagination'>";
			
			if(res.startPage>1){
				s+="<li><a href='adminboardlist.jsp?currentPage="+(res.startPage-1)+"&searchtool="+res.searchtool+"'>이전</a></li>";
			}
			for(var pp=res.startPage;pp<=res.endPage;pp++){
				if(pp==res.currentPage){
					s+="<li class='active'><a href='adminboardlist.jsp?currentPage="+pp+"&searchtool="+res.searchtool+"'>"+pp+"</a></li>";
				}else{
					s+="<li class='active'><a href='adminboardlist.jsp?currentPage="+pp+"&searchtool="+res.searchtool+"'>"+pp+"</a></li>";
				}
			}
			if(res.endPage<res.totalPage){
				s+="<li><a href='adminboardlist.jsp?currentPage="+(res.endPage+1)+"&searchtool="+res.searchtool+"'>다음</a></li>";
			}
			s+="</ul>";
			
			$("#page").html(s);
		}
	});
}

</script>
<body>
<input type="text" id="searchtool" name="searchtool" style="width: 300px;">
<button type="button" class="btn btn-success" name="btnsearch" id="btnsearch">검색</button>

<button type="button" id="btntest">테스트</button>
<button type="button" id="btntesttest">테스트2</button>

<div id="baselistboard"></div>
<div id="listboard"></div>

<div style='width: 800px;' class='container' id='page'></div>
</body>
</html>