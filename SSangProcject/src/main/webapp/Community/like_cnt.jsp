<%@page import="dao.CommunityDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//num읽기
String bnum=request.getParameter("bnum");
//dao
CommunityDao dao=new CommunityDao();
//num 에 해당하는 chu증가
dao.updateLike_cnt(bnum);
//증가된 chu값 json으로 반환
int like_cnt=dao.getData(bnum).getLike_cnt();
JSONObject ob=new JSONObject();
ob.put("like_cnt", like_cnt);
%>
<%=ob.toString()%>