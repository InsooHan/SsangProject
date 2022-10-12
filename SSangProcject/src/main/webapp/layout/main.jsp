<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/4f8084f592.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>main</title>
<style type="text/css">
	div.card {
		width: 300px;
		float: left;
		margin-right: 10px;
	}
	
	div.card:hover {
		filter: brightness(0.5);
	}
	
	div.recom1 {
		margin-left: 210px;
		margin-bottom: 320px;
	}
	
	div.recom2 {
		margin-left: 210px;
		margin-bottom: 500px;
	}
	
	#wrap {
	  position: relative;
	  min-height: 100%;
	}

	#footer {
		width: 100%;
	    position: absolute;
	    margin: 0;
	    padding: 0;
	    left: 0;
	    bottom: 0;
	}
	
	article, aside, figure, footer, header, hgroup, section {
	    display: block;
	}
	
	footer.footer #footer_bottom {
	    display: flex;
	    padding: 32px 215px;
	    justify-content: space-between;
	    background-color: #303740;
	}
	
	footer.footer #footer_bottom .footer_bottom_left {
	    display: flex;
	    flex-direction: column;
	}
	
	footer.footer #footer_bottom .footer_bottom_right {
	    width: 200px;
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    margin-left: 20px;
	}
	
	footer.footer #footer_bottom .footer_bottom_right a {
	    display: inline-block;
	    width: 34px;
	    height: 34px;
	    border-radius: 100%;
	    background: #bdbdbd;
	    text-align: center;
	    line-height: 35px;
	    color: #000a12;
	}
	
	footer.footer #footer_bottom .footer_bottom_right a:hover {
	    background: #1dc078;
	    color: #fff;
	}
	
	img.content {
		margin-bottom: 20px;
	}
	
	span, span a {
	    color: #BDBDBD;
	    font-size: 14px;
	}
	
	a, h4>b {
		color: #303740;
	}
	
	h5>b {
		color: #333;
	}
	
	b {
		color: #BDBDBD;
	}
	
	p.read {
		color: #595959;
	}
	
	div.recom1 p, div.recom2 p {
		color: #757575;
	}
	
	h4>i, span a:hover {
		color: #1dc078;
	}
</style>
</head>
<%
	String root = request.getContextPath();
%>
<body>
	<!-- Carousel -->
	<div id="demo" class="carousel slide" data-bs-ride="carousel">
	
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
	    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
	    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
	  </div>
	  
	  <div class="carousel-inner" style="background-image: none;">
	    <div class="carousel-item active">
	      <img src="image/001.png" class="d-block w-100" style="width:100%">
	    </div>
	    <div class="carousel-item">
	      <img src="image/002.png" class="d-block w-100" style="width:100%">
	    </div>
	    <div class="carousel-item">
	      <img src="image/003.png" class="d-block w-100" style="width:100%">
	    </div>
	  </div>
	  
	  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon"></span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
	    <span class="carousel-control-next-icon"></span>
	  </button>
	</div>
	<br><br><br>
	<div class="container mt-3 recom1">
	  <h4><i class="fa fa-smile-o" aria-hidden="true"></i>&nbsp;<b>가격대가 부담된다면?</b></h4>
	  <p>저렴한 가격의 강의 추천!</p>
	  <a href="#" class="">
	  <div class="card">
	    <img class="card-img-top" src="image/img1.jpg" style="width:100%">
	    <div class="card-body">
	      <h4 class="card-title">John Doe</h4>
	      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
	    </div>
	  </div>
	  </a>
	  <a href="#" class="">
	  <div class="card">
	    <img class="card-img-top" src="image/img1.jpg" style="width:100%">
	    <div class="card-body">
	      <h4 class="card-title">John Doe</h4>
	      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
	    </div>
	  </div>
	  </a>
	  <a href="#" class="">
	  <div class="card">
	    <img class="card-img-top" src="image/img1.jpg" style="width:100%">
	    <div class="card-body">
	      <h4 class="card-title">John Doe</h4>
	      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
	    </div>
	  </div>
	  </a>
	  <a href="#" class="">
	  <div class="card">
	    <img class="card-img-top" src="image/img1.jpg" style="width:100%">
	    <div class="card-body">
	      <h4 class="card-title">John Doe</h4>
	      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
	    </div>
	  </div>
	  </a>
	  <br>
	</div>
	<br><br>
	<div class="container mt-3 into">
	  <h4>
	  	<b>읽어보기 <i class="fa fa-bookmark-o" aria-hidden="true"></i></b>
	  </h4>
	  <div class="d-flex mb-3">
	  	<a href="https://www.inflearn.com/pages/infmation-53-20220920" target='_blank'>
	    <div class="p-2 flex-fill">
	    	<img class="card-img-top content" src="image/content1.png" style="width: 410px;">
	    	<h5><b>IT관련 대외활동 총집합➰</b></h5>
	    	<p class="read">
	    		입사지원 시 자신만의 능력을 보여주기 위해, 그리고 개발<br>
	    		관련 지식을 키우기 위해 다양한 프로젝트와 SW 교육에<br>
	    		대한 관심과 필요성은 나날이 대두되고 있는데요. 함께...
	    	</p>
	    </div>
	    </a>
	    <a href="https://www.inflearn.com/pages/2022-sql-curation" target='_blank'>
	    <div class="p-2 flex-fill">
			<img class="card-img-top content" src="image/content2.png" style="width: 410px;">
			<h5><b>골라 듣는 SQL 강의 8종👀</b></h5>
			<p class="read">
	    		데이터가 실력이라는 요즈음! 데이터베이스와 소통하기 위<br>
	    		한 언어, SQL을 배우고 싶어하는 분들이 늘고 있어요. 하지<br>
	    		만 많아도 너~무 많은 SQL 강의 중에서 나한테 딱 맞는...
	    	</p>
		</div>
		</a>
		<a href="https://www.inflearn.com/pages/pro-bks-202203" target='_blank'>
	    <div class="p-2 flex-fill">
	    	<img class="card-img-top content" src="image/content3.png" style="width: 410px;">
	    	<h5><b>두렵다면, 지금 백기선에 올라타세요.🎈</b></h5>
	    	<p class="read">
	    		인프런에 작성된 여러 댓글을 살펴 보았을 때 안심할 수 없<br>
	    		는 버그 / 끝없는 자기계발 / 꾸준히 쫓아 가야 하는 새로운<br>
	    		지식들로 인해 한없이 넓고 큰 바다에 놓인 채, 끝이 보이...
	    	</p>
	    </div>
	  </div>
	  </a>
	</div>
	<br><br><br>
	<div class="container mt-3 recom2">
	  <h4><i class="fa fa-cubes" aria-hidden="true"></i> <b>기초부터 알려주는 쉬운강의</b></h4>
	  <p>쉽고 친절한 입문 강의!</p>
	  <a href="#" class="">
	  <div class="card">
	    <img class="card-img-top" src="image/img1.jpg" style="width:100%">
	    <div class="card-body">
	      <h4 class="card-title">John Doe</h4>
	      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
	    </div>
	  </div>
	  </a>
	  <a href="#" class="">
	  <div class="card">
	    <img class="card-img-top" src="image/img1.jpg" style="width:100%">
	    <div class="card-body">
	      <h4 class="card-title">John Doe</h4>
	      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
	    </div>
	  </div>
	  </a>
	  <a href="#" class="">
	  <div class="card">
	    <img class="card-img-top" src="image/img1.jpg" style="width:100%">
	    <div class="card-body">
	      <h4 class="card-title">John Doe</h4>
	      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
	    </div>
	  </div>
	  </a>
	  <a href="#" class="">
	  <div class="card">
	    <img class="card-img-top" src="image/img1.jpg" style="width:100%">
	    <div class="card-body">
	      <h4 class="card-title">John Doe</h4>
	      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
	    </div>
	  </div>
	  </a>
	  <br>
	</div>
	
	<footer class="footer">
	    <div id="wrapper">
	      <div class="footer_bottom" id="footer_bottom">
	        <div class="footer_bottom_left footer_info">
	          <div class="footer_info_top" style="width: 130px;">
	            <span class="is-hidden-mobile">
	            	<a href="<%=root%>/index.jsp"><img src="<%=root%>/image/logo.png" style="width: 120px;"></a>
	            </span>
	          </div>
	          <div style="margin-top: 10px;">
		          <span><a href="https://www.inflearn.com/policy/privacy">개인정보취급방침</a> |</span>
		          <span><a href="https://www.inflearn.com/policy/terms-of-service">이용약관</a></span>	          
	          </div>
	          
	          <div class="footer_info_bottom">
	          	<br>
	            <div class="info-dropdown" style="max-height: 54px;">
	              <span class="is-hidden-mobile">(주)인프랩 | </span>
	              <span>대표자: ＠＠＠ | </span>
	              <span>사업자번호: 123-45-6789</span>
	              <br>
	              <span>통신판매업: 2022-****B-0000 | </span>
	              <span>개인정보보호책임자: ＠＠＠ | </span>
	              <span>이메일: <a href="mailto:info@inflearn.com">in@inflearn.com</a></span>
	              <br>
	              <span>주소: 서울특별시 강남구 테헤란로 132 8층 쌍용교육센터</span>
	            </div>
	            <br>
	            <p>©INFLEARN. ALL RIGHTS RESERVED</p>
	          </div>
	        </div>
	        <div class="footer_bottom_right is-hidden-mobile">
	          <a href="https://www.instagram.com/inflearn__official" target="_blank"><i class="fab fa-instagram"></i></a>
	          <a href="https://www.youtube.com/channel/UC0Y0T9JpgIBbyGDjvy9PbOg" target="_blank"><i class="fab fa-youtube"></i></a>
	          <a href="https://www.facebook.com/inflearn" target="_blank"><i class="fab fa-facebook-f"></i></a>
	          <a href="https://twitter.com/inflearn" target="_blank"><i class="fa-brands fa-twitter"></i></a>
	        </div>
	      </div>
	    </div>
	</footer>
</body>
</html>