<%@page import="java.text.NumberFormat"%>
<%@page import="dto.TclassDto"%>
<%@page import="dao.TclassDao"%>
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
.bodydiv{
   position: absolute;
   top: 20px;
   left: 250px;
   width: 1050px;
}
.search{
   float: right;
   width: 400px;
}
.hr{
   width: 1050px;
}
.classification, .classdiv, #cart, #heart{
   cursor: pointer;
}
.filter{
   width: 270px;
   float: left;
   cursor: pointer;
   font-size: 0.9em;
}
.rank{
   top: 20px;
   float: right;
}
.listtb{
   width: 1050px;
}
.classdiv{
   margin-left: 20px;
   padding-bottom: 30px;
}
.img:hover{
   filter: brightness(0.5);
}
.img{
   width: 200px;
}
.paging{
   width: 800px;
   margin-left: 380px;
}
.icons{
   font-size: 0.75em;
}
#cart{
   margin-left: 30px;
}
#heart{
   margin-left: 5px;
}
</style>
<%
    ClassDao dao=new ClassDao();
    //List<ClassDto> list=dao.getAllDatas();
    NumberFormat nf=NumberFormat.getCurrencyInstance();
  
    //페이징에 필요한 변수_no빼고 8개는 필수
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
    List<ClassDto> list=dao.getList(start, perPage);
%>
<script type="text/javascript">
$(function(){
	
	//img 클릭시 디테일페이지로 이동..디테일페이지 파일생성후 작업필요
	$(".img").click(function(){
		var a=$(this).attr("class_num");
		alert(a);
		
	});
	
	//cart 클릭시 장바구니에 추가..카트에 담고 빼는 작업필요
	$("#cart").click(function(){
		
		var cla=$(this).attr("class");
		if(cla=="fa fa-shopping-cart")
			$(this).attr("class","fa fa-cart-plus"); //카트에 담겨있던 클래스를 다시 제거
			$(this).css("color","black");
		if(cla=="fa fa-cart-plus"){
			$(this).attr("class","fa fa-shopping-cart"); //카트에 클래스 담기
			$(this).css("color","red");
		}
			
	});
	
	//heart 클릭시 좋아요에 추가..좋아요에 담고 빼는 작업필요
    $("#heart").click(function(){
		
    	var cla=$(this).attr("class");
		if(cla=="fa fa-heart")
			$(this).attr("class","fa fa-heart-o"); //좋아요에 담겨있던 클래스를 다시 제거
			$(this).css("color","black");
		if(cla=="fa fa-heart-o"){
			$(this).attr("class","fa fa-heart"); //카트에 클래스 담기
			$(this).css("color","red"); 
		}
	});
	
	//난이도 필터 체크시 해당 난이도만 뜨도록..구현해야함
	/* $("input:checkbox[name='levels']").change(function(){

		$("input:checkbox[name='levels']:checked").each(function(){
			
			var levels=$(this).val();
			console.log(levels);
			
			$.ajax({
			
			type:"post",
			url:"listbylevels.jsp",
			dataType:"json",
			data:{"levels":levels},
			success:function(res){
				alert("ye")
			}
		  });
		}); 
	}); */
	
	//카테고리에 따른 강의리스트 뜨도록
	
	//sub카테고리에 따른 강의리스트 뜨도록
	
});
</script>
</head>
<body>
<!-- 강의 분류 -->
<div class="container mt-3">
  <div class="btn-group-vertical">
    <button type="button" class="btn btn-light">전체 강의</button>
    <div class="btn-group">
      <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown">개발/프로그래밍</button>
      <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="#">ALL</a></li>
        <li><a class="dropdown-item" href="#">HTML/CSS</a></li>
        <li><a class="dropdown-item" href="#">JavaScript</a></li>
        <li><a class="dropdown-item" href="#">Python</a></li>
        <li><a class="dropdown-item" href="#">PHP</a></li>
        <li><a class="dropdown-item" href="#">MySQL</a></li>
      </ul>
    </div>
    <div class="btn-group">
      <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown">보안/네트워크</button>
      <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="#">ALL</a></li>
        <li><a class="dropdown-item" href="#">보안</a></li>
        <li><a class="dropdown-item" href="#">네트워크</a></li>
        <li><a class="dropdown-item" href="#">클라우드</a></li>
        <li><a class="dropdown-item" href="#">블록체인</a></li>
      </ul>
    </div>
    <div class="btn-group">
      <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown">데이터 사이언스</button>
      <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="#">ALL</a></li>
        <li><a class="dropdown-item" href="#">데이터 분석</a></li>
        <li><a class="dropdown-item" href="#">인공지능</a></li>
        <li><a class="dropdown-item" href="#">데이터 시각화</a></li>
        <li><a class="dropdown-item" href="#">데이터 수집</a></li>
      </ul>
    </div>
    <div class="btn-group">
      <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown">게임 개발</button>
      <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="#">ALL</a></li>
        <li><a class="dropdown-item" href="#">게임 프로그래밍</a></li>
        <li><a class="dropdown-item" href="#">게임 기획</a></li>
        <li><a class="dropdown-item" href="#">게임 아트</a></li>
      </ul>
    </div>
     <div class="btn-group">
      <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown">커리어</button>
      <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="#">ALL</a></li>
        <li><a class="dropdown-item" href="#">취업</a></li>
        <li><a class="dropdown-item" href="#">이직</a></li>
        <li><a class="dropdown-item" href="#">브랜딩</a></li>
      </ul>
    </div>
    <div class="btn-group">
      <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown">학문/외국어</button>
      <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="#">ALL</a></li>
        <li><a class="dropdown-item" href="#">영어</a></li>
        <li><a class="dropdown-item" href="#">일본어</a></li>
        <li><a class="dropdown-item" href="#">프랑스어</a></li>
        <li><a class="dropdown-item" href="#">이탈리아어</a></li>
      </ul>
    </div>
  </div>
</div>

<div class="bodydiv">
<!-- 강의 검색창 -->
<div class="search container mt-3">
  <div class="input-group mb-3">
    <input type="text" class="form-control" placeholder="강의 검색하기">
    <button class="btn btn-success" type="submit">검색</button> 
  </div>
</div>

<hr class="hr">

<!-- 분류_DB만들고 추가로 삽입하기-->
<div class="classification">
전체
  <!-- category 삽입,클릭한 값의 것만 보이도록 -->
  <b><i class="fa fa-chevron-right" aria-hidden="true"></i></b> 
  <!-- sub_category 삽입,클릭한 값의 것만 보이도록 -->
  <b><i class="fa fa-chevron-right" aria-hidden="true"></i></b> 
</div>

<!-- 필터 -->
<div class="filter container mt-3">
  <div class="alert alert-light">
    <i class="fa fa-sliders" aria-hidden="true"></i> <strong>필터 </strong>
    <input type="checkbox" name="levels" value="입문"> 입문</input>
    <input type="checkbox" name="levels" value="초급"> 초급</input>
    <input type="checkbox" name="levels" value="중급"> 중급</input>
  </div>
</div>

<!-- 순위 -->
<div class="rank dropdown">
  <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown">
    순위별
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="#">평점순</a></li>
    <li><a class="dropdown-item" href="#">최신순</a></li>
    <li><a class="dropdown-item" href="#">낮은가격</a></li>
    <li><a class="dropdown-item" href="#">높은가격</a></li>
  </ul>
</div>

<!-- 강의 리스트 -->
<table class="listtb table table-borderless">
   <tr>
    <%int i=1;
    
    for(ClassDto dto:list)
    {%>
    <td>
    <div class="classdiv">
      <img alt="" src="thumbnail.png" class="img" class_num="<%=dto.getClass_num()%>"><br>
      <b><%=dto.getClass_name() %></b><br>
      <!-- 강사이름 or id, 별점(후기갯수) -->
      <%=nf.format(dto.getClass_price()) %>
      <div class="icons">
        <span><i class="fa fa-signal" aria-hidden="true"></i><%=dto.getLevels() %></span><br>
        <span><i class="fa fa-folder-open-o" aria-hidden="true"></i><%=dto.getCategory() %>><%=dto.getSub_category() %></span>
        <span><i class="fa fa-cart-plus" id="cart" aria-hidden="true"></i></span>
        <span><i class="fa fa-heart-o" id="heart" aria-hidden="true"></i></span>
      </div>
    </div>
    </td>
    
    <%if((i+4)%4==0){%> </tr><tr> <%} i++;
    
    } %>
  </tr>
</table>

<!-- 페이징 -->
<div class="paging container mt-3">
  <ul class="pagination">
    <%
    //이전
    if(startPage>1)
    {%>
       <li class="page-item active">
         <a class="page-link" href="classlist.jsp?currentPage=<%=startPage-1%>">이전</a>
       </li>	
    <%}
    
    for(int pp=startPage;pp<=endPage;pp++)
    {
    	if(pp==currentPage)
    	{%>
    	   <li class="page-item active">
    	     <a class="page-link" href="classlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
    	   </li>	
    	<%}else{%>
    	   	<li>
    	     <a class="page-link" href="classlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
    	   </li>
    	<%}
    }
    
    //다음
    if(endPage<totalPage)
    {%>
       <li class="page-item active">
         <a class="page-link" href="classlist.jsp?currentPage=<%=endPage+1%>">다음</a>
       </li>	
    <%}
    %>
  </ul>
</div>

</div>
</body>
</html>