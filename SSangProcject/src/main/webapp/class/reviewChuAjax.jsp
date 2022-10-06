<%@page import="org.json.simple.JSONObject"%>
<%@page import="dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String review_num = request.getParameter("review_num");
ReviewDao rdao = new ReviewDao();
rdao.increChu(review_num);

int review_chu = rdao.getReview(review_num).getReview_chu();
JSONObject ob = new JSONObject();
ob.put("reivew_chu", review_chu);
%>
<%=ob.toString()%>