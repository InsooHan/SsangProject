<%@page import="org.json.simple.JSONObject"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String id = request.getParameter("user_id");

	MemberDao dao = new MemberDao();
	int count = dao.isIdCheck(id);
	
	JSONObject ob = new JSONObject();
	ob.put("count", count);
%>
<%=ob.toString()%>