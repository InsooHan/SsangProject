<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dao.QusAnsAnswerDao"%>
<%@page import="dto.QusAnsAnswerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../static/css/question.css">
<style>
.community-body__content{
	padding: 32px 0 64px;
	max-width:800px;
	display:flex;
	flex:1;
	flex-direction:column;
	margin:0 auto;
}
ul.status{
	display:flex;
	border-bottom:1px solid #dee2e6;
	list-style:none;
	margin:0;
	padding:0;
}
ul.status .active{
	position:relative;
}

.ac-button{
	position: relative;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    border-radius: 4px;
    line-height: 1.47;
    font-weight: 500;
    cursor: pointer;
    -webkit-appearance: none;
    padding: 0 12px;
    height: 40px;
    line-height: 1.43;
    font-size: 14px;
    letter-spacing: -.3px;
    border: 1px solid;
    color: #fff;
}
.ac-button.is-md {
    padding: 0 12px;
    height: 40px;
    line-height: 1.43;
    font-size: 14px;
    letter-spacing: -.3px;
}
.ac-button.is-text {
    border: unset;
    background-color: unset;
    color: #495057;
    font-weight: 500;
}
/*****===========================================*****/

form.search {
    padding: 20px 0 38px;
}
form.search .search-item {
    display: flex;
    margin-bottom: 10px;
}
.posts-by-type form.search .search-item {
    display: flex;
    margin-bottom: 10px;
}

.ac-input-with-item {
    display: flex;
    padding: 10px 12px;
    width: 200px;
    height: 40px;
    letter-spacing: -.3px;
    border: 1px solid #dee2e6;
    border-radius: 4px;
    background-color: #fff;
}
.search-by-text {
    align-items: center;
}
form.search .search-item .ac-input-with-item {
    width: 100%;
    height: 48px;
}


.ac-input-with-item>input {
    padding: 0;
    width: 100%;
    line-height: 1.43;
    letter-spacing: -.3px;
    font-size: 14px;
    border: 0;
    background: none;
}
form.search .search-item>.ac-button {
    margin-left: 16px;
    height: 48px;
}
.ac-button.is-solid.is-primary {
    border-color: #00c471;
    font-weight: 700;
    background-color: #00c471;
}
.ac-button.is-solid {
    border: 1px solid;
    color: #fff;
}

/*==========*/

.question-list-container {
    margin-bottom: 40px;
}
.posts-container-header {
    display: flex;
    padding-bottom: 8px;
    border-bottom: 1px solid #dee2e6;
}
.order-pc {
    display: flex;
    align-items: center;
    list-style:none;
    margin:0;
    padding:0;
}
.posts-container-header__button-cover {
    display: inline-flex;
    align-items: center;
    margin-left: auto;
}
.features__new-question.ac-button.is-solid.is-gray {
    background-color: #3e4042;
}
.ac-button.is-solid.is-gray {
    border-color: #868e96;
    background-color: #868e96;
}
.features__new-question {
    color: #fff;
    margin-left: 8px;
}
.ac-button.is-solid {
    border: 1px solid;
    color: #fff;
}

</style>
<%
	int pagesize = 20;  //한페이지 표시수
	int grpsize	= 10; // 페이징 번호수
	int pagenum	= 1; // 시작페이지
	int pagecount = 1; // 시작
	int skiprow = 1; // 시작
	int DBcount=0;  // 전체 갯수

	Connection conn=null;
	String url="";
	String userid="";
	String userpw="";
	String sql="select count(num) as cnt from";
/*try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, userid,userpw);
}catch(SQLException e){
	
}

try{	
	PreparedStatement pt = conn.prepareStatement(sql);  //전체 DB 갯수 구하기
	
	pt.executeUpdate();
}catch(SQLException e){
	
}
*/
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

/*
try{	
	PreparedStatement pt = conn.prepareStatement(sql);
	
	pt.executeQuery();
}catch(SQLException e){
	
}
*/
%>    



</head>
<body>

<div class="community-body__content">
        <div class="search-filter">
          <ul class="status">
    <li class="e-status active" data-status="">
      
    <button class="ac-button is-md is-text">전체</button>
    </li>
    <li class="e-status " data-status="unresolved">
      
    <button class="ac-button is-md is-text">미해결</button>
    </li>
    <li class="e-status " data-status="resolved">
      
    <button class="ac-button is-md is-text">해결됨</button>
    </li></ul>
          
  <form class="search e-search">
    <div class="search-item">
      
    <div class="ac-input-with-item search-by-text e-search-input ">
      <svg width="16" height="16" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path fill="#212529" fill-rule="evenodd" clip-rule="evenodd" d="M11.5 7c0 .59-.116 1.176-.343 1.722-.226.546-.557 1.042-.975 1.46-.418.418-.914.75-1.46.975-.546.226-1.131.343-1.722.343-.59 0-1.176-.117-1.722-.343-.546-.226-1.042-.557-1.46-.975-.418-.418-.75-.914-.975-1.46C2.616 8.176 2.5 7.591 2.5 7c0-1.194.474-2.338 1.318-3.182C4.662 2.974 5.807 2.5 7 2.5c1.193 0 2.338.474 3.182 1.318C11.026 4.662 11.5 5.806 11.5 7zm-.82 4.74c-1.206.936-2.723 1.377-4.242 1.234-1.52-.143-2.928-.86-3.937-2.005C1.49 9.825.956 8.34 1.004 6.813c.047-1.526.675-2.976 1.754-4.055 1.08-1.08 2.53-1.707 4.055-1.755 1.525-.047 3.012.488 4.156 1.498 1.145 1.01 1.862 2.417 2.005 3.937.143 1.52-.298 3.036-1.234 4.242l3.04 3.04c.074.069.133.151.174.243.04.092.063.192.065.292.001.101-.017.201-.055.294-.038.094-.094.179-.165.25-.071.071-.156.127-.25.165-.093.038-.193.056-.293.054-.101-.001-.2-.023-.293-.064-.091-.041-.174-.1-.243-.174l-3.04-3.04z"></path></svg>
      <input type="text"placeholder="궁금한 질문을 검색해보세요!" enterkeyhint="search">
      
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
      <li class="e-order " data-order="score">
        
    <button class="ac-button is-md is-text tab-button "><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16"><path fill="#212529" d="M8 10c-1.105 0-2-.895-2-2s.895-2 2-2 2 .895 2 2-.895 2-2 2z" clip-rule="evenodd"></path></svg> 정확도순</button>
      </li>
      <li class="e-order " data-order="comment">
        
    <button class="ac-button is-md is-text tab-button "><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16"><path fill="#212529" d="M8 10c-1.105 0-2-.895-2-2s.895-2 2-2 2 .895 2 2-.895 2-2 2z" clip-rule="evenodd"></path></svg> 답변많은순</button>
      </li>
      <li class="e-order " data-order="recommend">
        
    <button class="ac-button is-md is-text tab-button "><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16"><path fill="#212529" d="M8 10c-1.105 0-2-.895-2-2s.895-2 2-2 2 .895 2 2-.895 2-2 2z" clip-rule="evenodd"></path></svg> 좋아요순</button>
      </li>
    </ul>
            <div class="posts-container-header__button-cover"></div>
            
            
    <button class="ac-button is-md is-solid is-gray posts-container-header__button features__new-question e-new-question "><span class="infd-icon">
    <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#ffffff" fill-rule="evenodd" d="M11.508 1.451c.456-.455 1.195-.455 1.65 0l1.724 1.724c.456.456.456 1.194 0 1.65L13.02 6.687l-.008.008-7.219 6.89c-.132.126-.291.22-.466.273l-3.681 1.12c-.177.054-.369.006-.5-.124-.13-.131-.178-.323-.124-.5l1.115-3.666c.059-.192.166-.365.311-.504L9.651 3.31l1.857-1.858zM9.992 4.366l-6.854 6.542c-.02.02-.036.044-.044.072l-.843 2.769 2.785-.848c.025-.007.048-.02.067-.039l6.848-6.537-1.96-1.96zm2.675 1.26l1.508-1.508c.065-.065.065-.17 0-.236l-1.724-1.724c-.065-.065-.17-.065-.236 0l-1.508 1.509 1.96 1.96z" 
    clip-rule="evenodd"></path></svg></span> <span class="posts-container-header__button-text" onclick="location.href='insertform.jsp'" >글쓰기</span></button>
          </div>
          <ul class="question-list">
          
<% 

//	for(question data : nowP_list ){

%>          
          <li class="question-container"><a href="../Community/answer">
    <div class="question">
      <div class="question__info">
        <div class="question__title">
          
          <h3 class="title__text">
          
            <span class="infd-icon title__icon">
              
            </span>
          </h3>
        </div>
        <p class="question__body">
         
        </p>
        <div class="question__tags"></div>
        <div class="question__info-footer">
          <span class="question__info-user-name"></span>
          <span>&nbsp;·&nbsp;</span>
          <span></span>
          <span>&nbsp;·&nbsp;</span>
          <span class="question__info-course-title"></span>
        </div>
      </div>
      <div class="question__additional-info">
        <div class="question__comment">
          <span class="comment__count"></span>
          <span class="comment__description"></span>
        </div>
        
    <button class="ac-button is-md is-text question__like e-like "><svg width="16" xmlns="http://www.w3.org/2000/svg" height="16" viewBox="0 0 16 16"><path fill="#616568" d="M9.333 13.605c-.328.205-.602.365-.795.473-.102.057-.205.113-.308.168h-.002c-.143.074-.313.074-.456 0-.105-.054-.208-.11-.31-.168-.193-.108-.467-.268-.795-.473-.655-.41-1.53-1.007-2.408-1.754C2.534 10.382.667 8.22.667 5.676c0-2.308 1.886-4.01 3.824-4.01 1.529 0 2.763.818 3.509 2.07.746-1.252 1.98-2.07 3.509-2.07 1.938 0 3.824 1.702 3.824 4.01 0 2.545-1.867 4.706-3.592 6.175-.878.747-1.753 1.344-2.408 1.754z"></path></svg> 0</button>
      </div>
    </div></a></li>
  <% //} %>  
    
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
      <a class="pagination-pre" href="?pagenum=<%=startpage-1 %>">이전 페이지</a>
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
          <li><a class="pagination-link " href="?pagenum=<%=i %>"><%=i %></a></li>     	  
   <%  } } %>
          
      </ul>
<%
	if( startpage + grpsize <= pagecount ){
%>
      <a class="pagination-pre" href="?pagenum=<%=startpage+grpsize %>">다음 페이지</a>
<%  } %>      
      
      
    </nav>
      </div>



</body>
</html>