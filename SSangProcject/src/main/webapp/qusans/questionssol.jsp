<%@page import="dto.QusAnsAnswerDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.QusAnsAnswerDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.QuestionDto"%>
<%@page import="dao.QusAnsDao"%>
<%@page import="db.DbConnect"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<script type="text/javascript">

$(document).ready(function(){
	$(".e-new-question").on("click",function(){
		location.href="index.jsp?main=qusans/qusans_write.jsp?part=question";
	});
	
	$(".e-popular-tag").click(function() {
		
		var newtag=$(this).find(".ac-tag__name").text();
		//alert(newtag);
		$("#search").val(newtag);
	});
});


</script>
    

<%
String search=request.getParameter("search");
if(search==null)
	 search="";
// 임시로  아이디와  수강중인 과정에 대한 값 설정 ( 회원가입이 이루어지고 과정 신청 내용이 있어야 함)
String[] ids ={"ah","is","dh","jh","yj","jh2"};

session.setAttribute("id", ids[ (int)(Math.random()*6) ]);




	int pagesize = 20;  //한페이지 표시수
	int grpsize	= 10; // 페이징 번호수
	int pagenum	= 1; // 시작페이지
	int pagecount = 1; // 시작
	int skiprow = 1; // 시작
	int DBcount=0;  // 전체 갯수

	Connection conn=null;
	DbConnect db = new DbConnect();
	try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = db.getConnection();
	}catch(Exception e){
	e.printStackTrace();
	}
	
String sql="select count(que_num) as cnt from Question";
try{	
	PreparedStatement pt = conn.prepareStatement(sql);  //전체 DB 갯수 구하기
	ResultSet rs = pt.executeQuery();
	if(rs.next()){
		DBcount = rs.getInt("cnt");
	}
}catch(SQLException e){
	e.printStackTrace();
}

if(DBcount % pagesize ==0 ){        //총페이지수 계산
	pagecount = DBcount / pagesize;
}else{
	pagecount = DBcount/pagesize + 1;
}

int reqpage= 0;    //요청 페이지번호 구하기
if(request.getParameter("pagenum") == null){
	reqpage = 1;
}else
	reqpage= Integer.parseInt(request.getParameter("pagenum")); 
	skiprow=(reqpage-1) * pagesize +1;

	
	
ArrayList<QuestionDto> nowP_list = new ArrayList<>(); 
sql = "select * from Question where que_subject like ? order by que_sol desc";
try{	
	PreparedStatement pt = conn.prepareStatement(sql);
	pt.setString(1, "%"+search+"%");
	ResultSet rs = pt.executeQuery();
	while(rs.next()){
		QuestionDto data = new QuestionDto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getTimestamp(6),rs.getInt(7),rs.getInt(8));
		
		nowP_list.add(data);
	}
	
}catch(SQLException e){
	e.printStackTrace();
}
Iterator<QuestionDto> it = nowP_list.iterator();
while(it.hasNext()){
	QuestionDto data = it.next();
	sql="select count(ans_num) as cnt from Answer where que_num=?";
	try{	
		PreparedStatement pt = conn.prepareStatement(sql);
		pt.setInt(1,data.getQue_num());
		ResultSet rs = pt.executeQuery();
		if(rs.next()){
			data.setAnswer_cnt(rs.getInt("cnt"));
		}
		
	}catch(SQLException e){
		e.printStackTrace();
	}
}

%>    


<jsp:include page="qusan_st.jsp"/>
<link rel="stylesheet" href="../static/css/question.css">
<script src="../static/js/question.js"></script>

<body>
 <section class="community-header" style="text-align: center; background-color: black;">
    <div class="community-header__content" style="padding-top: 20px; padding-bottom: 20px;">
      <b class="community-header__title" style="color: white; font-size: 2em;">묻고 답해요</b>
      <br><br>
      <p class="community-header__sub-title" style="font-size: 11pt;">97만명의 커뮤니티!! 함께 토론해봐요.</p>
    </div>
  </section>
  

  <div class="realpop" style="width: 250px; float: right; position: absolute; right: 270px; top: 200px; ">
    <b class="popular-tags__title" style="font-size: 1.2em; text-align: center;">인기 검색어</b>
    <br><br>
    <ul class="popular-tags__tag-list" style="list-style: none; line-height: 1.5em;">
      <li class="popular-tags__tag " style="float: left; margin: 1.5px 1.5px 1.5px 1.5px;">
        
    <button class="ac-button is-sm is-solid is-gray e-popular-tag ac-tag ac-tag--blue  "   ><span class="ac-tag__hashtag">#&nbsp;</span><span class="ac-tag__name">오류</span></button>
      </li>
      <li class="popular-tags__tag " style="float: left; margin: 1.5px 1.5px 1.5px 1.5px;">
        
    <button class="ac-button is-sm is-solid is-gray e-popular-tag ac-tag ac-tag--blue  "   ><span class="ac-tag__hashtag">#&nbsp;</span><span class="ac-tag__name">질문</span></button>
      </li>
      <li class="popular-tags__tag " style="float: left; margin: 1.5px 1.5px 1.5px 1.5px;">
        
    <button class="ac-button is-sm is-solid is-gray e-popular-tag ac-tag ac-tag--blue  "   ><span class="ac-tag__hashtag">#&nbsp;</span><span class="ac-tag__name">파이썬</span></button>
      </li>
      <li class="popular-tags__tag " style="float: left; margin: 1.5px 1.5px 1.5px 1.5px;">
        
    <button class="ac-button is-sm is-solid is-gray e-popular-tag ac-tag ac-tag--blue  "   ><span class="ac-tag__hashtag">#&nbsp;</span><span class="ac-tag__name">JPA</span></button>
      </li>
      <li class="popular-tags__tag " style="float: left; margin: 1.5px 1.5px 1.5px 1.5px;">
        
    <button class="ac-button is-sm is-solid is-gray e-popular-tag ac-tag ac-tag--blue  "   ><span class="ac-tag__hashtag">#&nbsp;</span><span class="ac-tag__name">에러</span></button>
      </li>
      <li class="popular-tags__tag " style="float: left; margin: 1.5px 1.5px 1.5px 1.5px;">
        
    <button class="ac-button is-sm is-solid is-gray e-popular-tag ac-tag ac-tag--blue  "   ><span class="ac-tag__hashtag">#&nbsp;</span><span class="ac-tag__name">jpa</span></button>
      </li>
      <li class="popular-tags__tag " style="float: left; margin: 1.5px 1.5px 1.5px 1.5px;">
        
    <button class="ac-button is-sm is-solid is-gray e-popular-tag ac-tag ac-tag--blue  "   ><span class="ac-tag__hashtag">#&nbsp;</span><span class="ac-tag__name">react</span></button>
      </li>
      <li class="popular-tags__tag " style="float: left; margin: 1.5px 1.5px 1.5px 1.5px;">
        
    <button class="ac-button is-sm is-solid is-gray e-popular-tag ac-tag ac-tag--blue  "   ><span class="ac-tag__hashtag">#&nbsp;</span><span class="ac-tag__name">강의자료</span></button>
      </li>
      <li class="popular-tags__tag " style="float: left; margin: 1.5px 1.5px 1.5px 1.5px;">
        
    <button class="ac-button is-sm is-solid is-gray e-popular-tag ac-tag ac-tag--blue  "   ><span class="ac-tag__hashtag">#&nbsp;</span><span class="ac-tag__name">vue</span></button>
      </li>
      <li class="popular-tags__tag " style="float: left; margin: 1.5px 1.5px 1.5px 1.5px;">
        
    <button class="ac-button is-sm is-solid is-gray e-popular-tag ac-tag ac-tag--blue  "   ><span class="ac-tag__hashtag">#&nbsp;</span><span class="ac-tag__name">spring</span></button>
      </li>
      <li class="popular-tags__tag tag--mobile-hidden" style="float: left; margin: 1.5px 1.5px 1.5px 1.5px;">
        
    <button class="ac-button is-sm is-solid is-gray e-popular-tag ac-tag ac-tag--blue  "   ><span class="ac-tag__hashtag">#&nbsp;</span><span class="ac-tag__name">스프링</span></button>
      </li>
      <li class="popular-tags__tag tag--mobile-hidden" style="float: left; margin: 1.5px 1.5px 1.5px 1.5px;">
        
    <button class="ac-button is-sm is-solid is-gray e-popular-tag ac-tag ac-tag--blue  "   ><span class="ac-tag__hashtag">#&nbsp;</span><span class="ac-tag__name">python</span></button>
      </li>
      <li class="popular-tags__tag tag--mobile-hidden" style="float: left; margin: 1.5px 1.5px 1.5px 1.5px;">
        
    <button class="ac-button is-sm is-solid is-gray e-popular-tag ac-tag ac-tag--blue  "   ><span class="ac-tag__hashtag">#&nbsp;</span><span class="ac-tag__name">java</span></button>
      </li>
      <li class="popular-tags__tag tag--mobile-hidden" style="float: left; margin: 1.5px 1.5px 1.5px 1.5px;">
        
    <button class="ac-button is-sm is-solid is-gray e-popular-tag ac-tag ac-tag--blue  "   ><span class="ac-tag__hashtag">#&nbsp;</span><span class="ac-tag__name">error</span></button>
      </li>
      <li class="popular-tags__tag tag--mobile-hidden" style="float: left; margin: 1.5px 1.5px 1.5px 1.5px;">
        
    <button class="ac-button is-sm is-solid is-gray e-popular-tag ac-tag ac-tag--blue  "   ><span class="ac-tag__hashtag">#&nbsp;</span><span class="ac-tag__name">css</span></button>
      </li>
      <li class="popular-tags__tag tag--mobile-hidden" style="float: left; margin: 1.5px 1.5px 1.5px 1.5px;">
        
    <button class="ac-button is-sm is-solid is-gray e-popular-tag ac-tag ac-tag--blue  "   ><span class="ac-tag__hashtag">#&nbsp;</span><span class="ac-tag__name">html</span></button>
      </li>
      <li class="popular-tags__tag tag--mobile-hidden" style="float: left; margin: 1.5px 1.5px 1.5px 1.5px;">
        
    <button class="ac-button is-sm is-solid is-gray e-popular-tag ac-tag ac-tag--blue  "   ><span class="ac-tag__hashtag">#&nbsp;</span><span class="ac-tag__name">django</span></button>
      </li>
      <li class="popular-tags__tag tag--mobile-hidden" style="float: left; margin: 1.5px 1.5px 1.5px 1.5px;">
        
    <button class="ac-button is-sm is-solid is-gray e-popular-tag ac-tag ac-tag--blue  "   ><span class="ac-tag__hashtag">#&nbsp;</span><span class="ac-tag__name">docker</span></button>
      </li>
      <li class="popular-tags__tag tag--mobile-hidden" style="float: left; margin: 1.5px 1.5px 1.5px 1.5px;">
        
    <button class="ac-button is-sm is-solid is-gray e-popular-tag ac-tag ac-tag--blue  "   ><span class="ac-tag__hashtag">#&nbsp;</span><span class="ac-tag__name">리액트</span></button>
      </li>
      <li class="popular-tags__tag tag--mobile-hidden" style="float: left; margin: 1.5px 1.5px 1.5px 1.5px;">
        
    <button class="ac-button is-sm is-solid is-gray e-popular-tag ac-tag ac-tag--blue  "   ><span class="ac-tag__hashtag">#&nbsp;</span><span class="ac-tag__name">javascript</span></button>
      </li>
    </ul>
  </div>

<div class="community-body__content">
        <div class="search-filter">
          <ul class="status">
    <li class="e-status" data-status="">
      
    <button class="ac-button is-md is-text" onclick="location.href='index.jsp?main=qusans/questions.jsp'">전체</button>
    </li>
    <li class="e-status " data-status="unresolved">
      
    <button class="ac-button is-md is-text" onclick="location.href='index.jsp?main=qusans/questionssolsol.jsp'">미해결</button>
    </li>
    <li class="e-status " data-status="resolved">
      
    <button class="ac-button is-md is-text active">해결됨</button>
    </li></ul>
          
  <form class="search e-search" action="index.jsp?main=qusans/questionssearch.jsp" method="post">
    <div class="search-item">
      
    <div class="ac-input-with-item search-by-text e-search-input ">
      <svg width="16" height="16" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path fill="#212529" fill-rule="evenodd" clip-rule="evenodd" d="M11.5 7c0 .59-.116 1.176-.343 1.722-.226.546-.557 1.042-.975 1.46-.418.418-.914.75-1.46.975-.546.226-1.131.343-1.722.343-.59 0-1.176-.117-1.722-.343-.546-.226-1.042-.557-1.46-.975-.418-.418-.75-.914-.975-1.46C2.616 8.176 2.5 7.591 2.5 7c0-1.194.474-2.338 1.318-3.182C4.662 2.974 5.807 2.5 7 2.5c1.193 0 2.338.474 3.182 1.318C11.026 4.662 11.5 5.806 11.5 7zm-.82 4.74c-1.206.936-2.723 1.377-4.242 1.234-1.52-.143-2.928-.86-3.937-2.005C1.49 9.825.956 8.34 1.004 6.813c.047-1.526.675-2.976 1.754-4.055 1.08-1.08 2.53-1.707 4.055-1.755 1.525-.047 3.012.488 4.156 1.498 1.145 1.01 1.862 2.417 2.005 3.937.143 1.52-.298 3.036-1.234 4.242l3.04 3.04c.074.069.133.151.174.243.04.092.063.192.065.292.001.101-.017.201-.055.294-.038.094-.094.179-.165.25-.071.071-.156.127-.25.165-.093.038-.193.056-.293.054-.101-.001-.2-.023-.293-.064-.091-.041-.174-.1-.243-.174l-3.04-3.04z"></path></svg>
      <input type="text"placeholder="궁금한 질문을 검색해보세요!" enterkeyhint="search" name="search" id="search">
      
    </div>
  
      
    <button class="ac-button is-md is-solid is-primary search-form__search e-search-posts " style="min-width: 96px">검색</button>
    </div>

  </form>
    </div>
<div class="question-list-container">
  <div class="posts-container-header">


    <ul class="order-pc"> 
      <li class="e-order active" data-order="recent">
        
    <button class="ac-button is-md is-text tab-button "><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16"><path fill="#212529" d="M8 10c-1.105 0-2-.895-2-2s.895-2 2-2 2 .895 2 2-.895 2-2 2z" clip-rule="evenodd"></path></svg> 최신순</button>
      </li>
      
      <li class="e-order " data-order="recommend">
        
    <button class="ac-button is-md is-text tab-button " onclick="location.href='index.jsp?main=qusans/questionslikesun.jsp'"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16"><path fill="#212529" d="M8 10c-1.105 0-2-.895-2-2s.895-2 2-2 2 .895 2 2-.895 2-2 2z" clip-rule="evenodd"></path></svg> 좋아요순</button>
      </li>
    </ul>
            <div class="posts-container-header__button-cover"></div>
            
            
    <button  class="ac-button is-md is-solid is-gray posts-container-header__button features__new-question e-new-question "><span class="infd-icon"><svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#ffffff" fill-rule="evenodd" d="M11.508 1.451c.456-.455 1.195-.455 1.65 0l1.724 1.724c.456.456.456 1.194 0 1.65L13.02 6.687l-.008.008-7.219 6.89c-.132.126-.291.22-.466.273l-3.681 1.12c-.177.054-.369.006-.5-.124-.13-.131-.178-.323-.124-.5l1.115-3.666c.059-.192.166-.365.311-.504L9.651 3.31l1.857-1.858zM9.992 4.366l-6.854 6.542c-.02.02-.036.044-.044.072l-.843 2.769 2.785-.848c.025-.007.048-.02.067-.039l6.848-6.537-1.96-1.96zm2.675 1.26l1.508-1.508c.065-.065.065-.17 0-.236l-1.724-1.724c-.065-.065-.17-.065-.236 0l-1.508 1.509 1.96 1.96z" clip-rule="evenodd"></path></svg></span> <span class="posts-container-header__button-text">글쓰기</span></button>
          </div>
          <ul class="question-list">
          
<% 
if(nowP_list.size() ==0){
%>	
<h3 class="h3-txt">등록된 글이 없습니다.</h3>


<%	
}else{

	for(QuestionDto data : nowP_list ){

%>       
          <li class="question-container">   
          <a href="index.jsp?main=qusans/qusan_listdetail.jsp?num=<%=data.getQue_num()%>">
    <div class="question">
      <div class="question__info">
        <div class="question__title">
          
          <h3 class="title__text">
          	<%=data.getQue_subject() %>
            <span class="infd-icon title__icon">
              
            </span>
          </h3>
        </div>
        <div class="question__body">
         	<%=data.getQue_content() %>
        </div>
        <div class="question__tags"></div>
        <div class="question__info-footer">
          <span class="question__info-user-name"><%=data.getQue_id() %></span>
          <span>&nbsp;·&nbsp;</span>
          <span><%=data.getQue_datetime() %></span>
          <span>&nbsp;·&nbsp;</span>
          <span>
          <%
          if(data.getQue_sol()==1){
          %>
			<b>해결</b>  
          <%
          }else{
        	  %>
        	  <b>미해결</b>
        	  <%
          }
          %>
          </span>
          <span>&nbsp;&nbsp;</span>
          <span class="question__info-course-title"></span>
        </div>
      </div>
      <div class="question__additional-info">
        <div class="question__comment">
          <span class="comment__count"><%=data.getAnswer_cnt() %></span>
          <span class="comment__description">답변</span>
        </div>
        
    <button class="ac-button is-md is-text question__like e-like "><svg width="16" xmlns="http://www.w3.org/2000/svg" height="16" viewBox="0 0 16 16"><path fill="#616568" d="M9.333 13.605c-.328.205-.602.365-.795.473-.102.057-.205.113-.308.168h-.002c-.143.074-.313.074-.456 0-.105-.054-.208-.11-.31-.168-.193-.108-.467-.268-.795-.473-.655-.41-1.53-1.007-2.408-1.754C2.534 10.382.667 8.22.667 5.676c0-2.308 1.886-4.01 3.824-4.01 1.529 0 2.763.818 3.509 2.07.746-1.252 1.98-2.07 3.509-2.07 1.938 0 3.824 1.702 3.824 4.01 0 2.545-1.867 4.706-3.592 6.175-.878.747-1.753 1.344-2.408 1.754z"></path></svg><%=data.getQue_chu()%></button>
      </div>
    </div></a></li>
  <% } %>  
    
    </ul>
        </div>
<%
	int grpchk = (reqpage-1) %grpsize;
	int startpage = reqpage - grpchk;
%>        
    <nav class="pagination is-centered is-small" role="navagation" aria-label="pagination">
<%
	if( startpage-grpsize > 0 ){
%>
      <a class="pagination-pre" href="index.jsp?main=?pagenum=<%=startpage-1 %>">이전 페이지</a>
<%  } %>
      <ul class="pagination-list">
        
   <% for(int i= startpage; i<= (startpage+grpsize)-1; i++   ) {
   
   		if( i == reqpage){
   %>
    	<li><a class="pagination-link is-current"> <%=i %></a></li>
   <% }else if( i> pagecount){
   			i=(startpage+grpsize)-1;
   	}else {
   %>
          <li><a class="pagination-link " href="index.jsp?main=?pagenum=<%=i %>"><%=i %></a></li>     	  
   <%  } } %>
          
      </ul>
<%
	if( startpage + grpsize <= pagecount ){
%>
      <a class="pagination-pre" href="index.jsp?main=?pagenum=<%=startpage+grpsize %>">다음 페이지</a>
<%  } %>      
      
      
    </nav>
<% } %>    
    
</div>

</body>
