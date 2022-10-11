<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Hi+Melody&family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">    
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
.btnlist{
border: 1px solid lightgray;
color: lightgrey;
cursor: pointer;
font-weight: bold;
font-size:1.2em;
text-align: center;
background-color: white;
border-radius: 5px;
height: 40px;
margin-right: 20px;
padding: 5px 15px 5px 15px;
}
.btnlist:hover{color: green;}
</style>
<title>Insert title here</title>
</head>
<body>
<div>
  <button class="btnlist">질문</button>
  <button class="btnlist">자유주제</button>
  <button class="btnlist">스터디</button>
</div>  
<div style="margin-top: 20px;">
<input type="text" value="" style="width: 350px; height: 40px; border: 1px solid lightgray;border-radius: 5px;">
<span class="glyphicon glyphicon-search" style="cursor: pointer; font-size: 1.6em;padding-top: 10px;color: gray;"></span>
</div>
</body>
</html>