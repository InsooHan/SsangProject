<%@page import="dao.ClassDao"%>
<%@page import="dto.CartDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String class_num=request.getParameter("class_num");
String user_num=request.getParameter("user_num");

CartDto dto=new CartDto();
dto.setClass_num(class_num);
dto.setUser_num(user_num);

ClassDao dao=new ClassDao();
dao.insertCart(dto);
%>