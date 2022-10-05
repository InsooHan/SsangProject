<%@page import="dao.ClassDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String cart_num=request.getParameter("cart_num");

ClassDao dao=new ClassDao();
dao.deleteCart(cart_num);
%>