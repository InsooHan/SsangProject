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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://kit.fontawesome.com/a47cf79e39.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style type="text/css">
#alldiv
{
margin-left: 300px;
}

.table
{
width: 800px;
}

#pagecontrol
{
margin-top: 20px;
}
</style>
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

//아이디
String myid=(String)session.getAttribute("myid");

//로그인상태
String loginok=(String)session.getAttribute("loginok");
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
	
	$("#searchtool").keyup(function(e) {
		if(e.keyCode==13){
			//alert("안녕");
			$("#btnsearch").trigger("click");
		}
	});

	
	$("#btnsearch").click(function() {
		//window.history.replaceState({},null,"./adminboardlist.jsp?currentPage=1&searchtool="+search);
		currentPage=1;
		$("#baselistboard").hide();
		list();
		pagebu();
		//var search=$("#searchtool").val();
		
	});
	

	
});

//처음 시작 기본 리스트
function baselist() {
	
	$.ajax({
		type:"get",
		dataType:"json",
		data:{"currentPage":currentPage},
		url:"adminboard/adminboardlistbaseaction.jsp",
		success:function(res){
			//alert(res.length);
			
			var s="<table class='table'>";
			
			$.each(res,function(i,item){
				s+="<tr><th colspan='2' style='font-size: 18pt;'><a href='index.jsp?main=adminboard/adminboarddetail.jsp?ab_num="+item.ab_num+"' style='color:black; text-decoration: none;'><i class='fa-solid fa-clipboard-list' style='color: green;'></i>"+item.ad_subject+"</a></th></tr>";
				s+="<tr style='font-size: 9pt; color: gray;'><td>관리자</td><td style='float:right;'>"+item.ad_date+"</td></tr>";
				
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
		url:"adminboard/adminboardlistaction.jsp",
		success:function(res){
			//alert(currentPage);
			
			var s="<table class='table'>";
			
			$.each(res,function(i,item){
				s+="<tr><th colspan='2' style='font-size: 18pt;'><a href='index.jsp?main=adminboard/adminboarddetail.jsp?ab_num="+item.ab_num+"' style='color:black; text-decoration: none;'><i class='fa-solid fa-clipboard-list' style='color: green;'></i>"+item.ad_subject+"</a></th></tr>";
				s+="<tr style='font-size: 9pt; color: gray;'><td>관리자</td><td>"+item.ad_date+"</td></tr>";
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
		url:"adminboard/adminboardlistpage.jsp",
		success:function(res){
			//alert(res.endPage);
			
			var s="<ul class='pagination'>";
			
			if(res.startPage>1){
				s+="<li class='page-item'><a class='page-link' href='index.jsp?main=adminboard/adminboardlist.jsp?currentPage="+(res.startPage-1)+"&searchtool="+res.searchtool+"'>이전</a></li>";
			}
			for(var pp=res.startPage;pp<=res.endPage;pp++){
				if(pp==res.currentPage){
					s+="<li class='page-item'><a class='page-link' href='index.jsp?main=adminboard/adminboardlist.jsp?currentPage="+pp+"&searchtool="+res.searchtool+"'>"+pp+"</a></li>";
				}else{
					s+="<li class='page-item'><a class='page-link' href='index.jsp?main=adminboard/adminboardlist.jsp?currentPage="+pp+"&searchtool="+res.searchtool+"'>"+pp+"</a></li>";
				}
			}
			if(res.endPage<res.totalPage){
				s+="<li class='page-item'><a class='page-link' href='index.jsp?main=adminboard/adminboardlist.jsp?currentPage="+(res.endPage+1)+"&searchtool="+res.searchtool+"'>다음</a></li>";
			}
			s+="</ul>";
			
			$("#page").html(s);
		}
	});
}

</script>
<body>
<div id="alldiv">
<div class="input-group mb-3" style="width: 500px;">
	<i class="fa-solid fa-magnifying-glass"></i>
	<input type="text" class="form-control" id="searchtool" name="searchtool" style="width: 300px;" placeholder="검색어를 입력해주세요">
	<button type="button" class="btn btn-success" name="btnsearch" id="btnsearch">검색</button>
	<%
	if(loginok!=null){
		if(myid.equals("admin")){
	%>
	<button type="button" class="btn btn-info" onclick="location.href='adminboard/adminboardinsertform.jsp'">글쓰기</button>
	<%
		}
	}
	%>
</div>

<div id="baselistboard"></div>
<div id="listboard"></div>

<div id="pagecontrol"><div style='width: 800px;' class='container mt-3' id='page'></div></div>
</div>
</body>
</html>