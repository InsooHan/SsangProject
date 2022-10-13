<%@page import="dao.BoardAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

String idx=request.getParameter("idx");

BoardAnswerDao dao=new BoardAnswerDao();

dao.deleteAnswer(idx);

%>