<%@page import="org.json.simple.JSONObject"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

String num=request.getParameter("num");

BoardDao dao=new BoardDao();

dao.updateBoard_likes(num);

//증가된 chu 값을 JSON 형식으로 반환
int board_likes=dao.getData(num).getBoard_likes();

JSONObject ob=new JSONObject();

ob.put("board_likes",board_likes);
%>
<%=ob.toString()%>