<%@page import="dao.QuestionDao"%>
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

<style>
</style>
<%
//request.setCharacterEncoding("UTF-8");

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
String sql="select * from Question where que_num =?";
try{
	pt=conn.prepareStatement(sql);
	pt.setInt(1, Integer.parseInt(num));
	rs=pt.executeQuery();
	if(rs.next()){
		qdata= new QuestionDto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getTimestamp(6),rs.getInt(7),rs.getInt(8));
	}
}catch(SQLException e){
	e.printStackTrace();
}

QuestionDao dao=new QuestionDao();
%>

<jsp:include page="../qusans/qusan_st.jsp"/>
<link rel="stylesheet" href="../static/css/view.css">

<script src='../static/js/view.js'></script>

<body>
<div class="post__features" style="z-index: 100;">
    <%
    if(qdata.getQue_sol()==0){
    	
    %>
    <div class="flex-row feature__status e-status e-hover-toggle solupdiv" data-status="">
      
    <button class="ac-button is-md is-outlined is-white button-rounded undefined solup" id="sol">미해결</button> <div class="message e-target-hover-toggle hide">해결 상태로 바꾸려면 클릭</div>
    </div>
    <%
    }else{
    %>
    <div class="flex-row feature__status e-status e-hover-toggle soldowndiv" data-status="">
    <button class="ac-button is-md is-outlined is-white button-rounded undefined soldown" id="sol">해결</button> <div class="message e-target-hover-toggle hide">해결 상태로 바꾸려면 클릭</div>
    </div>
    <%
    }
    %>
    <div class="flex-row feature__recommend e-post-like e-hover-toggle" data-id="24458" data-status="" data-cnt="1">
      
    <button class="ac-button is-md is-outlined is-white button-rounded undefined" id="likechu" onclick="location.href='qusans/qusan_chu.jsp?num=<%=num%>'"><svg width="16" height="16" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path fill="#1B1C1D" fill-rule="evenodd" clip-rule="evenodd" d="M4.49095 2.66666C3.10493 2.66666 1.66663 3.92028 1.66663 5.67567C1.66663 7.74725 3.21569 9.64919 4.90742 11.0894C5.73796 11.7965 6.571 12.3653 7.19759 12.7576C7.51037 12.9534 7.7704 13.1045 7.95123 13.2061C7.96818 13.2156 7.98443 13.2247 7.99996 13.2333C8.01549 13.2247 8.03174 13.2156 8.04869 13.2061C8.22952 13.1045 8.48955 12.9534 8.80233 12.7576C9.42892 12.3653 10.262 11.7965 11.0925 11.0894C12.7842 9.64919 14.3333 7.74725 14.3333 5.67567C14.3333 3.92028 12.895 2.66666 11.509 2.66666C10.1054 2.66666 8.9751 3.59266 8.4743 5.09505C8.40624 5.29922 8.21518 5.43693 7.99996 5.43693C7.78474 5.43693 7.59368 5.29922 7.52562 5.09505C7.02482 3.59266 5.89453 2.66666 4.49095 2.66666ZM7.99996 13.8018L8.22836 14.2466C8.08499 14.3202 7.91493 14.3202 7.77156 14.2466L7.99996 13.8018ZM0.666626 5.67567C0.666626 3.368 2.55265 1.66666 4.49095 1.66666C6.01983 1.66666 7.25381 2.48414 7.99996 3.73655C8.74611 2.48414 9.98009 1.66666 11.509 1.66666C13.4473 1.66666 15.3333 3.368 15.3333 5.67567C15.3333 8.22121 13.4657 10.3823 11.7407 11.8509C10.863 12.5982 9.98767 13.1953 9.33301 13.6052C9.00516 13.8104 8.73133 13.9696 8.53847 14.0779C8.44201 14.1321 8.36571 14.1737 8.31292 14.2019C8.28653 14.2161 8.26601 14.2269 8.25177 14.2344L8.2352 14.2431L8.23054 14.2455L8.22914 14.2462C8.22897 14.2463 8.22836 14.2466 7.99996 13.8018C7.77156 14.2466 7.77173 14.2467 7.77156 14.2466L7.76938 14.2455L7.76472 14.2431L7.74815 14.2344C7.73391 14.2269 7.71339 14.2161 7.687 14.2019C7.63421 14.1737 7.55791 14.1321 7.46145 14.0779C7.26858 13.9696 6.99476 13.8104 6.66691 13.6052C6.01225 13.1953 5.13695 12.5982 4.25917 11.8509C2.53423 10.3823 0.666626 8.22121 0.666626 5.67567Z"></path></svg><div class="text features__text"><%=qdata.getQue_chu()%></div></button>
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


sql="select * from Answer where que_num=? order by ans_num";
try{
	pt=conn.prepareStatement(sql);
	pt.setInt(1, qdata.getQue_num());
	rs=pt.executeQuery();
	while(rs.next()){
		Answer2Dto adata = new Answer2Dto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getTimestamp(5),rs.getInt(6));
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
                    			<button class="ac-button is-md is-text re-comment__fold-button e-unfoldd " data-idx="<%=adata.getAns_num()%>" data-chk="0">더보기 <svg width="16" height="16" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path fill="#212529" fill-rule="evenodd" clip-rule="evenodd" d="M12.7803 6.21967C13.0732 6.51256 13.0732 6.98744 12.7803 7.28033L8.53033 11.5303C8.23744 11.8232 7.76256 11.8232 7.46967 11.5303L3.21967 7.28033C2.92678 6.98744 2.92678 6.51256 3.21967 6.21967C3.51256 5.92678 3.98744 5.92678 4.28033 6.21967L8 9.93934L11.7197 6.21967C12.0126 5.92678 12.4874 5.92678 12.7803 6.21967Z"></path></svg></button>	
                    		</div>
                    		<div class="re-comment__header flex-row">
                    			<button class="ac-button is-md is-text re-comment__fold-button e-unfold " data-idx="<%=adata.getAns_num()%>" data-chk="0">댓글달기</button>	
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
							<form name='cregf' method='post' action='index.jsp?main=qusans/qusan_commentproc.jsp'>
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
    
    $('.e-unfoldd').on("click",function(){
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
	    	"안녕하세요"
	    	);
	    	make_note();
    	}
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
	    	"<form name='recomf' method='post' action='index.jsp?main=qusans/qusan_recommentproc.jsp'><input type=hidden name=num value='"+idx+"'><input type=hidden name=qnum value='"+<%=qdata.getQue_num() %>+"'<textarea id='reanscont' name='reanscont'></textarea></form>"
	    	);
	    	make_note();
    	}
    });
function recomment(){
	document.recomf.submit();
}


$(".solup").click(function() {
	location.href="qusans/qusan_upsol.jsp?num=<%=num%>";
	$(".solupdiv").hide();
	$(".soldowndiv").show();

});

$(".soldown").click(function(){
	location.href="qusans/qusan_downsol.jsp?num=<%=num%>";
	$(this).addclass("solup");
	$(this).removeclass("soldown");
	$(this).text("미해결");
});

    
</script>



















