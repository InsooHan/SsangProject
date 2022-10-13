<%@page import="dao.QuestionDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

String num=request.getParameter("num");

QuestionDao dao=new QuestionDao();

dao.updatelikes(num);

response.sendRedirect("../index.jsp?main=qusans/qusan_listdetail.jsp?num="+num);

%>