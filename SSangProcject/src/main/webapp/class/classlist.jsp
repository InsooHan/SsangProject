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
.classification{
   cursor: pointer;
}
.filter{
   cursor: pointer;
   font-size: 0.9em;
}
</style>
</head>
<body>
<!-- 강의 분류 -->
<div class="container mt-3">
  <div class="btn-group-vertical">
    <button type="button" class="btn btn-light">전체 강의</button>
    <div class="btn-group">
      <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown">프로그래밍</button>
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
      <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown">네트워크</button>
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
      <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown">외국어</button>
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

<!-- 분류_DB만들고 추가로 -->
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
    <i class="fa fa-bars" aria-hidden="true"></i> <strong>필터 </strong>
    <input type="checkbox"> 입문</input>
    <input type="checkbox"> 초급</input>
    <input type="checkbox"> 중급 이상</input>
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

</div>
</body>
</html>