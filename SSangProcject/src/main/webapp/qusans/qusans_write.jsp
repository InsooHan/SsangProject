<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <style>
#write-section{
	margin:0 auto;
    position:relative;
    width:100%;
    justify-content:center;
    align-items:center;
}
#write_wrap{
	width:800px;
	margin:0 auto;
	padding:0 20px;
	position:relative;
}
.filter {
	
}

ul.status{
	display:flex;
	border-bottom:2px solid #dee2e6;
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
    padding: 16px 12px;
    height: 54px;
    line-height: 1.43;
    font-size: 16px;
    letter-spacing: -.3px;
}
.ac-button.is-text {
    border: unset;
    background-color: unset;
    color: #495057;
    font-weight: 500;
}
.status .active{margin-bottom:-2px;border-bottom:2px solid #29BE7F;}



.title_tag{
	margin-top:50px;
	margin-bottom:30px;
}
.title_wrap{
	width:100%;
}
#title{
	width:100%;
	font-size:28px;
	font-weight:900;
	font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
	color:black;
}

.bt_wrap{
	margin-top:30px;
	width:100%;
	text-align:right;
}
.bt button{
	height:45px;
	width:80px;
	border-radius:10px;
	border:0;
	margin-left:10px;
	font-size:17px;
	cursor:pointer;
}
#cancle{background:white; border:1px solid #cecece;}
#enroll{background:#29BE7F ; color:white;}



</style>  
<%
	String part = request.getParameter("part");

%>
<jsp:include page="qusan_st.jsp"/>
<link rel="stylesheet" href="../static/css/write.css">
<script src='../static/js/write.js'>
$(document).ready(function(){
    $('.ac-button').on('click',function(){
		
        var part = $(this).data("key");
        location.href="qusans_write.jsp?part="+part; 
    });
    
    $("#cancle").on("click",function(){
		location.href="questions.jsp";	
});
   $("#enroll").on("click",function(){
		document.writef.submit();
}) ;



});
</script>

<body>

<section id='write-section'>
	<div id='write_wrap'>
		
		<div class='filter'>
			<ul class="status">
			    <li class="e-status <%= part.equals("question")?"active":"" %>" data-status="">
			      
			    <button class="ac-button is-md is-text" data-key='question'>질문</button>
			    </li>
			    <li class="e-status <%= part.equals("free")?"active":"" %>" data-status="unresolved">
			      
			    <button class="ac-button is-md is-text" data-key='free'>자유주제</button>
			    </li>
			    <li class="e-status <%= part.equals("study")?"active":"" %>" data-status="resolved">
			      
			    <button class="ac-button is-md is-text" data-key='study'>스터디</button>
			    </li>
		    </ul>
	    </div>
	    <form name=writef method="post" action="question_save.jsp">
	    <input type="hidden" name="part" value="<%=part%>">
	    <div class='title_tag'>
	    	<div class='title_wrap'>
	    		<input type='text' name='title' id='title' placeholder='제목을 입력하세요'>
	    	</div>
	    </div>
	    <div class='cont_wrap'>
		<textarea id="cont" name="cont"></textarea>
		</div>
		<div class='bt_wrap'>
			<span class='bt'>
				<button type='button' id='cancle'>취소</button>
				<button type='button' id='enroll'>등록</button>
			</span>
		</div>
		</form>
	</div>
</section>

</body>
</html>

<script>
      $('#cont').summernote({
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
    
    
</script>