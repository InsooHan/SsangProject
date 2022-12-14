<%@page import="dao.ReviewDao"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="dto.ClassDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.ClassDao"%>
<%@page import="dto.Dto"%>
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
.divclass{
   position: absolute;
   left: 50px;
}
.bodydiv{
   position: absolute;
   top: 20px;
   left: 300px;
   width: 900px;
}
.search{
   float: right;
   width: 400px;
}
.classification, .classdiv, #cart, #heart{
   cursor: pointer;
}
.filter{
   width: 270px;
   float: left;
   cursor: pointer;
   font-size: 0.9em;
   margin-top: 10px;
   margin-bottom: 10px;
}
.rank{
   float: right;
}
.listtb{
   width: 900px;
}
.classdiv{
   margin-left: 0px;
   padding-bottom: 30px;
   width: 200px;
}
.img:hover{
   filter: brightness(0.5);
}
.img{
   width: 200px;
   height: 150px;
}
#paging{
   width: 800px;
   margin-left: 380px;
}
.icons{
   font-size: 0.75em;
}
#cart{
   float: right;
}
.blank{
   margin-left: 10px;
   margin-right: 15px;
}
</style>
<%
    ClassDao dao=new ClassDao();
    List<ClassDto> list=dao.getAllDatas();
    NumberFormat nf=NumberFormat.getCurrencyInstance();
    ClassDto dto=new ClassDto();
  
    /* //페이징에 필요한 변수_no빼고 8개는 필수
    int totalCount; //총 게시물 갯수
    int totalPage; //총 페이지 수
    int startPage; //각 블럭의 시작페이지
    int endPage; //각 블럭의 끝페이지
    int start; //각 페이지의 시작번호
    int perPage=8; //한 페이지에 보여질 글의 갯수
    int perBlock=5; //한 블럭당 보여지는 페이지 갯수(1~5,6~10.. 이렇게 페이지 보여지게)
    int currentPage; //현재페이지
    int no;

    //총 갯수:
    totalCount=dao.getTotalCount();

    //현재 페이지번호 읽기(null일 경우는 1페이지로 설정)
    if(request.getParameter("currentPage")==null)
    	currentPage=1;
    else
    	currentPage=Integer.parseInt(request.getParameter("currentPage"));

    //총 페이지갯수 구하기
    totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

    //각 블럭의 시작페이지
    //(현재페이지 3일경우 시작:1,끝:5 / 현재페이지 7일경우 시작:6,끝:10...
    //우리는 한블럭당 보여지는 페이지 갯수 5로 설정했으므로)
    startPage=(currentPage-1)/perBlock*perBlock+1;
    endPage=startPage+perBlock-1;

    //각 블럭의 끝페이지
    //총 페이지수가 8일경우 2번째 블럭은 startpage:6,endpage:10이 아니라 8이 되야함
    if(endPage>totalPage)
    	endPage=totalPage;

    //각 페이지에서 불러올 시작번호
      //현재페이지가 1일경우 start:1, 현재페이지 2일경우 start:6
    start=(currentPage-1)*perPage;

    //각 페이지에서 필요한 게시글 불러오기
    List<ClassDto> list=dao.getList(start, perPage); */
%>
<script type="text/javascript">
$(function(){
	
	//첫 페이지에서 1.전체강의 보이기 2.선택한 분류 안보이기
	allclassfunc();
	$(".cate").hide();
	$(".subcate").hide();
	
	//img 클릭시 디테일페이지로 이동
	$(document).on("click",".img",function(){
		
		var class_num=$(this).attr("class_num");
		location.href="index.jsp?main=class/classdetail.jsp?class_num="+class_num;
	});
	
	<%//카트에 담을때 로그인한 상태여야 하므로
	String loginok=(String)session.getAttribute("loginok");
	//로그인한 id
	String myid=(String)session.getAttribute("myid");
	//id통해서 num 얻기
	MemberDao mdao=new MemberDao();
	String user_num="0";
	if(myid!=null){
		user_num=mdao.getNum(myid);
	}else{
		user_num="0";
	}
	
	System.out.print(user_num);
	%>
	
	//cart 클릭시 카트에 담기
	$(document).on("click","#cart",function(){
		
			$(this).attr("class","fa fa-shopping-cart"); //카트에 클래스 담기
			$(this).css("color","red");
				
			var class_num=$(this).parent().parent().parent().find(".img").attr("class_num");
			var user_num=<%=user_num%>;

			$.ajax({
					
					type:"post",
					url:"class/cartproc.jsp",
					dataType:"html",
					data:{"class_num":class_num,"user_num":user_num},
					success:function(res){
						
						if(confirm("장바구니에 담겼습니다.\n장바구니로 이동하시겠습니까?")){
							location.href="index.jsp?main=class/cartlist.jsp";
						}
					}
				}); 	 	
	});
	
	//난이도 필터 체크시 해당 난이도만 뜨도록
	$("input:radio[name='levels']").change(function(){

		var levels=$("input:radio[name='levels']:checked").val();
		levelsfunc(levels);
		
		if($("a.all").is("checked"))
			console.log($(this));
		
	});
	
	//전체 클릭시 전체리스트
	$(".allclass").click(function(){
		
		allclassfunc();
		$(".cate").hide();
		$(".subcate").hide();
		
	});
	
	//카테고리에 따른 강의리스트 뜨도록
	$("a.all").click(function(){
		
		category=$(this).parent().parent().parent().find("button").text();
		//console.log(category);
		categoryfunc(category);
		
		$(".cate").html("<i class='fa fa-chevron-right' aria-hidden='true'></i>"+category);
		$(".cate").show();
		$(".subcate").hide(); 
		
		//난이도 필터 체크시 해당 난이도만 뜨도록
		$("input:radio[name='levels']").change(function(){

 			var levels=$("input:radio[name='levels']:checked").val();
			//console.log(category+","+levels);
			categorylevelsfunc(category,levels);
			
		});
	
	});
	
	//sub카테고리에 따른 강의리스트 뜨도록
    $("a.sub").click(function(){
		
    	category=$(this).parent().parent().parent().find("button").text();
		var sub_category=$(this).text();
		
		subcategoryfunc(sub_category);
				
		$(".cate").html("<i class='fa fa-chevron-right' aria-hidden='true'></i>"+category);
		$(".cate").show();
		$(".subcate").html("<i class='fa fa-chevron-right' aria-hidden='true'></i>"+sub_category);
		$(".subcate").show();
		
		//난이도 필터 체크시 해당 난이도만 뜨도록
		$("input:radio[name='levels']").change(function(){

 			var levels=$("input:radio[name='levels']:checked").val();
			//console.log(category+","+levels);
			subcategorylevelsfunc(category,sub_category,levels);
			
		});
				
	});
	
	//강의명 입력후 엔터누르면 함수호출
	$("#searchinput").keyup(function(e){
		if(e.keyCode==13)
			searchfunc($(this).val().trim());
	});
	
	//강의명 입력후 검색버튼 클릭시 함수호출
	$("#searchbtn").click(function(){
		searchfunc($("#searchinput").val().trim());
	});
	
});

//사용자함수
//1.전체 리스트_난이도
function levelsfunc(levels){
			
	$.ajax({
		
		type:"post",
		url:"class/listbylevels.jsp", 
		dataType:"json",
		data:{"levels":levels},
		success:function(res){ 
			var i=1; 
			var s="<table><tr>";
			$.each(res,function(idx,item){
				
				s+="<td>";
				s+="<div class='classdiv'>";
				s+="<img src='"+item.class_image+"' class='img' class_num="+item.class_num+"><br>";
				s+="<b>"+item.class_name+"</b><br>";
				// 강사이름 or id, 별점(후기갯수) 
			    s+=item.class_price;
				s+="<div class='icons'>";
				s+="<span><i class='fa fa-signal' aria-hidden='true'></i>"+item.levels+"</span><br>";
				s+="<span><i class='fa fa-folder-open-o' aria-hidden='true'></i>"+item.category+">"+item.sub_category+"</span>";
				s+="<span><i class='fa fa-cart-plus' id='cart' aria-hidden='true'></i></span>";
				s+="</div>";
				s+="</div>";
				s+="</td>";

				if((i+4)%4==0)
					s+="</tr><tr>"; i++;
			});
			
			s+="</tr></table>";
			$(".listtb").html(s);
			
		}
	}); 
}

//2.카테고리 리스트_난이도
function categorylevelsfunc(category,levels){
	
	$.ajax({
		
		type:"post",
		url:"class/listbycategorylevels.jsp",
		dataType:"json",
		data:{"category":category,"levels":levels},
		success:function(res){ 
			var i=1;
			var s="<table><tr>";
			$.each(res,function(idx,item){
				
				s+="<td>";
				s+="<div class='classdiv'>";
				s+="<img src='"+item.class_image+"' class='img' class_num="+item.class_num+"><br>";
				s+="<b>"+item.class_name+"</b><br>";
				// 강사이름 or id, 별점(후기갯수) 
			    s+=item.class_price;
				s+="<div class='icons'>";
				s+="<span><i class='fa fa-signal' aria-hidden='true'></i>"+item.levels+"</span><br>";
				s+="<span><i class='fa fa-folder-open-o' aria-hidden='true'></i>"+item.category+">"+item.sub_category+"</span>";
				s+="<span><i class='fa fa-cart-plus' id='cart' aria-hidden='true'></i></span>";
				s+="</div>";
				s+="</div>";
				s+="</td>";

				if((i+4)%4==0)
					s+="</tr><tr>"; i++;
			});
			
			s+="</tr></table>";
			$(".listtb").html(s);
		}
	}); 
}

//3.서브카테고리 리스트_난이도
function subcategorylevelsfunc(category,sub_category,levels){
	
	$.ajax({
		
		type:"post",
		url:"class/listbysubcategorylevels.jsp", 
		dataType:"json",
		data:{"category":category,"sub_category":sub_category,"levels":levels},
		success:function(res){ 
			var i=1;
			var s="<table><tr>";
			$.each(res,function(idx,item){
				
				s+="<td>";
				s+="<div class='classdiv'>";
				s+="<img src='"+item.class_image+"' class='img' class_num="+item.class_num+"><br>";
				s+="<b>"+item.class_name+"</b><br>";
				// 강사이름 or id, 별점(후기갯수) 
			    s+=item.class_price;
				s+="<div class='icons'>";
				s+="<span><i class='fa fa-signal' aria-hidden='true'></i>"+item.levels+"</span><br>";
				s+="<span><i class='fa fa-folder-open-o' aria-hidden='true'></i>"+item.category+">"+item.sub_category+"</span>";
				s+="<span><i class='fa fa-cart-plus' id='cart' aria-hidden='true'></i></span>";
				s+="</div>";
				s+="</div>";
				s+="</td>";

				if((i+4)%4==0)
					s+="</tr><tr>"; i++;
			});
			
			s+="</tr></table>";
			$(".listtb").html(s);
		}
	}); 
}

//4.전체 리스트
function allclassfunc(){
			
	var class_num=<%=dto.getClass_num()%>;
	var category=<%=dto.getCategory()%>;
	var sub_category=<%=dto.getSub_category()%>;
	var levels=<%=dto.getLevels()%>;
	var class_name=<%=dto.getClass_name()%>;
	var user_num=<%=dto.getUser_num()%>;
	var class_price=<%=dto.getClass_price()%>;
	var class_image=<%=dto.getClass_image()%>;
	var class_video=<%=dto.getClass_video()%>;
	var class_chu=<%=dto.getClass_chu()%>;
	var class_content=<%=dto.getClass_content()%>;
	var reg_date=<%=dto.getReg_date()%>;
		
	var data="class_num="+class_num+"&category="+category+"&sub_category="+sub_category+"&levels="+levels+"&class_name="+class_name+"&user_num="+user_num+"&class_price="+class_price+"&class_image="+class_image+"&class_video"+class_video+"&class_chu="+class_chu+"&class_content="+class_content+"&reg_date="+reg_date;
	$.ajax({
		
		type:"post",
		url:"class/listallclass.jsp", 
		dataType:"json",
		data:{"data":data},
		success:function(res){ 
			var i=1;
			var s="<table><tr>";
			$.each(res,function(idx,item){
				
				s+="<td>";
				s+="<div class='classdiv'>";
				s+="<img src='"+item.class_image+"' class='img' class_num="+item.class_num+"><br>";
				s+="<b>"+item.class_name+"</b><br>";
				/* 강사이름 or id, 별점(후기갯수) */
			    s+=item.class_price;
				s+="<div class='icons'>";
				s+="<span><i class='fa fa-signal' aria-hidden='true'></i>"+item.levels+"</span><br>";
				s+="<span><i class='fa fa-folder-open-o' aria-hidden='true'></i>"+item.category+">"+item.sub_category+"</span>";
				s+="<span><i class='fa fa-cart-plus' id='cart' aria-hidden='true'></i></span>";
				s+="</div>";
				s+="</div>";
				s+="</td>";
				
				if((i+4)%4==0)
					s+="</tr><tr>"; i++;
			});
			
			s+="</tr></table>";
			$(".listtb").html(s);
			
		}
	});
} 

//5.카테고리 필터
function categoryfunc(category){
	
	$.ajax({
		
		type:"post",
		url:"class/listbycategory.jsp", 
		dataType:"json",
		data:{"category":category},
		success:function(res){ 
			var i=1;
			var s="<table><tr>";
			$.each(res,function(idx,item){
				
				s+="<td>";
				s+="<div class='classdiv'>";
				s+="<img src='"+item.class_image+"' class='img' class_num="+item.class_num+"><br>";
				s+="<b>"+item.class_name+"</b><br>";
				/* 강사이름 or id, 별점(후기갯수) */
			    s+=item.class_price;
				s+="<div class='icons'>";
				s+="<span><i class='fa fa-signal' aria-hidden='true'></i>"+item.levels+"</span><br>";
				s+="<span><i class='fa fa-folder-open-o' aria-hidden='true'></i>"+item.category+">"+item.sub_category+"</span>";
				s+="<span><i class='fa fa-cart-plus' id='cart' aria-hidden='true'></i></span>";
				s+="</div>";
				s+="</div>";
				s+="</td>";
				
				if((i+4)%4==0)
					s+="</tr><tr>"; i++;
			});
			
			s+="</tr></table>";
			$(".listtb").html(s);
		}
	});
}

//6.서브카테고리 필터
function subcategoryfunc(sub_category){
	
	$.ajax({
		
		type:"post",
		url:"class/listbysubcategory.jsp", 
		dataType:"json",
		data:{"sub_category":sub_category},
		success:function(res){ 
			var i=1;
			var s="<table><tr>";
			$.each(res,function(idx,item){
				
				s+="<td>";
				s+="<div class='classdiv'>";
				s+="<img src='"+item.class_image+"' class='img' class_num="+item.class_num+"><br>";
				s+="<b>"+item.class_name+"</b><br>";
				/* 강사이름 or id, 별점(후기갯수) */
			    s+=item.class_price;
				s+="<div class='icons'>";
				s+="<span><i class='fa fa-signal' aria-hidden='true'></i>"+item.levels+"</span><br>";
				s+="<span><i class='fa fa-folder-open-o' aria-hidden='true'></i>"+item.category+">"+item.sub_category+"</span>";
				s+="<span><i class='fa fa-cart-plus' id='cart' aria-hidden='true'></i></span>";
				s+="</div>";
				s+="</div>";
				s+="</td>";
				
				if((i+4)%4==0)
					s+="</tr><tr>"; i++;
			});
			
			s+="</tr></table>";
			$(".listtb").html(s);
		}
	});
}

//7.검색 필터
function searchfunc(class_name){
	
	$.ajax({
		
		type:"post",
		url:"class/listbysearch.jsp", 
		dataType:"json",
		data:{"class_name":class_name},
		success:function(res){ 
			var i=1;
			var s="<table><tr>";
			$.each(res,function(idx,item){
				
				s+="<td>";
				s+="<div class='classdiv'>";
				s+="<img src='"+item.class_image+"' class='img' class_num="+item.class_num+"><br>";
				s+="<b>"+item.class_name+"</b><br>";
				/* 강사이름 or id, 별점(후기갯수) */
			    s+=item.class_price;
				s+="<div class='icons'>";
				s+="<span><i class='fa fa-signal' aria-hidden='true'></i>"+item.levels+"</span><br>";
				s+="<span><i class='fa fa-folder-open-o' aria-hidden='true'></i>"+item.category+">"+item.sub_category+"</span>";
				s+="<span><i class='fa fa-cart-plus' id='cart' aria-hidden='true'></i></span>";
				s+="</div>";
				s+="</div>";
				s+="</td>";
				
				if((i+4)%4==0)
					s+="</tr><tr>"; i++;
			});
			
			s+="</tr></table>";
			$(".listtb").html(s);
		}
	});
}
</script>
</head>
<body>
<!-- 강의 분류 -->
<div class="divclass container mt-3">
  <div class="btn-group-vertical">
    <button type="button" class="allclass btn btn-light">전체 강의</button>
    <div class="btn-group">
      <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown">개발/프로그래밍</button>
      <ul class="dropdown-menu">
        <li><a class="all dropdown-item" href="#">ALL</a></li>
        <li><a class="sub dropdown-item" href="#">웹 개발</a></li>
        <li><a class="sub dropdown-item" href="#">프론트엔드</a></li>
        <li><a class="sub dropdown-item" href="#">백엔드</a></li>
      </ul>
    </div>
    <div class="btn-group">
      <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown">보안/네트워크</button>
      <ul class="dropdown-menu">
        <li><a class="all dropdown-item" href="#">ALL</a></li>
        <li><a class="sub dropdown-item" href="#">보안</a></li>
        <li><a class="sub dropdown-item" href="#">네트워크</a></li>
        <li><a class="sub dropdown-item" href="#">시스템</a></li>
      </ul>
    </div>
    <div class="btn-group">
      <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown">데이터 사이언스</button>
      <ul class="dropdown-menu">
        <li><a class="all dropdown-item" href="#">ALL</a></li>
        <li><a class="sub dropdown-item" href="#">데이터 분석</a></li>
        <li><a class="sub dropdown-item" href="#">인공지능</a></li>
        <li><a class="sub dropdown-item" href="#">데이터 시각화</a></li>
      </ul>
    </div>
    <div class="btn-group">
      <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown">게임 개발</button>
      <ul class="dropdown-menu">
        <li><a class="all dropdown-item" href="#">ALL</a></li>
        <li><a class="sub dropdown-item" href="#">게임 프로그래밍</a></li>
        <li><a class="sub dropdown-item" href="#">게임 기획</a></li>
        <li><a class="sub dropdown-item" href="#">게임 아트/그래픽</a></li>
      </ul>
    </div>
     <div class="btn-group">
      <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown">크리에이티브</button>
      <ul class="dropdown-menu">
        <li><a class="all dropdown-item" href="#">ALL</a></li>
        <li><a class="sub dropdown-item" href="#">CAD/3D 모델링</a></li>
        <li><a class="sub dropdown-item" href="#">웹 퍼블리싱</a></li>
        <li><a class="sub dropdown-item" href="#">UX/UI</a></li>
      </ul>
    </div>
  </div>
</div>

<div class="bodydiv">
<!-- 강의 검색창 -->
<div class="search container mt-3">
  <div class="input-group mb-3">
    <input type="text" class="form-control" placeholder="강의 검색하기" id="searchinput">
    <button class="btn btn-success" type="submit" id="searchbtn">검색</button> 
  </div>
</div>

<hr class="hr">

<!-- 분류_DB만들고 추가로 삽입하기-->
<div class="classification">
전체
  <!-- category 삽입,클릭한 값의 것만 보이도록 -->
  <b class=cate></b> 
  <!-- sub_category 삽입,클릭한 값의 것만 보이도록 -->
  <b class=subcate></b> 
</div>

<!-- 필터 -->
<div class="filter container">
    <i class="fa fa-sliders" aria-hidden="true"></i> <strong>필터</strong><span class="blank"></span>
    <input type="radio" class="form-check-input" name="levels" value="입문"> 입문<span class="blank"></span>
    <input type="radio" class="form-check-input" name="levels" value="초급"> 초급<span class="blank"></span>
    <input type="radio" class="form-check-input" name="levels" value="중급"> 중급<span class="blank"></span>
</div>

<!-- 순위 -->
<!-- <div class="rank dropdown">
  <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown">
    순위별
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="#">평점순</a></li>
    <li><a class="dropdown-item" href="#">최신순</a></li>
    <li><a class="dropdown-item" href="#">낮은가격</a></li>
    <li><a class="dropdown-item" href="#">높은가격</a></li>
  </ul>
</div> -->

<!-- 강의 리스트 -->
<table class="listtb table table-borderless"></table>

<!-- 페이징...분류한 이후 기능안먹힘. 재구현 필요 -->
<div class="container-mt3" id="paging">
<%-- <ul class="pagination">
    <%
    //이전
    if(startPage>1)
    {%>
       <li class="page-item active">
         <a class="page-link" href="index.jsp?main=class/classlist.jsp?currentPage=<%=startPage-1%>">이전</a>
       </li>	
    <%}
    
    for(int pp=startPage;pp<=endPage;pp++)
    {
    	if(pp==currentPage)
    	{%>
    	   <li class="page-item active">
    	     <a class="page-link" href="index.jsp?main=class/classlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
    	   </li>	
    	<%}else{%>
    	   	<li>
    	     <a class="page-link" href="index.jsp?main=class/classlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
    	   </li>
    	<%}
    }
    
    //다음
    if(endPage<totalPage)
    {%>
       <li class="page-item active">
         <a class="page-link" href="index.jsp?main=class/classlist.jsp?currentPage=<%=endPage+1%>">다음</a>
       </li>	
    <%}
    %>
  </ul> --%>
</div>

</div>
</body>
</html>