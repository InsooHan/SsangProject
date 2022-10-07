<%@page import="dto.QusAnsAnswerDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.QusAnsAnswerDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.QusAnsDto"%>
<%@page import="dao.QusAnsDao"%>
<%@page import="db.DbConnect"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

    
<%
request.setCharacterEncoding("utf-8");

String part = request.getParameter("part");
String title = request.getParameter("title");

String cont = request.getParameter("cont");
    
    

Connection conn=null;
DbConnect db = new DbConnect();
try{
Class.forName("com.mysql.cj.jdbc.Driver");
conn = db.getConnection();
}catch(Exception e){
e.printStackTrace();
}


String sql ="insert into question(que_id,que_subject,que_content,que_date,que_chu) values(?,?,?,now(),0)";

try{	
	PreparedStatement pt = conn.prepareStatement(sql);  //전체 DB 갯수 구하기
	pt.setString(1, (String)(session.getAttribute("id")));
	pt.setString(2, title);
	pt.setString(3, cont);
	pt.executeUpdate();
}catch(SQLException e){
	e.printStackTrace();
}

//response.sendRedirect("questions.jsp");
%>
