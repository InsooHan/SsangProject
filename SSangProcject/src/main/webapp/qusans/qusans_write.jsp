<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String part = request.getParameter("part");

%>
<jsp:include page="qusan_st.jsp"/>
<link rel="stylesheet" href="../static/css/write.css">
<script src='../static/js/write.js'></script>

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