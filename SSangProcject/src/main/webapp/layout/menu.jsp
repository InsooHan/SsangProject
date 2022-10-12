<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String root = request.getContextPath();
%>
<meta charset="utf-8">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/4f8084f592.js" crossorigin="anonymous"></script>

<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">

<link rel="stylesheet" href="<%=root%>/menu/fonts/icomoon/style.css">
<link rel="stylesheet" href="<%=root%>/menu/css/owl.carousel.min.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="<%=root%>/menu/css/bootstrap.min.css">
<!-- Style -->
<link rel="stylesheet" href="<%=root%>/menu/css/style.css">
<link rel="stylesheet" href="<%=root%>/static/css/default.css">
<link rel="stylesheet" href="<%=root%>/static/css/question.css">
<link rel="stylesheet" href="<%=root%>/static/css/view.css">
<link rel="stylesheet" href="<%=root%>/static/css/write.css">
<link rel="stylesheet" href="<%=root%>/static/js/question.js">
<link rel="stylesheet" href="<%=root%>/static/js/write.js">
<link rel="stylesheet" href="<%=root%>/static/js/view.js">

<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>menu</title>
<style type="text/css">
	img {
		width: 150px;
	}
	
	a.nav-link {
		font-size: 15px;
	}
	
	ul.dropdown > li.has-children a {
		font-size: 14px;
	}
</style>
</head>

<body>
	<div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
          <div class="site-mobile-menu-close mt-3">
            <span class="icon-close2 js-menu-toggle"></span>
          </div>
        </div>
        <div class="site-mobile-menu-body"></div>
      </div>

      <header class="site-navbar js-sticky-header site-navbar-target" role="banner">
        <div class="container">
          <div class="row align-items-center position-relative">

            <div class="site-logo" style="width: 114px;">
              <a href="index.jsp" class="text-black"><img src="<%=root %>/image/logo.png"></a>
            </div>

            <div class="col-12">
              <nav class="site-navigation text-right ml-auto " role="navigation" style="float: left; padding-left: 150px;">

                <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">

                  <li class="has-children">
                    <a href="index.jsp?main=class/classlist.jsp" class="nav-link">강의</a>
                    <ul class="dropdown arrow-top">
                      <li class="has-children">
                        <a href="#">개발 · 프로그래밍</a>
                        <ul class="dropdown">
                          <li><a href="#">웹 개발</a></li>
                          <li><a href="#">프론트엔드</a></li>
                          <li><a href="#">백엔드</a></li>
                        </ul>
                      </li>
                      <li class="has-children">
                        <a href="#">보안 · 네트워크</a>
                        <ul class="dropdown">
                          <li><a href="#">보안</a></li>
                          <li><a href="#">네트워크</a></li>
                          <li><a href="#">시스템</a></li>
                        </ul>
                      </li>
                      <li class="has-children">
                        <a href="#">데이터 사이언스</a>
                        <ul class="dropdown">
                          <li><a href="#">데이터 분석</a></li>
                          <li><a href="#">인공지능</a></li>
                          <li><a href="#">데이터 시각화</a></li>
                        </ul>
                      </li>
                      <li class="has-children">
                        <a href="#">게임 개발</a>
                        <ul class="dropdown">
                          <li><a href="#">게임 프로그래밍</a></li>
                          <li><a href="#">게임 기획</a></li>
                          <li><a href="#">게임 아트 · 그래픽</a></li>
                        </ul>
                      </li>
                      <li class="has-children">
                        <a href="#">크리에이티브</a>
                        <ul class="dropdown">
                          <li><a href="#">CAD · 3D 모델링</a></li>
                          <li><a href="#">웹 퍼블리싱</a></li>
                          <li><a href="#">UX/UI</a></li>
                        </ul>
                      </li>
                    </ul>
                  </li>

                  <li><a href="#" class="nav-link">멘토링</a></li>
                  
                  <li class="has-children">
                    <a href="#" class="nav-link">커뮤니티</a>
                    <ul class="dropdown arrow-top" >
                      <li><a href="index.jsp?main=qusans/questions.jsp" class="nav-link">질문 & 답변</a></li>
                      <li><a href="#" class="nav-link">자유주제</a></li>
                      <li><a href="#" class="nav-link">스터디</a></li>
                      <li><a href="index.jsp?main=board/boardlist.jsp" class="nav-link">자유게시판</a></li>
                    </ul>
                  </li>
				
                </ul>
              </nav>
            </div>

            <div class="toggle-button d-inline-block d-lg-none">
            	<a href="#" class="site-menu-toggle py-5 js-menu-toggle text-black"><span class="icon-menu h3"></span></a>
            </div>

          </div>
        </div>
      </header>
<script src="<%=root%>../static/css"></script>	
<script src="<%=root%>../static/cjs"></script>	

<script src="<%=root%>/menu/js/jquery-3.3.1.min.js"></script>
<script src="<%=root%>/menu/js/popper.min.js"></script>
<script src="<%=root%>/menu/js/bootstrap.min.js"></script>
<script src="<%=root%>/menu/js/jquery.sticky.js"></script>
<script src="<%=root%>/menu/js/main.js"></script>
</body>
</html>