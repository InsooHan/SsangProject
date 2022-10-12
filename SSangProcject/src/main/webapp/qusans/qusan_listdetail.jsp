<%@page import="dto.Answer2Dto"%>
<%@page import="dto.QusAnsAnswerDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.QusAnsAnswerDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.QusAnsDto"%>
<%@page import="dto.QuestionDto"%>
<%@page import="dao.QusAnsDao"%>
<%@page import="dto.Answer2Dto"%>
<%@page import="db.DbConnect"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
  
<%

Connection conn=null;
PreparedStatement pt=null;
ResultSet rs=null;


QuestionDto qdata=null;

DbConnect db = new DbConnect();
try{
Class.forName("com.mysql.cj.jdbc.Driver");
conn = db.getConnection();
}catch(Exception e){
e.printStackTrace();
}

String num = request.getParameter("num");
String sql="select * from question where que_num =?";
try{
	pt=conn.prepareStatement(sql);
	pt.setInt(1, Integer.parseInt(num));
	rs=pt.executeQuery();
	if(rs.next()){
		qdata= new QuestionDto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getTimestamp(6),rs.getInt(7));
	}
}catch(SQLException e){
	e.printStackTrace();
}

%>
<jsp:include page="../qusans/qusan_st.jsp"/>
<link rel="stylesheet" href="../static/css/view.css">
<script src='../static/js/write.js'></script>
<script src='../static/js/question.js'></script>

<body>

<nav class="navbar">
	<div class="content">
		<div class="brand_header">
        	<a href="" class="brand_logo"> <span class="visually_hidden">인프런</span><svg width="110" id="icon_brand_logo" class="brand_logo" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 433 90"><path class="A" d="M79.1 31.6c-2-4.6-4.7-8.7-8.1-12.2-3.5-3.5-7.5-6.3-12.1-8.3S49.3 8 43.9 8c-5.2 0-10.2.9-14.9 2.9s-8.8 4.7-12.4 8.1c-3.6 3.5-6.4 7.5-8.4 12.1A37.14 37.14 0 0 0 5.1 46c0 5.2.9 10.2 2.9 14.9s4.7 8.8 8.2 12.4 7.6 6.4 12.2 8.4c4.7 2 9.6 3.1 14.9 3.1l38.3.3.3-38.5c.1-5.3-.9-10.3-2.8-15zM74 77.4l-30.7-.3c-4.2 0-8.2-.9-11.9-2.5s-7-3.9-9.8-6.7A32.99 32.99 0 0 1 15 58c-1.6-3.8-2.3-7.7-2.3-11.9 0-4.3.9-8.3 2.5-12s3.9-6.9 6.7-9.7c2.9-2.8 6.2-4.9 9.9-6.5 3.8-1.6 7.7-2.3 11.9-2.3 4.3 0 8.3.9 12 2.5s6.9 3.8 9.7 6.7c2.8 2.8 4.9 6.1 6.5 9.8s2.3 7.7 2.3 12L74 77.4z"></path><path class="A" d="M76.9 83.7c-.9 0-1.8-.3-2.5-1L27.6 35.1c-1.4-1.4-1.3-3.6 0-4.9 1.4-1.4 3.6-1.3 4.9 0l46.8 47.6c1.4 1.4 1.3 3.6 0 4.9-.6.7-1.5 1-2.4 1z"></path><path class="A" d="M43.1 47.3c-.4 0-.8-.1-1.2-.2-1.8-.7-2.8-2.7-2.1-4.5l6.3-17.3c.7-1.8 2.7-2.8 4.5-2.1s2.8 2.7 2.1 4.5L46.4 45c-.5 1.4-1.9 2.3-3.3 2.3zm12.2 16.2H33.5C31.6 63.5 30 62 30 60c0-1.9 1.6-3.5 3.5-3.5h21.8c1.9 0 3.5 1.6 3.5 3.5 0 2-1.5 3.5-3.5 3.5zm44.1-32.4V85H88.8V31.1h10.6zm5.6 16.5c1.4-3.2 3.3-6.1 5.8-8.5 2.4-2.4 5.3-4.4 8.6-5.8s6.8-2.1 10.4-2.1c3.8 0 7.3.7 10.5 2.1s6.1 3.3 8.6 5.8c2.5 2.4 4.4 5.3 5.8 8.5s2.1 6.7 2.1 10.5v27h-10.7v-27c0-2.2-.4-4.3-1.3-6.3-.8-2-2-3.7-3.5-5.2s-3.2-2.6-5.2-3.5c-2-.8-4.1-1.3-6.4-1.3-2.2 0-4.3.4-6.3 1.3-2 .8-3.7 2-5.2 3.5s-2.6 3.2-3.5 5.2c-.8 2-1.3 4.1-1.3 6.3v27h-10.7v-27c.2-3.7.9-7.2 2.3-10.5zm76.1-26.2c-2 .8-3.7 2-5.2 3.5s-2.6 3.2-3.5 5.2c-.8 2-1.3 4.1-1.3 6.3v5.5h21.6v10.7h-21.6V85h-10.7V36.4c0-3.8.7-7.3 2.1-10.5s3.3-6.1 5.8-8.5 5.4-4.4 8.6-5.8c3.3-1.4 6.8-2.1 10.4-2.1h5.3v10.7h-5.3c-2.1 0-4.2.4-6.2 1.2zm43.2-11.9V85h-10.7V9.5h10.7zM270.5 66l7.6 7.6-3.7 3.7c-2.6 2.6-5.5 4.5-8.8 5.9s-6.7 2-10.3 2-7-.7-10.3-2c-3.3-1.4-6.2-3.3-8.8-5.9s-4.6-5.6-5.9-8.9-1.9-6.7-1.9-10.1.6-6.8 1.9-10.1 3.2-6.2 5.9-8.9c2.6-2.6 5.6-4.6 8.9-5.9s6.7-2 10.1-2 6.8.7 10.1 2 6.3 3.3 8.9 5.9l3.7 3.7L248 72.9c3 1.5 6.3 2 9.7 1.5s6.4-2.1 8.9-4.6l3.9-3.8zm-26.8-19.3c-3.2 3.2-4.8 7-4.8 11.5 0 2.5.6 4.8 1.7 7.1l10.6-10.6 6.4-6.3 4.7-4.7c-3-1.5-6.3-2-9.7-1.6-3.3.5-6.3 2.1-8.9 4.6zm64.8-15.6c3.8 0 7.3.7 10.5 2.1s6.1 3.3 8.5 5.8a27.88 27.88 0 0 1 5.8 8.5c1.4 3.2 2.1 6.7 2.1 10.5v27h-26.9c-3.7 0-7.2-.7-10.4-2.1-3.3-1.4-6.2-3.3-8.6-5.8-2.5-2.5-4.4-5.4-5.8-8.6-1.4-3.3-2.1-6.8-2.1-10.4 0-3.8.7-7.3 2.1-10.5s3.3-6.1 5.8-8.5 5.4-4.4 8.6-5.8c3.3-1.5 6.8-2.2 10.4-2.2zm16.2 43.2V58c0-2.2-.4-4.3-1.3-6.3-.8-2-2-3.7-3.5-5.2s-3.2-2.6-5.2-3.5c-2-.8-4.1-1.3-6.3-1.3s-4.4.4-6.4 1.3c-2 .8-3.7 2-5.2 3.5s-2.6 3.2-3.5 5.2c-.8 2-1.3 4.1-1.3 6.3s.4 4.4 1.3 6.4c.8 2 2 3.7 3.5 5.2s3.2 2.6 5.2 3.5c2 .8 4.1 1.3 6.4 1.3h16.3zm46.2-43.2v10.7h-5.4c-2.2 0-4.3.4-6.3 1.3-2 .8-3.7 2-5.2 3.5s-2.6 3.2-3.5 5.2c-.8 2-1.3 4.1-1.3 6.3v27h-10.8V58c0-3.8.7-7.3 2.1-10.5s3.3-6.1 5.8-8.5 5.4-4.4 8.6-5.8c3.3-1.4 6.8-2.1 10.4-2.1h5.6zm5.3 16.5c1.4-3.2 3.3-6.1 5.8-8.5 2.4-2.4 5.3-4.4 8.6-5.8s6.8-2.1 10.4-2.1c3.8 0 7.3.7 10.5 2.1s6.1 3.3 8.6 5.8c2.5 2.4 4.4 5.3 5.8 8.5s2.1 6.7 2.1 10.5v27h-10.7v-27c0-2.2-.4-4.3-1.3-6.3-.8-2-2-3.7-3.5-5.2s-3.2-2.6-5.2-3.5c-2-.8-4.1-1.3-6.4-1.3-2.2 0-4.3.4-6.3 1.3-2 .8-3.7 2-5.2 3.5s-2.6 3.2-3.5 5.2c-.8 2-1.3 4.1-1.3 6.3v27h-10.7v-27c.2-3.7.9-7.2 2.3-10.5z"></path><title>인프런 브랜드 로고</title></svg> </a>
        </div>
		<div class="navbar-left">
	        <div class="has-dropdown is-hoverable navbar-item category_menu content--no-list-style">
	              <a href="" class="navbar-item"><span>강의</span></a>
	        </div>
	 		<div class="navbar-item">
	              <a href="" class="navbar-item"><span>로드맵</span></a>
	        </div>
			<div class="navbar-item">
	              <a href="" class="navbar-item"><span>멘토링</span></a>
	        </div>            
			<div class="has-dropdown is-hoverable navbar-item  icon_drop_menu">
	    		<a href="" class="navbar-item "><span>커뮤니티</span></a>
	    		<div class="navbar-dropdown is-boxed is-right">
	      
	  				<a class="navbar-item " href="../qusans/questions.jsp">
	    				<span class="icon"><i class="fal fa-comment-alt-edit"></i></span> <span class="name">질문 &amp; 답변</span>
	    
	  				</a>  
	  			</div>
	  		</div>  
 		</div>             
	</div>

</nav>

<div class="post__features">
    
    <div class="flex-row feature__status e-status e-hover-toggle" data-status="">
      
    <button class="ac-button is-md is-outlined is-white button-rounded undefined ">미해결</button> <div class="message e-target-hover-toggle hide">해결 상태로 바꾸려면 클릭</div>
    </div>
    
    <div class="flex-row feature__recommend e-post-like e-hover-toggle" data-id="24458" data-status="" data-cnt="1">
      
    <button class="ac-button is-md is-outlined is-white button-rounded undefined "><svg width="16" height="16" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path fill="#1B1C1D" fill-rule="evenodd" clip-rule="evenodd" d="M4.49095 2.66666C3.10493 2.66666 1.66663 3.92028 1.66663 5.67567C1.66663 7.74725 3.21569 9.64919 4.90742 11.0894C5.73796 11.7965 6.571 12.3653 7.19759 12.7576C7.51037 12.9534 7.7704 13.1045 7.95123 13.2061C7.96818 13.2156 7.98443 13.2247 7.99996 13.2333C8.01549 13.2247 8.03174 13.2156 8.04869 13.2061C8.22952 13.1045 8.48955 12.9534 8.80233 12.7576C9.42892 12.3653 10.262 11.7965 11.0925 11.0894C12.7842 9.64919 14.3333 7.74725 14.3333 5.67567C14.3333 3.92028 12.895 2.66666 11.509 2.66666C10.1054 2.66666 8.9751 3.59266 8.4743 5.09505C8.40624 5.29922 8.21518 5.43693 7.99996 5.43693C7.78474 5.43693 7.59368 5.29922 7.52562 5.09505C7.02482 3.59266 5.89453 2.66666 4.49095 2.66666ZM7.99996 13.8018L8.22836 14.2466C8.08499 14.3202 7.91493 14.3202 7.77156 14.2466L7.99996 13.8018ZM0.666626 5.67567C0.666626 3.368 2.55265 1.66666 4.49095 1.66666C6.01983 1.66666 7.25381 2.48414 7.99996 3.73655C8.74611 2.48414 9.98009 1.66666 11.509 1.66666C13.4473 1.66666 15.3333 3.368 15.3333 5.67567C15.3333 8.22121 13.4657 10.3823 11.7407 11.8509C10.863 12.5982 9.98767 13.1953 9.33301 13.6052C9.00516 13.8104 8.73133 13.9696 8.53847 14.0779C8.44201 14.1321 8.36571 14.1737 8.31292 14.2019C8.28653 14.2161 8.26601 14.2269 8.25177 14.2344L8.2352 14.2431L8.23054 14.2455L8.22914 14.2462C8.22897 14.2463 8.22836 14.2466 7.99996 13.8018C7.77156 14.2466 7.77173 14.2467 7.77156 14.2466L7.76938 14.2455L7.76472 14.2431L7.74815 14.2344C7.73391 14.2269 7.71339 14.2161 7.687 14.2019C7.63421 14.1737 7.55791 14.1321 7.46145 14.0779C7.26858 13.9696 6.99476 13.8104 6.66691 13.6052C6.01225 13.1953 5.13695 12.5982 4.25917 11.8509C2.53423 10.3823 0.666626 8.22121 0.666626 5.67567Z"></path></svg><div class="text features__text">1</div></button>
      <div class="message e-target-hover-toggle hide">1명이 이 글을 좋아합니다!</div>
    </div>
    
  <div class="flex-row e-bookmark e-hover-toggle" data-id="24458" data-status="" data-cnt="1">
    
    <button class="ac-button is-md is-outlined is-white button-rounded undefined "><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 384 512"><path fill="#1B1C1D" d="M336 0H48C21.49 0 0 21.49 0 48v464l192-112 192 112V48c0-26.51-21.49-48-48-48zm16 456.287l-160-93.333-160 93.333V48c0-8.822 7.178-16 16-16h288c8.822 0 16 7.178 16 16v408.287z"></path></svg><div class="text features__text">1</div></button>
    <div class="message e-target-hover-toggle hide">1명이 이 글을 북마크 했습니다!</div>
  </div>
    
    <button class="ac-button is-md is-outlined is-white button-rounded flex-row features__share e-share "><svg width="16" height="16" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path fill="#1B1C1D" fill-rule="evenodd" clip-rule="evenodd" d="M13.3334 3.66666C13.3334 4.95533 12.2887 6 11 6C10.3257 6 9.7181 5.7139 9.29211 5.25646L5.88379 7.27067C5.95923 7.50012 6.00004 7.74529 6.00004 8C6.00004 8.25469 5.95923 8.49986 5.8838 8.72932L9.29224 10.7434C9.71822 10.286 10.3257 10 11 10C12.2887 10 13.3334 11.0447 13.3334 12.3333C13.3334 13.622 12.2887 14.6667 11 14.6667C9.71138 14.6667 8.66671 13.622 8.66671 12.3333C8.66671 12.0786 8.70752 11.8335 8.78296 11.604L5.37452 9.58992C4.94854 10.0473 4.34103 10.3333 3.66671 10.3333C2.37804 10.3333 1.33337 9.28866 1.33337 8C1.33337 6.71133 2.37804 5.66666 3.66671 5.66666C4.34102 5.66666 4.94853 5.9527 5.37452 6.41007L8.78295 4.39599L8.78321 4.39678C8.70761 4.1671 8.66671 3.92166 8.66671 3.66666C8.66671 2.378 9.71138 1.33333 11 1.33333C12.2887 1.33333 13.3334 2.378 13.3334 3.66666ZM12.3334 3.66666C12.3334 4.40304 11.7364 4.99999 11 4.99999C10.2637 4.99999 9.66671 4.40304 9.66671 3.66666C9.66671 2.93028 10.2637 2.33333 11 2.33333C11.7364 2.33333 12.3334 2.93028 12.3334 3.66666ZM3.66671 9.33333C4.40309 9.33333 5.00004 8.73637 5.00004 8C5.00004 7.26362 4.40309 6.66666 3.66671 6.66666C2.93033 6.66666 2.33337 7.26362 2.33337 8C2.33337 8.73637 2.93033 9.33333 3.66671 9.33333ZM12.3334 12.3333C12.3334 13.0697 11.7364 13.6667 11 13.6667C10.2637 13.6667 9.66671 13.0697 9.66671 12.3333C9.66671 11.5969 10.2637 11 11 11C11.7364 11 12.3334 11.5969 12.3334 12.3333Z"></path></svg> <div class="text features__text">공유</div></button>
</div>

<section class='community-detail detail_post'>
	<div class="section__content">
		<div class="community-post-info">
		    <!-- 제목, 작성자이름, 작성시각, 에디터 -->
		    <div class="community-post-info__header">
		      <div class="header__title"><svg width="26px" height="26px" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">
			      <path fill="#00C471" fill-rule="evenodd" clip-rule="evenodd" d="M 11.742188 12.886719 C 10.707031 13.679688 9.40625 14.152344 8 14.152344 C 4.601562 14.152344 1.847656 11.398438 1.847656 8 C 1.847656 4.601562 4.601562 1.847656 8 1.847656 C 11.398438 1.847656 14.152344 4.601562 14.152344 8 C 14.152344 9.324219 13.734375 10.550781 13.023438 11.554688 L 11.101562 9.632812 C 10.742188 9.273438 10.15625 9.273438 9.796875 9.632812 C 9.433594 9.992188 9.433594 10.578125 9.796875 10.9375 Z M 13.054688 14.199219 C 11.679688 15.324219 9.917969 16 8 16 C 3.582031 16 0 12.417969 0 8 C 0 3.582031 3.582031 0 8 0 C 12.417969 0 16 3.582031 16 8 C 16 9.835938 15.382812 11.527344 14.34375 12.875 L 15.511719 14.042969 C 15.871094 14.402344 15.871094 14.988281 15.511719 15.347656 C 15.148438 15.707031 14.566406 15.707031 14.203125 15.347656 Z M 13.054688 14.199219"></path></svg> 
			      <h1> <%=qdata.getQue_subject() %></h1>
		      </div>
		      <div class="header__sub-title">
		        	<h6 class="user-name"><%=qdata.getQue_id() %></h6>
		        	<span class="sub-title__created-at">&nbsp;· <%=qdata.getQue_datetime() %></span>
		      </div>
		    </div>
		    <div class="community-post-info__content">
		      <div class="content__body markdown-body"><%=qdata.getQue_content() %></div>
		    </div>
		</div>
	</div>
</section>

<%
ArrayList<Answer2Dto> ans_list = new ArrayList<>();


sql="select * from answer where que_num=? order by ans_num";
try{
	pt=conn.prepareStatement(sql);
	pt.setInt(1, qdata.getQue_num());
	rs=pt.executeQuery();
	while(rs.next()){
		Answer2Dto adata = new Answer2Dto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5));
		ans_list.add(adata);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>

<section class='community-detail detail_answer'>
	<div class="section__content">
		<div class="answer-info">
			<div class="answer-info__header">
				<div class="header__title">
					<span class="title-icon">A</span>
					총 <%=ans_list.size() %>개의 답변이 달렸습니다
				</div>
			</div>
			<div class="community-post-info__content">
				<div class="content__body">
<%

Iterator<Answer2Dto> it = ans_list.iterator();
int i=1;
while(it.hasNext()){
	Answer2Dto adata = it.next();
%>
<%--  답변글 --%>					
					<div class="answer__comment">
						<div class="comment__index"><%=i %></div>
						<div class="comment__card">
							<div class="comment__header flex-row">
								<img class="comment__user-profile" src="https://cdn.inflearn.com/public/main/profile/default_profile.png" alt="<%=adata.getAns_id() %> 프로필">
								<div class="flex-column comment__header-right">
        							<h5 class="comment__user-name"><%=adata.getAns_id() %></h5>
        							<span class="comment__updated-at"><%=adata.getReg_datetime() %></span>
      							</div>
							</div>
							<div class="comment__body markdown-body">
								<%=adata.getAns_content() %>
								                    			
							</div>
						</div>
						
						<div class="comment__re-comment">
							<div class="re-comment__header flex-row">
                    			<h4 class="re-comment__title">댓글</h4>
                    			<button class="ac-button is-md is-text re-comment__fold-button e-unfold " data-idx="<%=adata.getAns_num()%>" data-chk="0">더보기 <svg width="16" height="16" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path fill="#212529" fill-rule="evenodd" clip-rule="evenodd" d="M12.7803 6.21967C13.0732 6.51256 13.0732 6.98744 12.7803 7.28033L8.53033 11.5303C8.23744 11.8232 7.76256 11.8232 7.46967 11.5303L3.21967 7.28033C2.92678 6.98744 2.92678 6.51256 3.21967 6.21967C3.51256 5.92678 3.98744 5.92678 4.28033 6.21967L8 9.93934L11.7197 6.21967C12.0126 5.92678 12.4874 5.92678 12.7803 6.21967Z"></path></svg></button>	
                    		</div>
                    		<div class="re-comment__body body--fold">
                    			<div class="re-comment__form">
                    				
                    			</div>
                    			<div class="re-comment__form-footer flex-row">
                            		<div class="flex-right">
    									<button class="ac-button is-md is-solid is-primary e-post-re-comment "onclick='recomment()'>답변 등록</button>
                            		</div>
                        		</div>                    
                    		</div>
						</div>
						
					</div>
<%
i++;
}


%>
				
<%--  새글작성 --%>				
					<div class="answer__comment" data-id="new">
						<div class="comment__card comment__card--new">
							<div class="comment__header flex-row">
								<img class="comment__user-profile" src="https://cdn.inflearn.com/public/main/profile/default_profile.png" alt="<%=session.getAttribute("id") %> 프로필">
								<div class="flex-column comment__header-right">
        							<h5 class="comment__user-name"><%=session.getAttribute("id") %>님, 답변해주세요!</h5>
        							<span class="comment__updated-at">모두에게 도움이 되는 답변의 주인공이 되어주세요!</span>
      							</div>
							</div>
							<form name='cregf' method='post' action='comment_reg.jsp'>
							<input type='hidden' name="id" value="<%=session.getAttribute("id")%>">
							<input type='hidden' name="num" value="<%=qdata.getQue_num()%>">
							<div class="comment__body markdown-body">
								<textarea id="anscont" name="anscont"></textarea>
							</div>
							<div class="comment__footer flex-row">
								<div class="flex-right">
									<button class="ac-button is-md is-solid is-primary e-post-comment" id='comment_enroll'type='button'>답변 등록</button>
								</div>
							</div>
							</form>
						</div>
					</div>
					
					
				</div>
			</div>
		</div>
	</div>
</section>


</body>
</html>
<script>
      $('#anscont').summernote({
        placeholder: '',
        tabsize: 2,
        height: 500,
        minHeight: 300,             // 최소 높이
		maxHeight: 800,             // 최대 높이
		focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['insert', ['link']]
        ]
        
      });
function make_note(){
      $('#reanscont').summernote({
          placeholder: '',
          tabsize: 2,
          height: 500,
          minHeight: 300,             // 최소 높이
  		maxHeight: 800,             // 최대 높이
  		focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
  		lang: "ko-KR",
          toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['insert', ['link']]
          ]
          
        });
 }
    $('#comment_enroll').on("click",function(){
    	document.cregf.submit();
    });
    
    $('.e-unfold').on("click",function(){
    	if($(this).data('chk')==1){
    		$(this).data('chk',"0");
    		$(this).parent().next().addClass("body--fold");
    		$(this).text("더보기");
    		$(this).parent().next().children().first().html("");
    	}else{
	    	$(this).parent().next().removeClass("body--fold");
	    	$(this).text("접기");
	    	var idx = $(this).data('idx')
	    	$(this).data('chk',"1");
	    	$(this).parent().next().children().first().html(
	    	"<form name='recomf' method='post' action='recomment_reg.jsp'><input type=hidden name=num value='"+idx+"'><input type=hidden name=qnum value='"+<%=qdata.getQue_num() %>+"'<textarea id='reanscont' name='reanscont'></textarea></form"
	    	);
	    	make_note();
    	}
    });
function recomment(){
	document.recomf.submit();
}
    
</script>



















